CREATE TABLE `Alumnes` (
  `DNI_Alumne` varchar(255) PRIMARY KEY NOT NULL,
  `Matricula_Alumne` varchar(255) NOT NULL,
  `Nom_Alumne` varchar(255) NOT NULL,
  `id_treball` varchar(255) NOT NULL
);

CREATE TABLE `Treball` (
  `id_treball` varchar(255) PRIMARY KEY NOT NULL,
  `Tema_treball` varchar(255) NOT NULL,
  `data_Inici_treball` date NOT NULL,
  `DNI_professor` varchar(255) NOT NULL
);

CREATE TABLE `Professors` (
  `DNI_professor` varchar(255) PRIMARY KEY NOT NULL,
  `Nom_professor` varchar(255) NOT NULL,
  `Direccio_professor` varchar(255) NOT NULL,
  `Departament_professor` varchar(255) NOT NULL
);

CREATE TABLE `RelacioProfessorsTribunals` (
  `DNI_professor` varchar(255) NOT NULL,
  `id_Tribunal` varchar(255) NOT NULL
);

CREATE TABLE `Tribunal` (
  `id_Tribunal` varchar(255) PRIMARY KEY NOT NULL,
  `Lloc` varchar(255) NOT NULL,
  `numeroComponents` int NOT NULL
);

ALTER TABLE `Treball` ADD FOREIGN KEY (`id_treball`) REFERENCES `Alumnes` (`id_treball`);

ALTER TABLE `Treball` ADD FOREIGN KEY (`DNI_professor`) REFERENCES `Professors` (`DNI_professor`);

ALTER TABLE `RelacioProfessorsTribunals` ADD FOREIGN KEY (`DNI_professor`) REFERENCES `Professors` (`DNI_professor`);

ALTER TABLE `RelacioProfessorsTribunals` ADD FOREIGN KEY (`id_Tribunal`) REFERENCES `Tribunal` (`id_Tribunal`);
