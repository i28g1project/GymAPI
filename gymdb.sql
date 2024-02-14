-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 14 Lut 2024, 09:47
-- Wersja serwera: 10.4.21-MariaDB
-- Wersja PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `gymdb`
--
CREATE DATABASE IF NOT EXISTS `gymdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci;
USE `gymdb`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `exercises`
--

CREATE TABLE `exercises` (
  `Id` int(11) NOT NULL,
  `Name` varchar(30) COLLATE utf8mb4_polish_ci NOT NULL,
  `Description` varchar(1000) COLLATE utf8mb4_polish_ci NOT NULL,
  `VideoLink` varchar(100) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `progresshistory`
--

CREATE TABLE `progresshistory` (
  `Id` int(11) NOT NULL,
  `recordDate` date NOT NULL,
  `BMI` float(3,1) NOT NULL,
  `Weight` float(4,1) NOT NULL,
  `UserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `trainingplans`
--

CREATE TABLE `trainingplans` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `Level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `trainingplansexercises`
--

CREATE TABLE `trainingplansexercises` (
  `PlanId` int(11) NOT NULL,
  `ExerciseId` int(11) NOT NULL,
  `Repetitions` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `Id` int(11) NOT NULL,
  `Name` varchar(30) COLLATE utf8mb4_polish_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `Password` varchar(30) COLLATE utf8mb4_polish_ci NOT NULL,
  `BirthYear` int(11) NOT NULL,
  `Male` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `userstrainingplans`
--

CREATE TABLE `userstrainingplans` (
  `UserId` int(11) NOT NULL,
  `PlanId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `exercises`
--
ALTER TABLE `exercises`
  ADD PRIMARY KEY (`Id`);

--
-- Indeksy dla tabeli `progresshistory`
--
ALTER TABLE `progresshistory`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `UserId` (`UserId`);

--
-- Indeksy dla tabeli `trainingplans`
--
ALTER TABLE `trainingplans`
  ADD PRIMARY KEY (`Id`);

--
-- Indeksy dla tabeli `trainingplansexercises`
--
ALTER TABLE `trainingplansexercises`
  ADD KEY `PlanId` (`PlanId`),
  ADD KEY `ExerciseId` (`ExerciseId`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indeksy dla tabeli `userstrainingplans`
--
ALTER TABLE `userstrainingplans`
  ADD KEY `PlanId` (`PlanId`),
  ADD KEY `UserId` (`UserId`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `exercises`
--
ALTER TABLE `exercises`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `progresshistory`
--
ALTER TABLE `progresshistory`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `trainingplans`
--
ALTER TABLE `trainingplans`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `progresshistory`
--
ALTER TABLE `progresshistory`
  ADD CONSTRAINT `progresshistory_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`);

--
-- Ograniczenia dla tabeli `trainingplansexercises`
--
ALTER TABLE `trainingplansexercises`
  ADD CONSTRAINT `trainingplansexercises_ibfk_1` FOREIGN KEY (`PlanId`) REFERENCES `trainingplans` (`Id`),
  ADD CONSTRAINT `trainingplansexercises_ibfk_2` FOREIGN KEY (`ExerciseId`) REFERENCES `exercises` (`Id`);

--
-- Ograniczenia dla tabeli `userstrainingplans`
--
ALTER TABLE `userstrainingplans`
  ADD CONSTRAINT `userstrainingplans_ibfk_1` FOREIGN KEY (`PlanId`) REFERENCES `trainingplans` (`Id`),
  ADD CONSTRAINT `userstrainingplans_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
