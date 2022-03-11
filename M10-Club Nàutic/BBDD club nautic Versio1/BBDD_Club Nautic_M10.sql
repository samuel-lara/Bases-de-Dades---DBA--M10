CREATE TABLE `Socis` (
  `DNI_Soci` varchar(255) PRIMARY KEY NOT NULL,
  `Nom_Soci` varchar(255) NOT NULL,
  `Direccio_Soci` varchar(255) NOT NULL,
  `data_alta_Soci` date NOT NULL
);

CREATE TABLE `Embarcacions` (
  `Matricula_Embarcacio` varchar(255) PRIMARY KEY NOT NULL,
  `Nom_Embarcacio` varchar(255) NOT NULL,
  `Tipus_Embarcacio` varchar(255) NOT NULL,
  `Dimensio_Embarcacio` varchar(255) NOT NULL,
  `DNI_Soci` varchar(255) NOT NULL
);

CREATE TABLE `Amarres` (
  `Id_Amarre` varchar(255) PRIMARY KEY NOT NULL,
  `Comptador_Aigua` int NOT NULL,
  `Domptador_Llum` int NOT NULL,
  `Data_Amarre` date NOT NULL,
  `Manteniment_Amarre` boolean NOT NULL,
  `Matricula_Embarcacio` varchar(255) NOT NULL
);

CREATE TABLE `relacioTreballadorsAmarres` (
  `Id_Amarre` varchar(255) NOT NULL,
  `Codi_Treballador` varchar(255) NOT NULL
);

CREATE TABLE `Treballadors` (
  `Codi_Treballador` varchar(255) PRIMARY KEY NOT NULL,
  `Nom_Treballador` varchar(255) NOT NULL,
  `Direccio_Treballador` varchar(255) NOT NULL,
  `Codi_Especialitat` varchar(255) NOT NULL
);

CREATE TABLE `Especialitat` (
  `Codi_Especialitat` varchar(255) PRIMARY KEY NOT NULL
);

ALTER TABLE `Amarres` ADD FOREIGN KEY (`Matricula_Embarcacio`) REFERENCES `Embarcacions` (`Matricula_Embarcacio`);

ALTER TABLE `relacioTreballadorsAmarres` ADD FOREIGN KEY (`Id_Amarre`) REFERENCES `Amarres` (`Id_Amarre`);

ALTER TABLE `relacioTreballadorsAmarres` ADD FOREIGN KEY (`Codi_Treballador`) REFERENCES `Treballadors` (`Codi_Treballador`);

ALTER TABLE `Especialitat` ADD FOREIGN KEY (`Codi_Especialitat`) REFERENCES `Treballadors` (`Codi_Especialitat`);

ALTER TABLE `Embarcacions` ADD FOREIGN KEY (`DNI_Soci`) REFERENCES `Socis` (`DNI_Soci`);
