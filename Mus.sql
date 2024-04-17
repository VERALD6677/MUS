CREATE TABLE `Musical_genres` (
  `id` SERIAL PRIMARY KEY AUTO_INCREMENT,
  `NameMusgen` VARCHAR(80) NOT NULL
);

CREATE TABLE `Executors` (
  `id` SERIAL PRIMARY KEY AUTO_INCREMENT,
  `NameExecut` VARCHAR(80) NOT NULL
);

CREATE TABLE `Musgen_Execut` (
  `musgen_id` INTEGER,
  `execut_id` INTEGER,
  PRIMARY KEY (`musgen_id`, `execut_id`)
);

CREATE TABLE `Albums` (
  `id` SERIAL PRIMARY KEY AUTO_INCREMENT,
  `NameAlbum` VARCHAR(80) NOT NULL,
  `YearAlbum` INTEGER
);

CREATE TABLE `Album_Executors` (
  `album_id` INTEGER,
  `execut_id` INTEGER,
  PRIMARY KEY (`album_id`, `execut_id`)
);

CREATE TABLE `Tracks` (
  `id` SERIAL PRIMARY KEY AUTO_INCREMENT,
  `album_id` INTEGER,
  `NameTrack` VARCHAR(40) NOT NULL,
  `Duration` INTEGER
);

CREATE TABLE `Collections` (
  `id` SERIAL PRIMARY KEY AUTO_INCREMENT,
  `NameCollect` VARCHAR(40) NOT NULL,
  `YearCollect` INTEGER
);

CREATE TABLE `Track_Collections` (
  `track_id` INTEGER,
  `collect_id` INTEGER,
  PRIMARY KEY (`track_id`, `collect_id`)
);

ALTER TABLE `Musgen_Execut` ADD FOREIGN KEY (`musgen_id`) REFERENCES `Musical_genres` (`id`);

ALTER TABLE `Musgen_Execut` ADD FOREIGN KEY (`execut_id`) REFERENCES `Executors` (`id`);

ALTER TABLE `Album_Executors` ADD FOREIGN KEY (`album_id`) REFERENCES `Albums` (`id`);

ALTER TABLE `Album_Executors` ADD FOREIGN KEY (`execut_id`) REFERENCES `Executors` (`id`);

ALTER TABLE `Tracks` ADD FOREIGN KEY (`album_id`) REFERENCES `Albums` (`id`);

ALTER TABLE `Track_Collections` ADD FOREIGN KEY (`track_id`) REFERENCES `Tracks` (`id`);

ALTER TABLE `Track_Collections` ADD FOREIGN KEY (`collect_id`) REFERENCES `Collections` (`id`);

