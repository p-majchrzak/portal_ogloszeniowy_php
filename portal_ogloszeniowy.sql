-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Lis 03, 2023 at 08:58 PM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `portal_ogloszeniowy`
--
CREATE DATABASE IF NOT EXISTS `portal_ogloszeniowy` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `portal_ogloszeniowy`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dane_uzytkownika`
--

CREATE TABLE `dane_uzytkownika` (
  `dane_uzytkownika_id` int(10) NOT NULL,
  `imie` varchar(15) NOT NULL,
  `nazwisko` varchar(30) NOT NULL,
  `data_urodzenia` date NOT NULL,
  `miejsce_zamieszkania` text NOT NULL,
  `email` text NOT NULL,
  `numer_telefonu` decimal(9,0) NOT NULL,
  `zawod` text NOT NULL,
  `opis` text NOT NULL,
  `link_od_zdjecia` text NOT NULL,
  `uzytkownik_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dni_pracy`
--

CREATE TABLE `dni_pracy` (
  `dni_pracy_id` int(10) NOT NULL,
  `poniedzialek` tinyint(1) NOT NULL,
  `wtorek` tinyint(1) NOT NULL,
  `sroda` tinyint(1) NOT NULL,
  `czwartek` tinyint(1) NOT NULL,
  `piatek` tinyint(1) NOT NULL,
  `sobota` tinyint(1) NOT NULL,
  `niedziala` tinyint(1) NOT NULL,
  `ogloszenie_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `doswiadczenie`
--

