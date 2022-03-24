CREATE TABLE `cotxe` (
  `Id_Cotxe` int PRIMARY KEY NOT NULL,
  `Model_Cotxe` varchar(255) NOT NULL,
  `Marca_cotxe` varchar(255) NOT NULL,
  `Cilindrada_cotxe` varchar(255) NOT NULL
);

CREATE TABLE `Opcions` (
  `Id_Opcio` int PRIMARY KEY NOT NULL,
  `Nom_Opcio` varchar(255) NOT NULL,
  `Descripcio_Opcio` varchar(255) NOT NULL
);

CREATE TABLE `Clients` (
  `DNI_Client` varchar(255) PRIMARY KEY NOT NULL,
  `Nom_client` varchar(255) NOT NULL,
  `Direccio_client` varchar(255) NOT NULL,
  `Telefon_client` int NOT NULL
);

CREATE TABLE `Venedor` (
  `DNI_Venedor` varchar(255) PRIMARY KEY NOT NULL,
  `Nom_venedor` varchar(255) NOT NULL,
  `Direccio_venedor` varchar(255) NOT NULL,
  `Telefon_venedor` int NOT NULL
);

CREATE TABLE `Factura` (
  `Num_Factura` varchar(255) PRIMARY KEY NOT NULL,
  `Data` date NOT NULL,
  `Direccio` varchar(255) NOT NULL,
  `Telefon` int NOT NULL,
  `DNI_Client` varchar(255) NOT NULL,
  `DNI_Venedor` varchar(255) NOT NULL
);

CREATE TABLE `Detalls_Factura` (
  `Id_detall` int PRIMARY KEY NOT NULL,
  `Id_opcio_vehicle` int NOT NULL,
  `Num_Factura` varchar(255) NOT NULL,
  `Preu` int NOT NULL
);

CREATE TABLE `opcions_vehicle` (
  `Id_opcio_vehicle` int PRIMARY KEY NOT NULL,
  `Id_Cotxe` int NOT NULL,
  `Id_Opcio` int NOT NULL,
  `Quantitat` int NOT NULL,
  `preu` int NOT NULL
);

ALTER TABLE `opcions_vehicle` ADD FOREIGN KEY (`Id_Cotxe`) REFERENCES `cotxe` (`Id_Cotxe`);

ALTER TABLE `Detalls_Factura` ADD FOREIGN KEY (`Id_opcio_vehicle`) REFERENCES `opcions_vehicle` (`Id_opcio_vehicle`);

ALTER TABLE `Detalls_Factura` ADD FOREIGN KEY (`Num_Factura`) REFERENCES `Factura` (`Num_Factura`);

ALTER TABLE `Factura` ADD FOREIGN KEY (`DNI_Venedor`) REFERENCES `Venedor` (`DNI_Venedor`);

ALTER TABLE `Factura` ADD FOREIGN KEY (`DNI_Client`) REFERENCES `Clients` (`DNI_Client`);

ALTER TABLE `opcions_vehicle` ADD FOREIGN KEY (`Id_Opcio`) REFERENCES `Opcions` (`Id_Opcio`);
