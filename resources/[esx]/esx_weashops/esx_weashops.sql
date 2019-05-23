USE `essentialmode`;

CREATE TABLE `weashops` (

  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,

  PRIMARY KEY (`id`)
);

INSERT INTO `licenses` (type, label) VALUES
  ('weapon', "Permis de port d'arme")
;

INSERT INTO `items` (`name`, `label`) VALUES 
('clip', 'Chargeur'),
('yusuf', 'Yusuf'),
('grip', 'Grip'),
('flashlight', 'Flashlight'),
('silencieux', 'Silencer')
;


INSERT INTO `weashops` (name, item, price) VALUES
	('GunShop','WEAPON_PISTOL',300),
	('BlackWeashop','WEAPON_PISTOL',500),
	('GunShop', 'WEAPON_FLASHLIGHT', 60),
	('BlackWeashop', 'WEAPON_FLASHLIGHT', 70),
	('GunShop', 'WEAPON_MACHETE', 90),
	('BlackWeashop', 'WEAPON_MACHETE', 110),
	('GunShop', 'WEAPON_NIGHTSTICK', 150),
	('BlackWeashop', 'WEAPON_NIGHTSTICK', 150),
	('GunShop', 'WEAPON_BAT', 100),
	('BlackWeashop', 'WEAPON_BAT', 100),
	('GunShop', 'WEAPON_MICROSMG', 45000),
	('BlackWeashop', 'WEAPON_MICROSMG', 45000),
	('GunShop', 'WEAPON_PUMPSHOTGUN', 25000),
	('BlackWeashop', 'WEAPON_PUMPSHOTGUN', 25000),
	('GunShop', 'WEAPON_ASSAULTRIFLE', 85000),
	('BlackWeashop', 'WEAPON_ASSAULTRIFLE', 85000),
	('GunShop', 'WEAPON_SPECIALCARBINE', 95000),
	('BlackWeashop', 'WEAPON_SPECIALCARBINE', 95000),
	('GunShop', 'WEAPON_SNIPERRIFLE', 110000),
	('BlackWeashop', 'WEAPON_SNIPERRIFLE', 110000),
	('GunShop', 'WEAPON_FIREWORK', 30000),
	('BlackWeashop', 'WEAPON_FIREWORK', 30000),
	('GunShop', 'WEAPON_FIREEXTINGUISHER', 100),
	('BlackWeashop', 'WEAPON_FIREEXTINGUISHER', 100),
	('GunShop', 'WEAPON_BALL', 50),
	('BlackWeashop', 'WEAPON_BALL', 50),
	('GunShop', 'WEAPON_SMOKEGRENADE', 100)
;
