<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nomeFilme = $_POST["nome_filme"];
    
    // Substitua 'SUA_CHAVE_API' pela chave de API real fornecida pelo TMDb
    $apiKey = '484105089aaf4e6b8a1908b30fbfaad7';
    
    // Consulta para buscar o ID do filme
    $urlBusca = "https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=" . urlencode($nomeFilme);

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $urlBusca);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $responseBusca = curl_exec($ch);
    curl_close($ch);

    if ($responseBusca) {
        $filmeBusca = json_decode($responseBusca, true);

        if (isset($filmeBusca['results'][0]['id'])) {
            $filmeId = $filmeBusca['results'][0]['id'];
            
            // Consulta para obter informações detalhadas, incluindo a sinopse em português
            $urlDetalhes = "https://api.themoviedb.org/3/movie/$filmeId?api_key=$apiKey&language=pt-BR";

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $urlDetalhes);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            $responseDetalhes = curl_exec($ch);
            curl_close($ch);

            if ($responseDetalhes) {
                $filmeDetalhes = json_decode($responseDetalhes, true);

                if (isset($filmeDetalhes['overview'])) {
                    $sinopse = $filmeDetalhes['overview'];

                    // Consulta para obter informações de créditos do filme
                    $urlCreditos = "https://api.themoviedb.org/3/movie/$filmeId/credits?api_key=$apiKey";

                    $ch = curl_init();
                    curl_setopt($ch, CURLOPT_URL, $urlCreditos);
                    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                    $responseCreditos = curl_exec($ch);
                    curl_close($ch);

                    if ($responseCreditos) {
                        $creditos = json_decode($responseCreditos, true);

                        // Extrai o diretor
                        $diretor = "";
                        foreach ($creditos['crew'] as $crew) {
                            if ($crew['job'] === 'Director') {
                                $diretor = $crew['name'];
                                break;
                            }
                        }

                        // Extrai o elenco
                        $elenco = array_column($creditos['cast'], 'name');
                        $elencoConcatenado = implode(", ", $elenco); // Concatena os nomes do elenco

                        $anoLancamento = $filmeDetalhes['release_date']; // Obtém a data de lançamento
                        $bilheteria = number_format($filmeDetalhes['revenue'], 2, ',', '.'); // Formata o valor da bilheteria

                        // Substitua as configurações do banco de dados conforme necessário
                        $host = "localhost";
                        $usuario = "root";
                        $senha = "";
                        $bancoDados = "consultafilmes";

                        // Conexão com o banco de dados
                        $conexao = new mysqli($host, $usuario, $senha, $bancoDados);

                        // Verifica se houve erro na conexão
                        if ($conexao->connect_error) {
                            die("Erro de conexão: " . $conexao->connect_error);
                        }

                        // Escapa os dados antes de inserir no banco de dados
                        $nomeFilme = $conexao->real_escape_string($nomeFilme);
                        $sinopse = $conexao->real_escape_string($sinopse);
                        $diretor = $conexao->real_escape_string($diretor);
                        $anoLancamento = $conexao->real_escape_string($anoLancamento);
                        $bilheteria = $conexao->real_escape_string($bilheteria);
                        $elencoConcatenado = $conexao->real_escape_string($elencoConcatenado);

                        // Insere os dados na tabela do banco de dados
                        $sql = "INSERT INTO filmes (nome_filme, sinopse, diretor, ano_lancamento, bilheteria, elenco) 
                                VALUES ('$nomeFilme', '$sinopse', '$diretor', '$anoLancamento', '$bilheteria', '$elencoConcatenado')";

                        if ($conexao->query($sql) === TRUE) {
                            // Não exibe mensagem de confirmação
                        } else {
                            echo "Erro ao inserir dados: " . $conexao->error . "<br>";
                        }

                        $conexao->close();

                        echo "<p>Sinopse: $sinopse</p>";
                        echo "<p>Diretor: $diretor</p>";
                        echo "<p>Ano de Lançamento: $anoLancamento</p>";
                        echo "<p>Bilheteria: U$ $bilheteria</p>";
                        echo "<p>Elenco: $elencoConcatenado</p>";
                    } else {
                        echo "<p>Erro ao buscar informações de créditos do filme</p>";
                    }
                } else {
                    echo "<p>Sinopse não encontrada</p>";
                }
            } else {
                echo "<p>Erro ao buscar informações detalhadas do filme</p>";
            }
        } else {
            echo "<p>Filme não encontrado</p>";
        }
    } else {
        echo "<p>Erro ao buscar informações do filme</p>";
    }
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Consulta de Filme</title>
</head>
<body>
    <form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
        <label for="nome_filme">Digite o nome do filme:</label>
        <input type="text" id="nome_filme" name="nome_filme" required>
        <button type="submit">Consultar</button>
    </form>
</body>
</html>
