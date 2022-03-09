CREATE TABLE `cotxe` (
  `Model_Cotxe` varchar(255) PRIMARY KEY NOT NULL,
  `Marca` varchar(255) NOT NULL,
  `Cilindrada` varchar(255) NOT NULL,
  `Preu` int NOT NULL
);

CREATE TABLE `Opcions` (
  `Id_Opcio` varchar(255) PRIMARY KEY NOT NULL,
  `Nom_Opcio` varchar(255) NOT NULL,
  `Descripcio_Opcio` varchar(255) NOT NULL,
  `Preu_Opcio` int NOT NULL
);

CREATE TABLE `Clients` (
  `DNI` varchar(255) PRIMARY KEY NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Direccio` varchar(255) NOT NULL,
  `Telefon` int NOT NULL
);

CREATE TABLE `Venedor` (
  `DNI` varchar(255) PRIMARY KEY NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Direccio` varchar(255) NOT NULL,
  `Telefon` int NOT NULL
);

CREATE TABLE `Factura` (
  `Num_Factura` varchar(255) PRIMARY KEY NOT NULL,
  `Data` date NOT NULL,
  `Direccio` varchar(255) NOT NULL,
  `Telefon` int NOT NULL
);

CREATE TABLE `Linies_Factura` (
  `Quantitat_Preu_Factura` int PRIMARY KEY NOT NULL
);

CREATE TABLE `opcions_vehicle` (
  `Quantitat` int PRIMARY KEY NOT NULL,
  `preu` int NOT NULL
);

ALTER TABLE `opcions_vehicle` ADD FOREIGN KEY (`Quantitat`) REFERENCES `cotxe` (`Model_Cotxe`);

ALTER TABLE `opcions_vehicle` ADD FOREIGN KEY (`Quantitat`) REFERENCES `Opcions` (`Id_Opcio`);

ALTER TABLE `Linies_Factura` ADD FOREIGN KEY (`Quantitat_Preu_Factura`) REFERENCES `opcions_vehicle` (`Quantitat`);

ALTER TABLE `Factura` ADD FOREIGN KEY (`Num_Factura`) REFERENCES `Venedor` (`DNI`);

ALTER TABLE `Factura` ADD FOREIGN KEY (`Num_Factura`) REFERENCES `Clients` (`DNI`);

ALTER TABLE `Factura` ADD FOREIGN KEY (`Num_Factura`) REFERENCES `Linies_Factura` (`Quantitat_Preu_Factura`);
