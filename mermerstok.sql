-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 13 Oca 2024, 09:57:20
-- Sunucu sürümü: 10.4.28-MariaDB
-- PHP Sürümü: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `mermerstok`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `mermer`
--

CREATE TABLE `mermer` (
  `MermerID` int(11) NOT NULL,
  `Ad` varchar(255) NOT NULL,
  `Renk` varchar(50) DEFAULT NULL,
  `Boyut` varchar(50) DEFAULT NULL,
  `Agirlik` decimal(10,2) DEFAULT NULL,
  `StokMiktari` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `mermer`
--

INSERT INTO `mermer` (`MermerID`, `Ad`, `Renk`, `Boyut`, `Agirlik`, `StokMiktari`) VALUES
(1, 'Kara Mermer', 'Siyah', '60x60', 12.00, 300),
(2, 'Beyaz Mermer', 'Beyaz', '40x40', 8.50, 200),
(3, 'Kahverengi Mermer', 'Kahverengi', '30x30', 10.20, 150),
(4, 'Gri Mermer', 'Gri', '50x50', 11.80, 180),
(5, 'Bej Mermer', 'Bej', '45x45', 9.50, 250);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `musteri`
--

CREATE TABLE `musteri` (
  `MusteriID` int(11) NOT NULL,
  `Ad` varchar(255) NOT NULL,
  `Adres` varchar(255) DEFAULT NULL,
  `Telefon` varchar(20) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `musteri`
--

INSERT INTO `musteri` (`MusteriID`, `Ad`, `Adres`, `Telefon`, `Email`) VALUES
(1, 'Ahmet Yılmaz', '123 Ana Caddesi, Şehirköy', '+905551234567', 'ahmet.yilmaz@example.com'),
(2, 'Ayşe Kaya', '456 Meşe Sokak, Kasabah', '+905558765432', 'ayse.kaya@example.com'),
(3, 'Mustafa Öztürk', '789 Çam Yolu, Köykasabası', '+905554433221', 'mustafa.ozturk@example.com'),
(4, 'Fatma Güneş', '321 Kayın Sokak, Köyceğiz', '+905550112233', 'fatma.gunes@example.com'),
(5, 'Mehmet Demir', '987 Sedir Caddesi, Belediyeköy', '+905559988877', 'mehmet.demir@example.com');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `musterimermer`
--

CREATE TABLE `musterimermer` (
  `MusteriID` int(11) NOT NULL,
  `MermerID` int(11) NOT NULL,
  `Miktar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `musterimermer`
--

INSERT INTO `musterimermer` (`MusteriID`, `MermerID`, `Miktar`) VALUES
(1, 1, 25),
(2, 2, 15),
(3, 3, 20),
(4, 4, 30),
(5, 5, 10);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `satisfatura`
--

CREATE TABLE `satisfatura` (
  `FaturaID` int(11) NOT NULL,
  `MusteriID` int(11) DEFAULT NULL,
  `Tarih` date DEFAULT NULL,
  `ToplamTutar` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `satisfatura`
--

INSERT INTO `satisfatura` (`FaturaID`, `MusteriID`, `Tarih`, `ToplamTutar`) VALUES
(1, 1, '2024-01-12', 1500.00),
(2, 2, '2024-01-13', 1200.50),
(3, 3, '2024-01-14', 900.25),
(4, 4, '2024-01-15', 1800.75),
(5, 5, '2024-01-16', 2000.00);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `stokyonetimi`
--

CREATE TABLE `stokyonetimi` (
  `MermerID` int(11) NOT NULL,
  `GirenMiktar` int(11) DEFAULT NULL,
  `CikanMiktar` int(11) DEFAULT NULL,
  `Tarih` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `stokyonetimi`
--

INSERT INTO `stokyonetimi` (`MermerID`, `GirenMiktar`, `CikanMiktar`, `Tarih`) VALUES
(1, 50, 20, '2024-01-12'),
(2, 30, 15, '2024-01-13'),
(3, 40, 25, '2024-01-14'),
(4, 25, 10, '2024-01-15'),
(5, 60, 30, '2024-01-16');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `mermer`
--
ALTER TABLE `mermer`
  ADD PRIMARY KEY (`MermerID`);

--
-- Tablo için indeksler `musteri`
--
ALTER TABLE `musteri`
  ADD PRIMARY KEY (`MusteriID`);

--
-- Tablo için indeksler `musterimermer`
--
ALTER TABLE `musterimermer`
  ADD PRIMARY KEY (`MusteriID`,`MermerID`),
  ADD KEY `MermerID` (`MermerID`);

--
-- Tablo için indeksler `satisfatura`
--
ALTER TABLE `satisfatura`
  ADD PRIMARY KEY (`FaturaID`),
  ADD KEY `MusteriID` (`MusteriID`);

--
-- Tablo için indeksler `stokyonetimi`
--
ALTER TABLE `stokyonetimi`
  ADD PRIMARY KEY (`MermerID`,`Tarih`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `mermer`
--
ALTER TABLE `mermer`
  MODIFY `MermerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `musteri`
--
ALTER TABLE `musteri`
  MODIFY `MusteriID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `satisfatura`
--
ALTER TABLE `satisfatura`
  MODIFY `FaturaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `musterimermer`
--
ALTER TABLE `musterimermer`
  ADD CONSTRAINT `musterimermer_ibfk_1` FOREIGN KEY (`MusteriID`) REFERENCES `musteri` (`MusteriID`),
  ADD CONSTRAINT `musterimermer_ibfk_2` FOREIGN KEY (`MermerID`) REFERENCES `mermer` (`MermerID`);

--
-- Tablo kısıtlamaları `satisfatura`
--
ALTER TABLE `satisfatura`
  ADD CONSTRAINT `satisfatura_ibfk_1` FOREIGN KEY (`MusteriID`) REFERENCES `musteri` (`MusteriID`);

--
-- Tablo kısıtlamaları `stokyonetimi`
--
ALTER TABLE `stokyonetimi`
  ADD CONSTRAINT `stokyonetimi_ibfk_1` FOREIGN KEY (`MermerID`) REFERENCES `mermer` (`MermerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
