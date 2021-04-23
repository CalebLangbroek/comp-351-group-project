-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2021 at 01:14 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `comp351final`
--

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `title`, `body`) VALUES
(1, 'Test Title 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec sapien pharetra, accumsan nulla eget, tempus orci. In feugiat ac mi sed pharetra. Etiam aliquet erat vel neque dictum fermentum. Nam quis lacus risus. Sed volutpat pulvinar tincidunt. Fusce vitae ipsum faucibus, maximus erat at, fermentum ante. Curabitur quis lorem massa. Proin viverra neque in velit commodo interdum. Nunc rhoncus nisi tellus, ut aliquam lorem dapibus et. Maecenas lacinia dignissim nulla, vitae vestibulum libero euismod quis.\r\n\r\nCras sed mattis sapien, sed porttitor turpis. Phasellus convallis tortor et commodo egestas. Donec at ligula quis nibh bibendum condimentum. Etiam aliquam eleifend ipsum. Sed sodales, velit eget malesuada posuere, arcu massa ornare elit, ut elementum mauris tortor vitae velit. Mauris vitae placerat mauris. Sed luctus tempor sapien quis laoreet. Donec convallis nulla turpis, vel ullamcorper sapien bibendum nec. Integer in ante non tellus interdum luctus ultricies sed urna. Nunc eget enim eu sem mollis porttitor sit amet quis nisi. Vestibulum a dui laoreet, lobortis arcu ut, pulvinar justo. Etiam in arcu tristique, ultrices purus elementum, pharetra velit. Etiam rutrum venenatis mauris, ut maximus elit feugiat vehicula. Duis laoreet volutpat mollis. Aenean libero dui, aliquet vel turpis sit amet, rutrum posuere sapien. Sed varius magna libero, eu tempor urna maximus sed.\r\n\r\nVestibulum sit amet lectus vitae risus fermentum placerat id non orci. Sed nisl diam, facilisis ut sem vel, scelerisque vulputate nisl. Aliquam gravida lorem rutrum lectus commodo commodo. Sed vitae sodales massa. Phasellus sem turpis, laoreet in fringilla vel, egestas sit amet tellus. Mauris semper sem a lacus laoreet facilisis. Integer elit sapien, ultricies at ligula vitae, laoreet placerat erat. Ut ut quam ex. Nunc vitae justo est. Ut lectus lorem, rutrum at nulla at, finibus pretium arcu. Nam vitae justo eget mi ornare lacinia. Integer turpis turpis, faucibus efficitur mollis vel, pellentesque vitae sem. Nam non blandit massa, vitae convallis massa. Fusce lorem quam, rutrum eu tortor non, porttitor ornare mauris. Maecenas et malesuada elit, eu pellentesque lacus.\r\n\r\nNulla vitae enim ut velit posuere rhoncus in a lectus. Quisque libero massa, posuere nec laoreet eget, pretium ut tortor. Proin sit amet suscipit nisl. Mauris non erat eu ante porta volutpat vitae id turpis. Sed non porta felis. Curabitur maximus ipsum ipsum, nec pharetra turpis imperdiet sed. Aenean vehicula, purus in bibendum sodales, est eros efficitur felis, ut elementum elit nisi sit amet mi. Vivamus dignissim libero sapien, quis sodales leo dictum sed. Sed elementum ante a sem euismod aliquam blandit et nunc. Quisque rhoncus id ligula commodo fringilla. Maecenas consequat sapien enim, vel auctor velit ultrices non. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\r\n\r\nPraesent in congue lorem, eget luctus mauris. Donec risus ex, eleifend quis ullamcorper sed, tincidunt molestie risus. Integer suscipit magna sed nunc accumsan placerat. Nullam ex neque, sagittis a maximus eu, vehicula et dui. Nulla porttitor ac felis eu interdum. Proin id sagittis turpis, aliquet viverra justo. Aliquam et porttitor orci. In vel risus et sem tempus lacinia. Mauris mattis eget tellus nec efficitur. Maecenas euismod tortor ipsum, non accumsan lorem condimentum at. Quisque facilisis sem nec tortor porttitor vestibulum. Lorem ipsum dolor sit amet, consectetur adipiscing elit.');

-- --------------------------------------------------------

--
-- Table structure for table `statistics`
--

CREATE TABLE `statistics` (
  `method` varchar(50) NOT NULL,
  `endpoint` varchar(255) NOT NULL,
  `requests` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `statistics`
--

INSERT INTO `statistics` (`method`, `endpoint`, `requests`) VALUES
('GET', '/api/v1/note/noteId', 1),
('GET', '/api/v1/notes', 39),
('POST', '/api/v1/admin', 6),
('POST', '/api/v1/notes', 2),
('PUT', '/api/v1/note/noteId', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`method`,`endpoint`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