CREATE TABLE `doswiadczenie` (
  `doswiadczenie_id` int(10) NOT NULL,
  `stanowisko` text NOT NULL,
  `firma` text NOT NULL,
  `lokalizacja` date NOT NULL,
  `obowiazki` text NOT NULL,
  `poczatek_pracy` date NOT NULL,
  `koniec_koniec` text NOT NULL,
  `uzytkownik_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `edukacja`
--

CREATE TABLE `edukacja` (
  `edukacja_id` int(10) NOT NULL,
  `nazwa_szkoly` text NOT NULL,
  `miasto` text NOT NULL,
  `poziom_wyksztalcenia` text NOT NULL,
  `kierunek` text NOT NULL,
  `poczatek_nauki` date NOT NULL,
  `koniec_nauki` date NOT NULL,
  `uzytkownik_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `firma`
--

CREATE TABLE `firma` (
  `firma_id` int(10) NOT NULL,
  `nazwa` text NOT NULL,
  `opis` text NOT NULL,
  `adres` text NOT NULL,
  `lokalizacja` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `jezyki`
--

CREATE TABLE `jezyki` (
  `jezyk_id` int(10) NOT NULL,
  `jezyk` text NOT NULL,
  `poziom` enum('A1','A2','B1','B2','C1','C2') NOT NULL,
  `uzytkownik_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategoria`
--

CREATE TABLE `kategoria` (
  `kategoria_id` int(10) NOT NULL,
  `nazwa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `linki`
--

CREATE TABLE `linki` (
  `linki_id` int(10) NOT NULL,
  `adres_linku` text NOT NULL,
  `uzytkownik_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ogloszenie`
--

CREATE TABLE `ogloszenie` (
  `ogloszenie_id` int(10) NOT NULL,
  `stanowisko` text NOT NULL,
  `poziom_stanowiska` enum('praktykant/stażysta','asystent','młodszy specjalista (junior)','specjalista (mid)','starszy specjalista (senior)','ekspert','kierownik/koordynator','menedżer','dyrektor','prezes') NOT NULL,
  `rodzaj_umowy` enum('umowa o pracę','umowa o dzieło','umowa zlecenie','B2B','zastępstwo','staż/praktyka') NOT NULL,
  `wymiar_pracy` enum('część etatu','cały etat','dodatkowa/tymczasowa') NOT NULL,
  `tryb_pracy` enum('stacjonarna','hybrydowa','zdalna') NOT NULL,
  `godziny_pracy` text NOT NULL,
  `termin_wygasniecia` date NOT NULL,
  `obowiazki` text NOT NULL,
  `wymagania` text NOT NULL,
  `korzysci` int(11) NOT NULL,
  `firma_id` int(10) NOT NULL,
  `kategoria_id` int(10) NOT NULL,
  `podkategoria_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `podkategoria`
--

CREATE TABLE `podkategoria` (
  `podkategoria_id` int(10) NOT NULL,
  `nazwa` text NOT NULL,
  `kategoria_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `szkolenia`
--

CREATE TABLE `szkolenia` (
  `szkolenie_id` int(10) NOT NULL,
  `tytul_szkolenia` text NOT NULL,
  `opis_szkolenia` text NOT NULL,
  `organizator` text NOT NULL,
  `poczatek_szkolenia` date NOT NULL,
  `koniec_szkolenia` date NOT NULL,
  `uzytkownik_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `umiejetnosci`
--

CREATE TABLE `umiejetnosci` (
  `umiejetnosci_id` int(10) NOT NULL,
  `umiejetnosc` text NOT NULL,
  `uzytkownik_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uprawnienia`
--

CREATE TABLE `uprawnienia` (
  `uprawnienia_id` int(10) NOT NULL,
  `rodzaj_uprawnienia` enum('administrator','uzytkownik','firma') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownik`
--

CREATE TABLE `uzytkownik` (
  `uzytkownik_id` int(10) NOT NULL,
  `login` text NOT NULL,
  `haslo` text NOT NULL,
  `uprawnienia_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zgloszenie`
--

CREATE TABLE `zgloszenie` (
  `zgloszenie_id` int(10) NOT NULL,
  `uzytkownik_id` int(10) NOT NULL,
  `ogloszenie_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `dane_uzytkownika`
--
ALTER TABLE `dane_uzytkownika`
  ADD PRIMARY KEY (`dane_uzytkownika_id`),
  ADD KEY `uzytkownik_id` (`uzytkownik_id`);

--
-- Indeksy dla tabeli `dni_pracy`
--
ALTER TABLE `dni_pracy`
  ADD PRIMARY KEY (`dni_pracy_id`),
  ADD KEY `ogloszenie_id` (`ogloszenie_id`);

--
-- Indeksy dla tabeli `doswiadczenie`
--
ALTER TABLE `doswiadczenie`
  ADD PRIMARY KEY (`doswiadczenie_id`),
  ADD KEY `uzytkownik_id` (`uzytkownik_id`);

--
-- Indeksy dla tabeli `edukacja`
--
ALTER TABLE `edukacja`
  ADD PRIMARY KEY (`edukacja_id`),
  ADD KEY `uzytkownik_id` (`uzytkownik_id`);

--
-- Indeksy dla tabeli `firma`
--
ALTER TABLE `firma`
  ADD PRIMARY KEY (`firma_id`);

--
-- Indeksy dla tabeli `jezyki`
--
ALTER TABLE `jezyki`
  ADD PRIMARY KEY (`jezyk_id`),
  ADD KEY `uzytkownik_id` (`uzytkownik_id`);

--
-- Indeksy dla tabeli `kategoria`
--
ALTER TABLE `kategoria`
  ADD PRIMARY KEY (`kategoria_id`);

--
-- Indeksy dla tabeli `linki`
--
ALTER TABLE `linki`
  ADD PRIMARY KEY (`linki_id`),
  ADD KEY `uzytkownik_id` (`uzytkownik_id`);

--
-- Indeksy dla tabeli `ogloszenie`
--
ALTER TABLE `ogloszenie`
  ADD PRIMARY KEY (`ogloszenie_id`),
  ADD KEY `firma_id` (`firma_id`,`kategoria_id`,`podkategoria_id`),
  ADD KEY `kategoria_id` (`kategoria_id`),
  ADD KEY `podkategoria_id` (`podkategoria_id`);

--
-- Indeksy dla tabeli `podkategoria`
--
ALTER TABLE `podkategoria`
  ADD PRIMARY KEY (`podkategoria_id`),
  ADD KEY `kategoria` (`kategoria_id`);

--
-- Indeksy dla tabeli `szkolenia`
--
ALTER TABLE `szkolenia`
  ADD PRIMARY KEY (`szkolenie_id`),
  ADD KEY `uzytkownik_id` (`uzytkownik_id`);

--
-- Indeksy dla tabeli `umiejetnosci`
--
ALTER TABLE `umiejetnosci`
  ADD PRIMARY KEY (`umiejetnosci_id`),
  ADD KEY `uzytkownik_id` (`uzytkownik_id`);

--
-- Indeksy dla tabeli `uprawnienia`
--
ALTER TABLE `uprawnienia`
  ADD PRIMARY KEY (`uprawnienia_id`);

--
-- Indeksy dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD PRIMARY KEY (`uzytkownik_id`),
  ADD KEY `uprawnienia` (`uprawnienia_id`);

--
-- Indeksy dla tabeli `zgloszenie`
--
ALTER TABLE `zgloszenie`
  ADD PRIMARY KEY (`zgloszenie_id`),
  ADD KEY `uzytkownik_id` (`uzytkownik_id`,`ogloszenie_id`),
  ADD KEY `ogloszenie_id` (`ogloszenie_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dane_uzytkownika`
--
ALTER TABLE `dane_uzytkownika`
  MODIFY `dane_uzytkownika_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dni_pracy`
--
ALTER TABLE `dni_pracy`
  MODIFY `dni_pracy_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doswiadczenie`
--
ALTER TABLE `doswiadczenie`
  MODIFY `doswiadczenie_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `edukacja`
--
ALTER TABLE `edukacja`
  MODIFY `edukacja_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `firma`
--
ALTER TABLE `firma`
  MODIFY `firma_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jezyki`
--
ALTER TABLE `jezyki`
  MODIFY `jezyk_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategoria`
--
ALTER TABLE `kategoria`
  MODIFY `kategoria_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `linki`
--
ALTER TABLE `linki`
  MODIFY `linki_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ogloszenie`
--
ALTER TABLE `ogloszenie`
  MODIFY `ogloszenie_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `podkategoria`
--
ALTER TABLE `podkategoria`
  MODIFY `podkategoria_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `szkolenia`
--
ALTER TABLE `szkolenia`
  MODIFY `szkolenie_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `umiejetnosci`
--
ALTER TABLE `umiejetnosci`
  MODIFY `umiejetnosci_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uprawnienia`
--
ALTER TABLE `uprawnienia`
  MODIFY `uprawnienia_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uzytkownik`
--
ALTER TABLE `uzytkownik`
  MODIFY `uzytkownik_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zgloszenie`
--
ALTER TABLE `zgloszenie`
  MODIFY `zgloszenie_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dane_uzytkownika`
--
ALTER TABLE `dane_uzytkownika`
  ADD CONSTRAINT `dane_uzytkownika_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dni_pracy`
--
ALTER TABLE `dni_pracy`
  ADD CONSTRAINT `dni_pracy_ibfk_1` FOREIGN KEY (`ogloszenie_id`) REFERENCES `ogloszenie` (`ogloszenie_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doswiadczenie`
--
ALTER TABLE `doswiadczenie`
  ADD CONSTRAINT `doswiadczenie_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `edukacja`
--
ALTER TABLE `edukacja`
  ADD CONSTRAINT `edukacja_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `firma`
--
ALTER TABLE `firma`
  ADD CONSTRAINT `firma_ibfk_1` FOREIGN KEY (`firma_id`) REFERENCES `ogloszenie` (`firma_id`) ON UPDATE CASCADE;

--
-- Constraints for table `jezyki`
--
ALTER TABLE `jezyki`
  ADD CONSTRAINT `jezyki_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kategoria`
--
ALTER TABLE `kategoria`
  ADD CONSTRAINT `kategoria_ibfk_1` FOREIGN KEY (`kategoria_id`) REFERENCES `podkategoria` (`kategoria_id`);

--
-- Constraints for table `linki`
--
ALTER TABLE `linki`
  ADD CONSTRAINT `linki_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ogloszenie`
--
ALTER TABLE `ogloszenie`
  ADD CONSTRAINT `ogloszenie_ibfk_1` FOREIGN KEY (`kategoria_id`) REFERENCES `kategoria` (`kategoria_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ogloszenie_ibfk_2` FOREIGN KEY (`podkategoria_id`) REFERENCES `podkategoria` (`podkategoria_id`) ON UPDATE NO ACTION;

--
-- Constraints for table `uprawnienia`
--
ALTER TABLE `uprawnienia`
  ADD CONSTRAINT `uprawnienia_ibfk_1` FOREIGN KEY (`uprawnienia_id`) REFERENCES `uzytkownik` (`uprawnienia_id`);

--
-- Constraints for table `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD CONSTRAINT `uzytkownik_ibfk_1` FOREIGN KEY (`uprawnienia_id`) REFERENCES `szkolenia` (`uzytkownik_id`),
  ADD CONSTRAINT `uzytkownik_ibfk_2` FOREIGN KEY (`uzytkownik_id`) REFERENCES `umiejetnosci` (`uzytkownik_id`) ON DELETE CASCADE;

--
-- Constraints for table `zgloszenie`
--
ALTER TABLE `zgloszenie`
  ADD CONSTRAINT `zgloszenie_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`),
  ADD CONSTRAINT `zgloszenie_ibfk_2` FOREIGN KEY (`ogloszenie_id`) REFERENCES `ogloszenie` (`ogloszenie_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
