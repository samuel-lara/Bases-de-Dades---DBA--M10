CREATE TABLE `Socis` (
  `id` int PRIMARY KEY,
  `nom` varchar(150) NOT NULL,
  `direccio` varchar(200) NOT NULL,
  `telefon` varchar(20) NOT NULL,
  `data_alta` date NOT NULL
);

CREATE TABLE `TipusEmbarcacions` (
  `id` int PRIMARY KEY,
  `nom` varchar(10),
  `propulsio` varchar(10)
);

CREATE TABLE `Embarcacions` (
  `matricula` varchar(20) PRIMARY KEY,
  `nom` varchar(50) NOT NULL,
  `tipus` int NOT NULL,
  `manega` int NOT NULL,
  `eslora` int NOT NULL,
  `propietari` int NOT NULL,
  `amarre` int NOT NULL
);

CREATE TABLE `Amarres` (
  `id` int PRIMARY KEY,
  `dataAssignacio` date,
  `manteniment` ENUM ('SI', 'NO') NOT NULL
);

CREATE TABLE `Comptadors` (
  `id` int PRIMARY KEY,
  `tipus` ENUM ('AIGUA', 'LLUM') NOT NULL,
  `dataInici` date NOT NULL,
  `dataFinal` date NOT NULL,
  `lectura` double NOT NULL,
  `cost` int NOT NULL,
  `amarre` int
);

CREATE TABLE `EspecialitatsTreballadors` (
  `id` int PRIMARY KEY,
  `nom` varchar(150) NOT NULL
);

CREATE TABLE `Treballadors` (
  `id` int PRIMARY KEY,
  `nom` varchar(150) NOT NULL,
  `especialitat` int NOT NULL
);

CREATE TABLE `AmarresTreballadors` (
  `id` int PRIMARY KEY,
  `amarre` int NOT NULL,
  `treballador` int NOT NULL
);

ALTER TABLE `Embarcacions` ADD FOREIGN KEY (`tipus`) REFERENCES `TipusEmbarcacions` (`id`);

ALTER TABLE `Embarcacions` ADD FOREIGN KEY (`propietari`) REFERENCES `Socis` (`id`);

ALTER TABLE `Embarcacions` ADD FOREIGN KEY (`amarre`) REFERENCES `Amarres` (`id`);

ALTER TABLE `Comptadors` ADD FOREIGN KEY (`amarre`) REFERENCES `Amarres` (`id`);

ALTER TABLE `Treballadors` ADD FOREIGN KEY (`especialitat`) REFERENCES `EspecialitatsTreballadors` (`id`);

ALTER TABLE `AmarresTreballadors` ADD FOREIGN KEY (`amarre`) REFERENCES `Amarres` (`id`);

ALTER TABLE `AmarresTreballadors` ADD FOREIGN KEY (`treballador`) REFERENCES `Treballadors` (`id`);
