-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02/12/2023 às 04:08
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `consultafilmes`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `filmes`
--

CREATE TABLE `filmes` (
  `id` int(11) NOT NULL,
  `nome_filme` varchar(255) NOT NULL,
  `sinopse` text DEFAULT NULL,
  `diretor` varchar(255) DEFAULT NULL,
  `ano_lancamento` year(4) DEFAULT NULL,
  `bilheteria` decimal(10,2) DEFAULT NULL,
  `elenco` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `filmes`
--

INSERT INTO `filmes` (`id`, `nome_filme`, `sinopse`, `diretor`, `ano_lancamento`, `bilheteria`, `elenco`) VALUES
(2, 'Avatar', 'Apesar de não ter mais os movimentos da perna, o ex-fuzileiro naval Jake Sully ainda sente que pode ser um guerreiro. Sua intuição começa a se tornar realidade quando ele viaja anos-luz até a estação espacial montada no Planeta Pandora. Habitado por grandes seres azuis, os Na´vi, o local tem uma atmosfera fatal para qualquer terrestre. Por isso, oficiais criaram o programa Avatar, em que um corpo biológico, híbrido de humano e Na´vi, pode ser comandado a distância.', 'James Cameron', '2009', 2.92, 'Sam Worthington, Zoe Saldaña, Stephen Lang, Michelle Rodriguez, Sigourney Weaver, Giovanni Ribisi, Joel David Moore, CCH Pounder, Wes Studi, Laz Alonso, Dileep Rao, Matt Gerald, Sean Anthony Moran, Jason Whyte, Scott Lawrence, Kelly Kilgour, James Patrick Pitt, Sean Patrick Murphy, Peter Dillon, Kevin Dorman, Kelson Henderson, David Van Horn, Jacob Tomuri, Michael Blain-Rozgay, Jon Curry, Julene Renee, Luke Hawker, Woody Schultz, Peter Mensah, Sonia Yee, Jahnel Curfman, Ilram Choi, Kyla Warren, Alicia Vela-Bailey, Kyle Dryberg, Larry Rew, Dina Morrone, Rodney Cook'),
(4, 'Homens de Preto', 'J já viu coisas inexplicáveis em seus quinze anos com os Homens de Preto, porém, nada, nem mesmo alienígenas o deixam mais perplexo que seu parceiro irônico e reticente. Mas quando a vida de K e o destino do planeta estão em jogo, o agente J terá de viajar no tempo, no passado, para acertar as coisas. J descobre que o universo tem segredos que K nunca contou a ele – segredos que acabarão se revelando quando ele se unir ao jovem agente K para salvar seu parceiro, a agência e o futuro da humanidade.', 'Barry Sonnenfeld', '2012', 624.03, 'Will Smith, Tommy Lee Jones, Josh Brolin, Jemaine Clement, Emma Thompson, Michael Stuhlbarg, Mike Colter, Nicole Scherzinger, Michael Chernus, Alice Eve, David Rasche, Keone Young, Bill Hader, Cayen Martin, Clarke Thorell, Adam Mucci, Tom McComas, Douglas Crosby, Woodie King Jr., Jack O\'Connell, Tobias Segal, Jon Shaver, Gerritt Vandermeer, Alexandra O\'Hara, Violet O\'Hara, Valence Thomas, Chloe Sonnenfeld, Lanny Flaherty, Jonathan O\'Hara, Rick Baker, Joseph D\'Onofrio, Joseph R. Gannascoli, Katy Frame, Kevin Townley, Stephen Brian Jones, Tyler Johnson, Kati Rediger, Victor Joel Ortiz, Charlie Barnett, Ian Blackman, Jeremy Beiler, Liliane Klein, Britt Chandler Johnson, Jared Johnston, Ken Arnold, Jonathan Drew, Joel Brady, David Pittu, Lenny Venito, Anthony J. Gallo, James Martin Kelly, Will McLaughlin, Kimmy Suzuki, Kirk Larsen, Rebecca Glasscock, Barry Sonnenfeld, Susan Ringo, Stephanie Ellis, Ben Mac Brown, Amy Erwitt, Brad Abrell, Tim Blaney, Thom Fountain, Carl J. Johnson, Will Arnett, Jada Pinkett Smith, Tony Shalhoub, Alex Ziwak, Jason Liles, Jesse Ridgway, Justin Bieber, Erin Lindsey Krom, Tim Burton, Eha Urbsalu'),
(7, 'Iron Man', 'Tony Stark é um industrial bilionário, que também é um brilhante inventor. Ao ser sequestrado ele é obrigado por terroristas a construir uma arma devastadora mas, ao invés disto, constrói uma armadura de alta tecnologia que permite que fuja de seu cativeiro. A partir de então ele passa a usá-la para combater o crime, sob o alter ego do Homem de Ferro.', 'Jon Favreau', '2008', 585.17, 'Robert Downey Jr., Terrence Howard, Jeff Bridges, Gwyneth Paltrow, Leslie Bibb, Bill Smitrovich, Paul Bettany, Jon Favreau, Shaun Toub, Faran Tahir, Clark Gregg, Peter Billingsley, Sayed Badreya, Tim Guinee, Will Lyman, Tom Morello, Marco Khan, Daston Kalili, Ido Mor, Kevin Foster, Garret Noël, Eileen Weisinger, Ahmed Ahmed, Fahim Fazli, Gerard Sanders, Tim Rigby, Russell Richardson, Nazanin Boniadi, Thomas Craig Plumer, Robert Berkman, Stacy Stas Hurst, Lauren Scyphers, Frank Nyi, Marvin Jordan, Jim Cramer, Donna Evans, Reid Harper, Summer Kylie Remington, Ava Rose Williams, Vladimir Kubr, Callie Croughwell, Javan Tahir, Sahar Bibiyan, Patrick O\'Connell, Adam Harrington, Meera Simhan, Ben Newmark, Ricki Lander, Jeannine Kaspar, Sarah Cahill, Stan Lee, Justin Rex, Zorianna Kit, Lana Kinnear, Nicole Lindeblad, Masha Lund, Gabrielle Tuite, Tim Griffin, Joshua Harto, Micah A. Hauptman, James Bethea, Mike Cochrane, Flavia Manes Rossi, Samuel L. Jackson, Kristin J. Hooper');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `filmes`
--
ALTER TABLE `filmes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `filmes`
--
ALTER TABLE `filmes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
