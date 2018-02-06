DROP SCHEMA IF EXISTS `javadevhm5`;
CREATE SCHEMA `javadevhm5`;
USE `javadevhm5`;

DROP TABLE IF EXISTS `roles`;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `products`;
DROP TABLE IF EXISTS `manufacturers`;

CREATE TABLE `roles` (
  `id` BINARY(16) NOT NULL UNIQUE,
  `name` VARCHAR(50) NOT NULL UNIQUE,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = Utf8;

CREATE TABLE `users` (
  `id` BINARY(16) NOT NULL UNIQUE,
  `email` VARCHAR(50) NOT NULL UNIQUE,
  `password` VARCHAR(50) NOT NULL,
  `first_name` VARCHAR(50),
  `last_name` VARCHAR(50),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = Utf8;

CREATE TABLE `users_roles` (
  `user_id` BINARY(16) NOT NULL UNIQUE,
  `role_id` BINARY(16) NOT NULL UNIQUE
) ENGINE = InnoDB DEFAULT CHARSET = Utf8;

CREATE TABLE `manufacturers` (
  `id` BINARY(16) NOT NULL UNIQUE,
  `name` VARCHAR(50) NOT NULL UNIQUE,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = Utf8;

CREATE TABLE `products` (
  `id` BINARY(16) NOT NULL UNIQUE,
  `name` VARCHAR(50) NOT NULL,
  `price` DECIMAL,
  `manufacturer_id` BINARY(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `products_name_manufacturer_id_uindex`(`name`, `manufacturer_id`),
  CONSTRAINT `fk_manufacturer_id`
  FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET = Utf8;