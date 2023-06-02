-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema books_sql_schema
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `books_sql_schema` ;

-- -----------------------------------------------------
-- Schema books_sql_schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `books_sql_schema` DEFAULT CHARACTER SET utf8mb3 ;
USE `books_sql_schema` ;

-- -----------------------------------------------------
-- Table `books_sql_schema`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `books_sql_schema`.`books` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL DEFAULT NULL,
  `num_of_pages` INT NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 30
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `books_sql_schema`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `books_sql_schema`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NULL DEFAULT NULL,
  `last_name` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `books_sql_schema`.`favorites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `books_sql_schema`.`favorites` (
  `user_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `book_id`),
  INDEX `fk_users_has_books_books1_idx` (`book_id` ASC) VISIBLE,
  INDEX `fk_users_has_books_users_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_books_books1`
    FOREIGN KEY (`book_id`)
    REFERENCES `books_sql_schema`.`books` (`id`),
  CONSTRAINT `fk_users_has_books_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `books_sql_schema`.`users` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
