-- -------------------------------------------------------------
-- TablePlus 5.8.2(528)
--
-- https://tableplus.com/
--
-- Database: NodeJs39_BaiTap_01
-- Generation Time: 2024-01-16 20:00:46.8250
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(100) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `descrip` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` date DEFAULT NULL,
  `like_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`like_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `order_code` varchar(50) DEFAULT NULL,
  `arr_sub_id` varchar(50) DEFAULT NULL,
  `order_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` date DEFAULT NULL,
  `rate_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`rate_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `descrip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(100) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pass_word` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `descrip`, `type_id`) VALUES
(1, 'Dragon Fire Ramen', 'dragon_fire_ramen.jpg', 10.99, 'Spicy ramen with dragon breath broth', 1),
(2, 'Chocolate Explosion Cake', 'chocolate_explosion_cake.jpg', 12.99, 'Rich chocolate cake with molten lava center', 2),
(3, 'Sizzling Sriracha Wings', 'sizzling_sriracha_wings.jpg', 8.99, 'Crispy chicken wings coated in tangy Sriracha sauce', 3),
(4, 'Gourmet Truffle Burger', 'gourmet_truffle_burger.jpg', 15.99, 'Juicy beef burger with truffle-infused toppings', 4),
(5, 'Mystical Unicorn Sundae', 'mystical_unicorn_sundae.jpg', 7.99, 'Colorful ice cream sundae with edible unicorn horn', 1),
(6, 'Spaghetti Carbonara Tower', 'spaghetti_carbonara_tower.jpg', 11.99, 'Twisted spaghetti tower with creamy carbonara sauce', 2),
(7, 'Enchanted Forest Salad', 'enchanted_forest_salad.jpg', 9.99, 'Fresh salad with mystical greens from the enchanted forest', 3),
(8, 'Phantom Pepperoni Pizza', 'phantom_pepperoni_pizza.jpg', 14.99, 'Classic pepperoni pizza with a ghostly twist', 4),
(9, 'Galactic Galaxy Donut', 'galactic_galaxy_donut.jpg', 18.99, 'Glazed donut adorned with edible galaxy-inspired decorations', 1),
(10, 'Mango Tango Sushi Roll', 'mango_tango_sushi_roll.jpg', 16.99, 'Sushi roll with a tropical mango twist', 2),
(11, 'Fire-breathing Dragon Curry', 'fire_breathing_dragon_curry.jpg', 13.99, 'Spicy curry that packs a fiery punch', 3),
(12, 'Heavenly Cloud Soufflé', 'heavenly_cloud_souffle.jpg', 10.99, 'Light and airy soufflé with a touch of heavenly sweetness', 4),
(13, 'Whimsical Watermelon Salad', 'whimsical_watermelon_salad.jpg', 11.99, 'Refreshing salad featuring whimsical watermelon shapes', 1),
(14, 'Black Magic Chocolate Truffles', 'black_magic_chocolate_truffles.jpg', 14.99, 'Decadent chocolate truffles with a touch of black magic', 2),
(15, 'Cauldron Brewed Potion', 'cauldron_brewed_potion.jpg', 16.99, 'Magical potion brewed in a bubbling cauldron', 3),
(16, 'Rainbow Unicorn Cupcake', 'rainbow_unicorn_cupcake.jpg', 9.99, 'Cupcake adorned with rainbow-colored unicorn mane', 4),
(17, 'Panda Bamboo Shoot Dumplings', 'panda_bamboo_shoot_dumplings.jpg', 12.99, 'Adorable panda-shaped dumplings filled with bamboo shoots', 1),
(18, 'Extraterrestrial Ice Cream Cone', 'extraterrestrial_ice_cream_cone.jpg', 15.99, 'Ice cream cone featuring flavors from another galaxy', 2);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Savory Delights'),
(2, 'Sweet Indulgences'),
(3, 'Spicy Adventures'),
(4, 'Comfort Classics');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`, `like_id`) VALUES
(3, 1, '2023-01-04', 4),
(5, 3, '2023-01-05', 5),
(6, 3, '2023-01-06', 6),
(7, 4, '2023-01-07', 7),
(8, 4, '2023-01-08', 8),
(9, 1, '2023-01-09', 9),
(10, 2, '2023-01-10', 10),
(3, 3, '2023-01-11', 11),
(12, 1, '2023-01-12', 12),
(1, 3, '2023-01-13', 13),
(2, 3, '2023-01-14', 14),
(3, 4, '2023-01-15', 15),
(3, 1, '2023-01-16', 16),
(5, 3, '2023-01-17', 17),
(6, 3, '2023-01-18', 18),
(3, 4, '2023-01-19', 19),
(6, 1, '2023-01-20', 20);

INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `order_code`, `arr_sub_id`, `order_id`) VALUES
(2, 3, 1, 'ORDER124', 'SUB124', 2),
(3, 5, 3, 'ORDER125', 'SUB125', 3),
(4, 8, 2, 'ORDER126', 'SUB126', 4),
(5, 8, 1, 'ORDER127', 'SUB127', 5),
(6, 11, 4, 'ORDER128', 'SUB128', 6),
(7, 11, 2, 'ORDER129', 'SUB129', 7),
(8, 17, 3, 'ORDER130', 'SUB130', 8),
(9, 18, 1, 'ORDER131', 'SUB131', 9),
(10, 2, 3, 'ORDER132', 'SUB132', 10),
(11, 3, 2, 'ORDER133', 'SUB133', 11),
(12, 4, 1, 'ORDER134', 'SUB134', 12),
(1, 15, 4, 'ORDER135', 'SUB135', 13),
(2, 15, 2, 'ORDER136', 'SUB136', 14),
(3, 4, 3, 'ORDER137', 'SUB137', 15),
(4, 1, 1, 'ORDER138', 'SUB138', 16),
(5, 12, 3, 'ORDER139', 'SUB139', 17),
(6, 3, 2, 'ORDER140', 'SUB140', 18),
(7, 4, 1, 'ORDER141', 'SUB141', 19),
(8, 1, 2, 'ORDER142', 'SUB142', 20),
(9, 2, 3, 'ORDER143', 'SUB143', 21),
(10, 3, 1, 'ORDER144', 'SUB144', 22),
(11, 14, 4, 'ORDER145', 'SUB145', 23),
(12, 1, 2, 'ORDER146', 'SUB146', 24),
(1, 3, 3, 'ORDER147', 'SUB147', 25),
(2, 4, 1, 'ORDER148', 'SUB148', 26),
(3, 1, 2, 'ORDER149', 'SUB149', 27),
(4, 2, 4, 'ORDER150', 'SUB150', 28),
(1, 2, 5, NULL, NULL, 30);

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`, `rate_id`) VALUES
(1, 1, 4, '2023-01-01', 1),
(3, 1, 3, '2023-01-03', 3),
(4, 1, 4, '2023-01-04', 4),
(5, 3, 5, '2023-01-05', 5),
(6, 3, 4, '2023-01-06', 6),
(7, 4, 3, '2023-01-07', 7),
(8, 4, 5, '2023-01-08', 8),
(10, 1, 3, '2023-01-09', 9),
(12, 2, 4, '2023-01-10', 10),
(13, 3, 5, '2023-01-11', 11),
(12, 3, 3, '2023-01-12', 12),
(1, 4, 4, '2024-01-16', 31);

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `descrip`) VALUES
(1, 'Pho 2000', 'pho_2000.jpg', 'Famous for delicious pho noodle soup'),
(2, 'Nha Hang Ngon', 'nha_hang_ngon.jpg', 'A popular spot for Vietnamese street food'),
(3, 'The Deck Saigon', 'the_deck_saigon.jpg', 'Riverside restaurant with a serene atmosphere'),
(4, 'Ngo 8', 'lusine_leloi.jpg', 'Chic French-inspired cafe and restaurant');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Extra Avocado', 1.5, 1),
(2, 'Spicy Mayo Drizzle', 0.75, 1),
(3, 'Garlic Butter Sauce', 1, 2),
(4, 'Extra Cheese', 2, 2),
(5, 'Protein Booster', 3, 3),
(6, 'Vitamin C Blast', 2.5, 3),
(7, 'Double Chocolate Drizzle', 1.25, 4),
(8, 'Caramel Swirl', 1, 4),
(9, 'Extra Spicy Kick', 1, 5),
(10, 'Teriyaki Glaze', 1.5, 5),
(11, 'Fresh Basil Topping', 0.5, 6),
(12, 'Sesame Seed Sprinkle', 0.75, 6),
(13, 'Mixed Berries', 1.5, 7),
(14, 'Honey Yogurt Drizzle', 1, 7),
(15, 'Crispy Onion Strings', 1.25, 8),
(16, 'Garlic Aioli Dip', 1, 8),
(17, 'Balsamic Reduction', 1.5, 9);

INSERT INTO `users` (`user_id`, `full_name`, `email`, `pass_word`) VALUES
(1, 'John Doe', 'john.doe@email.com', 'password1'),
(2, 'Jane Smith', 'jane.smith@email.com', 'password2'),
(3, 'Bob Johnson', 'bob.johnson@email.com', 'password3'),
(4, 'Alice Brown', 'alice.brown@email.com', 'password4'),
(5, 'Charlie Davis', 'charlie.davis@email.com', 'password5'),
(6, 'Eva White', 'eva.white@email.com', 'password6'),
(7, 'David Lee', 'david.lee@email.com', 'password7'),
(8, 'Grace Miller', 'grace.miller@email.com', 'password8'),
(9, 'Frank Wilson', 'frank.wilson@email.com', 'password9'),
(10, 'Helen Moore', 'helen.moore@email.com', 'password10'),
(11, 'George Taylor', 'george.taylor@email.com', 'password11'),
(12, 'Ivy Robinson', 'ivy.robinson@email.com', 'password12'),
(13, 'Jack Harris', 'jack.harris@email.com', 'password13'),
(14, 'Katherine Clark', 'katherine.clark@email.com', 'password14'),
(15, 'Liam Turner', 'liam.turner@email.com', 'password15');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;