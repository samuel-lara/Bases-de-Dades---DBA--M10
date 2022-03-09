CREATE TABLE `ObraMusical` (
  `id_Obra` int PRIMARY KEY,
  `Nom` varchar(255),
  `Autor` varchar(255),
  `Genere` varchar(255)
);

CREATE TABLE `Interpretacio` (
  `id_interpretacio` int PRIMARY KEY,
  `Data_interpretacio` datetime
);

CREATE TABLE `Relacio_obra_interpretacio` (
  `id_Obra` int,
  `id_interpretacio` int
);

CREATE TABLE `Instruments` (
  `id_instrument` int PRIMARY KEY,
  `nom_instrument` varchar(255)
);

CREATE TABLE `Relacio_obra_instrument` (
  `id_Obra` int,
  `id_instrument` int
);

ALTER TABLE `Relacio_obra_interpretacio` ADD FOREIGN KEY (`id_interpretacio`) REFERENCES `Interpretacio` (`id_interpretacio`);

ALTER TABLE `Relacio_obra_interpretacio` ADD FOREIGN KEY (`id_Obra`) REFERENCES `ObraMusical` (`id_Obra`);

ALTER TABLE `Relacio_obra_instrument` ADD FOREIGN KEY (`id_Obra`) REFERENCES `ObraMusical` (`id_Obra`);

ALTER TABLE `Relacio_obra_instrument` ADD FOREIGN KEY (`id_instrument`) REFERENCES `Instruments` (`id_instrument`);
