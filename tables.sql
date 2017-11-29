CREATE TABLE `ims`.`item` (
  `itemID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`itemID`));

CREATE TABLE `ims`.`itemarchive` (
  `itemid` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `date` DATE NULL,
  PRIMARY KEY (`itemid`));

CREATE DEFINER=`root`@`localhost` TRIGGER `ims`.`item_AFTER_DELETE` AFTER DELETE ON `item` FOR EACH ROW
BEGIN
  INSERT INTO itemarchive(itemid,name,date) VALUES (old.itemid, old.name,curdate());
END

CREATE TABLE `ims`.`members` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `uname` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `regdate` date NOT NULL,
  PRIMARY KEY  (`id`));

CREATE TABLE `ims`.`supplier` (
  `itemid` INT NULL,
  `suppliername` VARCHAR(45) NULL,
  `contact` VARCHAR(45) NULL,
    FOREIGN KEY (`itemid`)
    REFERENCES `ims`.`item` (`itemID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);

CREATE TABLE `ims`.`price` (
  `itemid` INT NULL,
  `price` INT NULL,
    FOREIGN KEY (`itemid`)
    REFERENCES `ims`.`item` (`itemID`)
    ON DELETE CASCADE);

CREATE TABLE `ims`.`stock` (
  `itemid` INT NULL,
  `quantity` INT NULL,
    FOREIGN KEY (`itemid`)
    REFERENCES `ims`.`item` (`itemID`)
    ON DELETE CASCADE);

DROP procedure IF EXISTS `summary`;

DELIMITER $$
USE `ims`$$
CREATE PROCEDURE `summary` ()
BEGIN
select i.itemid, i.name, s.suppliername, p.price, st.quantity
from item i,supplier s, price p, stock st
where i.itemid=s.itemid and
i.itemid=s.itemid and 
i.itemid = p.itemid and 
i.itemid = st.itemid;
END$$

DELIMITER ;

--Item Table
insert into item (itemid, name) values (1, '1500');
insert into item (itemid, name) values (2, 'Freestar');
insert into item (itemid, name) values (3, '300TE');
insert into item (itemid, name) values (4, 'Santa Fe');
insert into item (itemid, name) values (5, 'SL-Class');
insert into item (itemid, name) values (6, 'RAV4');
insert into item (itemid, name) values (7, 'GranSport');
insert into item (itemid, name) values (8, 'Ranger');
insert into item (itemid, name) values (9, 'Express 2500');
insert into item (itemid, name) values (10, 'Aspen');
insert into item (itemid, name) values (11, 'Savana 3500');
insert into item (itemid, name) values (12, 'Express 2500');
insert into item (itemid, name) values (13, 'Tundra');
insert into item (itemid, name) values (14, 'Bravada');
insert into item (itemid, name) values (15, 'Outback');
insert into item (itemid, name) values (16, '900');
insert into item (itemid, name) values (17, 'Ram 1500 Club');
insert into item (itemid, name) values (18, '2500');
insert into item (itemid, name) values (19, 'MKS');
insert into item (itemid, name) values (20, '5 Series');
insert into item (itemid, name) values (21, 'Spectra');
insert into item (itemid, name) values (22, 'X5');
insert into item (itemid, name) values (23, 'F-Series');
insert into item (itemid, name) values (24, 'Impreza');
insert into item (itemid, name) values (25, 'Aspen');
insert into item (itemid, name) values (26, 'GS');
insert into item (itemid, name) values (27, 'A6');
insert into item (itemid, name) values (28, 'RX Hybrid');
insert into item (itemid, name) values (29, 'Range Rover');
insert into item (itemid, name) values (30, 'Tercel');
insert into item (itemid, name) values (31, 'Camry');
insert into item (itemid, name) values (32, 'Safari');
insert into item (itemid, name) values (33, 'C8');
insert into item (itemid, name) values (34, 'Sierra 2500');
insert into item (itemid, name) values (35, 'Rondo');
insert into item (itemid, name) values (36, 'Cabriolet');
insert into item (itemid, name) values (37, 'Ram 2500');
insert into item (itemid, name) values (38, 'Montero Sport');
insert into item (itemid, name) values (39, '4000CS Quattro');
insert into item (itemid, name) values (40, 'Range Rover');
insert into item (itemid, name) values (41, 'Santa Fe');
insert into item (itemid, name) values (42, 'F350');
insert into item (itemid, name) values (43, 'Windstar');
insert into item (itemid, name) values (44, 'Park Avenue');
insert into item (itemid, name) values (45, 'LX');
insert into item (itemid, name) values (46, 'Sidekick');
insert into item (itemid, name) values (47, 'S60');
insert into item (itemid, name) values (48, 'LS');
insert into item (itemid, name) values (49, 'Sonata');
insert into item (itemid, name) values (50, 'Horizon');
insert into item (itemid, name) values (51, 'M6');
insert into item (itemid, name) values (52, 'Sienna');
insert into item (itemid, name) values (53, '2500');
insert into item (itemid, name) values (54, 'RL');
insert into item (itemid, name) values (55, 'Tribute');
insert into item (itemid, name) values (56, 'Yukon XL 1500');
insert into item (itemid, name) values (57, 'GS');
insert into item (itemid, name) values (58, 'GTI');
insert into item (itemid, name) values (59, 'Reliant');
insert into item (itemid, name) values (60, 'Avalanche 1500');
insert into item (itemid, name) values (61, 'Santa Fe');
insert into item (itemid, name) values (62, 'Lancer');
insert into item (itemid, name) values (63, 'Echo');
insert into item (itemid, name) values (64, 'Quest');
insert into item (itemid, name) values (65, 'Pajero');
insert into item (itemid, name) values (66, 'CR-V');
insert into item (itemid, name) values (67, 'SJ');
insert into item (itemid, name) values (68, 'Cabriolet');
insert into item (itemid, name) values (69, 'FF');
insert into item (itemid, name) values (70, 'A3');
insert into item (itemid, name) values (71, 'MKX');
insert into item (itemid, name) values (72, 'V40');
insert into item (itemid, name) values (73, 'Vision');
insert into item (itemid, name) values (74, 'Navigator');
insert into item (itemid, name) values (75, 'Navigator');
insert into item (itemid, name) values (76, 'CLK-Class');
insert into item (itemid, name) values (77, 'Regal');
insert into item (itemid, name) values (78, 'Quattroporte');
insert into item (itemid, name) values (79, 'CTS');
insert into item (itemid, name) values (80, 'Versa');
insert into item (itemid, name) values (81, 'LR2');
insert into item (itemid, name) values (82, 'Jetta III');
insert into item (itemid, name) values (83, '6000');
insert into item (itemid, name) values (84, 'Q');
insert into item (itemid, name) values (85, 'Tribute');
insert into item (itemid, name) values (86, 'F250');
insert into item (itemid, name) values (87, 'LR4');
insert into item (itemid, name) values (88, 'Santa Fe');
insert into item (itemid, name) values (89, 'PT Cruiser');
insert into item (itemid, name) values (90, '200SX');
insert into item (itemid, name) values (91, 'Escort');
insert into item (itemid, name) values (92, 'Range Rover');
insert into item (itemid, name) values (93, 'XC70');
insert into item (itemid, name) values (94, 'HHR');
insert into item (itemid, name) values (95, 'RX-7');
insert into item (itemid, name) values (96, 'Viper');
insert into item (itemid, name) values (97, 'RX');
insert into item (itemid, name) values (98, 'Titan');
insert into item (itemid, name) values (99, 'W201');
insert into item (itemid, name) values (100, 'Town Car');


--supplier table
insert into supplier (itemid, suppliername, contact) values (1, 'Toyota', '392-745-1054');
insert into supplier (itemid, suppliername, contact) values (2, 'Pontiac', '254-410-5597');
insert into supplier (itemid, suppliername, contact) values (3, 'Pontiac', '187-713-3444');
insert into supplier (itemid, suppliername, contact) values (4, 'Mercedes-Benz', '258-584-1653');
insert into supplier (itemid, suppliername, contact) values (5, 'Lexus', '947-565-9112');
insert into supplier (itemid, suppliername, contact) values (6, 'Pontiac', '261-272-1048');
insert into supplier (itemid, suppliername, contact) values (7, 'GMC', '766-267-0775');
insert into supplier (itemid, suppliername, contact) values (8, 'Pontiac', '607-263-6058');
insert into supplier (itemid, suppliername, contact) values (9, 'GMC', '534-208-0525');
insert into supplier (itemid, suppliername, contact) values (10, 'Subaru', '747-401-2074');
insert into supplier (itemid, suppliername, contact) values (11, 'Cadillac', '614-524-9032');
insert into supplier (itemid, suppliername, contact) values (12, 'Oldsmobile', '782-322-6692');
insert into supplier (itemid, suppliername, contact) values (13, 'Lexus', '312-169-4692');
insert into supplier (itemid, suppliername, contact) values (14, 'Bentley', '113-709-4990');
insert into supplier (itemid, suppliername, contact) values (15, 'GMC', '138-515-5240');
insert into supplier (itemid, suppliername, contact) values (16, 'Mitsubishi', '682-533-7975');
insert into supplier (itemid, suppliername, contact) values (17, 'MG', '390-776-4538');
insert into supplier (itemid, suppliername, contact) values (18, 'GMC', '584-704-3109');
insert into supplier (itemid, suppliername, contact) values (19, 'Plymouth', '627-489-6891');
insert into supplier (itemid, suppliername, contact) values (20, 'Buick', '292-660-5940');
insert into supplier (itemid, suppliername, contact) values (21, 'Dodge', '258-173-6976');
insert into supplier (itemid, suppliername, contact) values (22, 'Mercedes-Benz', '955-826-4910');
insert into supplier (itemid, suppliername, contact) values (23, 'Kia', '511-768-2982');
insert into supplier (itemid, suppliername, contact) values (24, 'Ford', '819-678-5339');
insert into supplier (itemid, suppliername, contact) values (25, 'Mercedes-Benz', '231-741-0560');
insert into supplier (itemid, suppliername, contact) values (26, 'Audi', '581-963-2416');
insert into supplier (itemid, suppliername, contact) values (27, 'Toyota', '237-731-5050');
insert into supplier (itemid, suppliername, contact) values (28, 'Land Rover', '177-239-4690');
insert into supplier (itemid, suppliername, contact) values (29, 'Mazda', '599-362-9394');
insert into supplier (itemid, suppliername, contact) values (30, 'Chrysler', '831-284-5999');
insert into supplier (itemid, suppliername, contact) values (31, 'Ford', '114-141-4412');
insert into supplier (itemid, suppliername, contact) values (32, 'Buick', '967-586-3252');
insert into supplier (itemid, suppliername, contact) values (33, 'Ford', '537-926-1328');
insert into supplier (itemid, suppliername, contact) values (34, 'Saab', '694-636-1588');
insert into supplier (itemid, suppliername, contact) values (35, 'GMC', '430-349-1846');
insert into supplier (itemid, suppliername, contact) values (36, 'BMW', '140-684-7157');
insert into supplier (itemid, suppliername, contact) values (37, 'Honda', '160-213-1341');
insert into supplier (itemid, suppliername, contact) values (38, 'Honda', '679-914-0099');
insert into supplier (itemid, suppliername, contact) values (39, 'GMC', '186-588-8922');
insert into supplier (itemid, suppliername, contact) values (40, 'GMC', '998-380-9508');
insert into supplier (itemid, suppliername, contact) values (41, 'BMW', '736-354-0823');
insert into supplier (itemid, suppliername, contact) values (42, 'Kia', '121-226-4376');
insert into supplier (itemid, suppliername, contact) values (43, 'Buick', '973-428-1537');
insert into supplier (itemid, suppliername, contact) values (44, 'Ford', '313-246-5975');
insert into supplier (itemid, suppliername, contact) values (45, 'Suzuki', '247-152-8522');
insert into supplier (itemid, suppliername, contact) values (46, 'Chevrolet', '754-210-2033');
insert into supplier (itemid, suppliername, contact) values (47, 'Cadillac', '399-599-5951');
insert into supplier (itemid, suppliername, contact) values (48, 'GMC', '441-488-1995');
insert into supplier (itemid, suppliername, contact) values (49, 'Infiniti', '620-668-9154');
insert into supplier (itemid, suppliername, contact) values (50, 'Volvo', '617-673-8447');
insert into supplier (itemid, suppliername, contact) values (51, 'Cadillac', '425-584-6029');
insert into supplier (itemid, suppliername, contact) values (52, 'Cadillac', '623-456-7936');
insert into supplier (itemid, suppliername, contact) values (53, 'GMC', '817-854-3879');
insert into supplier (itemid, suppliername, contact) values (54, 'Chevrolet', '796-338-7555');
insert into supplier (itemid, suppliername, contact) values (55, 'Maybach', '575-488-8955');
insert into supplier (itemid, suppliername, contact) values (56, 'Audi', '281-158-8776');
insert into supplier (itemid, suppliername, contact) values (57, 'Buick', '159-931-3394');
insert into supplier (itemid, suppliername, contact) values (58, 'Audi', '873-273-7089');
insert into supplier (itemid, suppliername, contact) values (59, 'Maserati', '118-395-6383');
insert into supplier (itemid, suppliername, contact) values (60, 'Mercury', '223-533-9650');
insert into supplier (itemid, suppliername, contact) values (61, 'GMC', '266-562-3138');
insert into supplier (itemid, suppliername, contact) values (62, 'Lamborghini', '120-416-1265');
insert into supplier (itemid, suppliername, contact) values (63, 'Scion', '303-773-9671');
insert into supplier (itemid, suppliername, contact) values (64, 'Dodge', '130-228-1680');
insert into supplier (itemid, suppliername, contact) values (65, 'Volvo', '266-479-5965');
insert into supplier (itemid, suppliername, contact) values (66, 'GMC', '229-494-8519');
insert into supplier (itemid, suppliername, contact) values (67, 'Infiniti', '415-306-4504');
insert into supplier (itemid, suppliername, contact) values (68, 'Dodge', '795-487-6358');
insert into supplier (itemid, suppliername, contact) values (69, 'Hyundai', '463-383-1551');
insert into supplier (itemid, suppliername, contact) values (70, 'Eagle', '313-900-8595');
insert into supplier (itemid, suppliername, contact) values (71, 'Hyundai', '763-213-1886');
insert into supplier (itemid, suppliername, contact) values (72, 'Mitsubishi', '487-815-3365');
insert into supplier (itemid, suppliername, contact) values (73, 'Hyundai', '422-137-8398');
insert into supplier (itemid, suppliername, contact) values (74, 'Chevrolet', '146-624-0111');
insert into supplier (itemid, suppliername, contact) values (75, 'Holden', '530-329-2082');
insert into supplier (itemid, suppliername, contact) values (76, 'Kia', '754-482-4643');
insert into supplier (itemid, suppliername, contact) values (77, 'Ford', '734-810-6335');
insert into supplier (itemid, suppliername, contact) values (78, 'Jaguar', '965-472-7310');
insert into supplier (itemid, suppliername, contact) values (79, 'Volvo', '872-694-3572');
insert into supplier (itemid, suppliername, contact) values (80, 'Subaru', '887-105-3789');
insert into supplier (itemid, suppliername, contact) values (81, 'Toyota', '367-526-1392');
insert into supplier (itemid, suppliername, contact) values (82, 'Toyota', '942-293-6282');
insert into supplier (itemid, suppliername, contact) values (83, 'Pontiac', '495-125-7201');
insert into supplier (itemid, suppliername, contact) values (84, 'Daewoo', '187-365-8859');
insert into supplier (itemid, suppliername, contact) values (85, 'Dodge', '779-953-0483');
insert into supplier (itemid, suppliername, contact) values (86, 'Honda', '227-580-0662');
insert into supplier (itemid, suppliername, contact) values (87, 'Chrysler', '687-129-4077');
insert into supplier (itemid, suppliername, contact) values (88, 'Hyundai', '782-688-6279');
insert into supplier (itemid, suppliername, contact) values (89, 'Mitsubishi', '794-824-4223');
insert into supplier (itemid, suppliername, contact) values (90, 'Chevrolet', '314-539-3581');
insert into supplier (itemid, suppliername, contact) values (91, 'Subaru', '644-207-3840');
insert into supplier (itemid, suppliername, contact) values (92, 'Nissan', '102-772-9345');
insert into supplier (itemid, suppliername, contact) values (93, 'Mitsubishi', '898-745-5015');
insert into supplier (itemid, suppliername, contact) values (94, 'Mercedes-Benz', '602-530-3178');
insert into supplier (itemid, suppliername, contact) values (95, 'Infiniti', '718-656-1482');
insert into supplier (itemid, suppliername, contact) values (96, 'Chevrolet', '207-512-6445');
insert into supplier (itemid, suppliername, contact) values (97, 'Cadillac', '868-281-8532');
insert into supplier (itemid, suppliername, contact) values (98, 'Lotus', '644-898-7107');
insert into supplier (itemid, suppliername, contact) values (99, 'Ford', '292-363-8759');
insert into supplier (itemid, suppliername, contact) values (100, 'Toyota', '374-734-8752');

--stock Table
insert into stock (itemid, quantity) values (1, 14);
insert into stock (itemid, quantity) values (2, 10);
insert into stock (itemid, quantity) values (3, 13);
insert into stock (itemid, quantity) values (4, 3);
insert into stock (itemid, quantity) values (5, 8);
insert into stock (itemid, quantity) values (6, 14);
insert into stock (itemid, quantity) values (7, 15);
insert into stock (itemid, quantity) values (8, 10);
insert into stock (itemid, quantity) values (9, 12);
insert into stock (itemid, quantity) values (10, 11);
insert into stock (itemid, quantity) values (11, 4);
insert into stock (itemid, quantity) values (12, 5);
insert into stock (itemid, quantity) values (13, 4);
insert into stock (itemid, quantity) values (14, 14);
insert into stock (itemid, quantity) values (15, 10);
insert into stock (itemid, quantity) values (16, 1);
insert into stock (itemid, quantity) values (17, 15);
insert into stock (itemid, quantity) values (18, 3);
insert into stock (itemid, quantity) values (19, 2);
insert into stock (itemid, quantity) values (20, 10);
insert into stock (itemid, quantity) values (21, 7);
insert into stock (itemid, quantity) values (22, 5);
insert into stock (itemid, quantity) values (23, 8);
insert into stock (itemid, quantity) values (24, 5);
insert into stock (itemid, quantity) values (25, 3);
insert into stock (itemid, quantity) values (26, 5);
insert into stock (itemid, quantity) values (27, 8);
insert into stock (itemid, quantity) values (28, 3);
insert into stock (itemid, quantity) values (29, 10);
insert into stock (itemid, quantity) values (30, 9);
insert into stock (itemid, quantity) values (31, 11);
insert into stock (itemid, quantity) values (32, 12);
insert into stock (itemid, quantity) values (33, 7);
insert into stock (itemid, quantity) values (34, 14);
insert into stock (itemid, quantity) values (35, 2);
insert into stock (itemid, quantity) values (36, 2);
insert into stock (itemid, quantity) values (37, 14);
insert into stock (itemid, quantity) values (38, 14);
insert into stock (itemid, quantity) values (39, 7);
insert into stock (itemid, quantity) values (40, 6);
insert into stock (itemid, quantity) values (41, 2);
insert into stock (itemid, quantity) values (42, 2);
insert into stock (itemid, quantity) values (43, 9);
insert into stock (itemid, quantity) values (44, 1);
insert into stock (itemid, quantity) values (45, 11);
insert into stock (itemid, quantity) values (46, 13);
insert into stock (itemid, quantity) values (47, 7);
insert into stock (itemid, quantity) values (48, 12);
insert into stock (itemid, quantity) values (49, 8);
insert into stock (itemid, quantity) values (50, 15);
insert into stock (itemid, quantity) values (51, 11);
insert into stock (itemid, quantity) values (52, 5);
insert into stock (itemid, quantity) values (53, 4);
insert into stock (itemid, quantity) values (54, 1);
insert into stock (itemid, quantity) values (55, 4);
insert into stock (itemid, quantity) values (56, 3);
insert into stock (itemid, quantity) values (57, 10);
insert into stock (itemid, quantity) values (58, 8);
insert into stock (itemid, quantity) values (59, 7);
insert into stock (itemid, quantity) values (60, 9);
insert into stock (itemid, quantity) values (61, 11);
insert into stock (itemid, quantity) values (62, 10);
insert into stock (itemid, quantity) values (63, 3);
insert into stock (itemid, quantity) values (64, 15);
insert into stock (itemid, quantity) values (65, 6);
insert into stock (itemid, quantity) values (66, 8);
insert into stock (itemid, quantity) values (67, 1);
insert into stock (itemid, quantity) values (68, 6);
insert into stock (itemid, quantity) values (69, 11);
insert into stock (itemid, quantity) values (70, 5);
insert into stock (itemid, quantity) values (71, 10);
insert into stock (itemid, quantity) values (72, 4);
insert into stock (itemid, quantity) values (73, 11);
insert into stock (itemid, quantity) values (74, 5);
insert into stock (itemid, quantity) values (75, 14);
insert into stock (itemid, quantity) values (76, 12);
insert into stock (itemid, quantity) values (77, 4);
insert into stock (itemid, quantity) values (78, 9);
insert into stock (itemid, quantity) values (79, 10);
insert into stock (itemid, quantity) values (80, 12);
insert into stock (itemid, quantity) values (81, 8);
insert into stock (itemid, quantity) values (82, 11);
insert into stock (itemid, quantity) values (83, 1);
insert into stock (itemid, quantity) values (84, 13);
insert into stock (itemid, quantity) values (85, 15);
insert into stock (itemid, quantity) values (86, 3);
insert into stock (itemid, quantity) values (87, 3);
insert into stock (itemid, quantity) values (88, 10);
insert into stock (itemid, quantity) values (89, 5);
insert into stock (itemid, quantity) values (90, 1);
insert into stock (itemid, quantity) values (91, 3);
insert into stock (itemid, quantity) values (92, 1);
insert into stock (itemid, quantity) values (93, 2);
insert into stock (itemid, quantity) values (94, 12);
insert into stock (itemid, quantity) values (95, 6);
insert into stock (itemid, quantity) values (96, 1);
insert into stock (itemid, quantity) values (97, 2);
insert into stock (itemid, quantity) values (98, 15);
insert into stock (itemid, quantity) values (99, 7);
insert into stock (itemid, quantity) values (100, 12);

--price Table
insert into price (itemid, price) values (1, 645234);
insert into price (itemid, price) values (2, 585853);
insert into price (itemid, price) values (3, 1356117);
insert into price (itemid, price) values (4, 932808);
insert into price (itemid, price) values (5, 904519);
insert into price (itemid, price) values (6, 501162);
insert into price (itemid, price) values (7, 1106067);
insert into price (itemid, price) values (8, 1487237);
insert into price (itemid, price) values (9, 984155);
insert into price (itemid, price) values (10, 1034606);
insert into price (itemid, price) values (11, 1049710);
insert into price (itemid, price) values (12, 736752);
insert into price (itemid, price) values (13, 462953);
insert into price (itemid, price) values (14, 682965);
insert into price (itemid, price) values (15, 585586);
insert into price (itemid, price) values (16, 920165);
insert into price (itemid, price) values (17, 1243264);
insert into price (itemid, price) values (18, 1331753);
insert into price (itemid, price) values (19, 771440);
insert into price (itemid, price) values (20, 1477642);
insert into price (itemid, price) values (21, 427185);
insert into price (itemid, price) values (22, 1148599);
insert into price (itemid, price) values (23, 1305763);
insert into price (itemid, price) values (24, 453218);
insert into price (itemid, price) values (25, 534573);
insert into price (itemid, price) values (26, 1022705);
insert into price (itemid, price) values (27, 1011086);
insert into price (itemid, price) values (28, 1274083);
insert into price (itemid, price) values (29, 526410);
insert into price (itemid, price) values (30, 1349139);
insert into price (itemid, price) values (31, 1360662);
insert into price (itemid, price) values (32, 512741);
insert into price (itemid, price) values (33, 523509);
insert into price (itemid, price) values (34, 1363186);
insert into price (itemid, price) values (35, 848803);
insert into price (itemid, price) values (36, 388138);
insert into price (itemid, price) values (37, 1171731);
insert into price (itemid, price) values (38, 1048705);
insert into price (itemid, price) values (39, 1153856);
insert into price (itemid, price) values (40, 910639);
insert into price (itemid, price) values (41, 384658);
insert into price (itemid, price) values (42, 592122);
insert into price (itemid, price) values (43, 1459474);
insert into price (itemid, price) values (44, 915763);
insert into price (itemid, price) values (45, 498419);
insert into price (itemid, price) values (46, 218497);
insert into price (itemid, price) values (47, 722064);
insert into price (itemid, price) values (48, 1142401);
insert into price (itemid, price) values (49, 1097574);
insert into price (itemid, price) values (50, 886864);
insert into price (itemid, price) values (51, 1028538);
insert into price (itemid, price) values (52, 365533);
insert into price (itemid, price) values (53, 869606);
insert into price (itemid, price) values (54, 1152480);
insert into price (itemid, price) values (55, 311489);
insert into price (itemid, price) values (56, 1165042);
insert into price (itemid, price) values (57, 643631);
insert into price (itemid, price) values (58, 545520);
insert into price (itemid, price) values (59, 1145954);
insert into price (itemid, price) values (60, 1194249);
insert into price (itemid, price) values (61, 596103);
insert into price (itemid, price) values (62, 525500);
insert into price (itemid, price) values (63, 338650);
insert into price (itemid, price) values (64, 557682);
insert into price (itemid, price) values (65, 848822);
insert into price (itemid, price) values (66, 1277202);
insert into price (itemid, price) values (67, 1443175);
insert into price (itemid, price) values (68, 1372232);
insert into price (itemid, price) values (69, 1460029);
insert into price (itemid, price) values (70, 908825);
insert into price (itemid, price) values (71, 567381);
insert into price (itemid, price) values (72, 348684);
insert into price (itemid, price) values (73, 399725);
insert into price (itemid, price) values (74, 401608);
insert into price (itemid, price) values (75, 981896);
insert into price (itemid, price) values (76, 1295552);
insert into price (itemid, price) values (77, 1181570);
insert into price (itemid, price) values (78, 1269119);
insert into price (itemid, price) values (79, 485020);
insert into price (itemid, price) values (80, 997284);
insert into price (itemid, price) values (81, 419949);
insert into price (itemid, price) values (82, 207592);
insert into price (itemid, price) values (83, 1270229);
insert into price (itemid, price) values (84, 649576);
insert into price (itemid, price) values (85, 450311);
insert into price (itemid, price) values (86, 657247);
insert into price (itemid, price) values (87, 1019697);
insert into price (itemid, price) values (88, 852179);
insert into price (itemid, price) values (89, 608830);
insert into price (itemid, price) values (90, 355875);
insert into price (itemid, price) values (91, 1029495);
insert into price (itemid, price) values (92, 494169);
insert into price (itemid, price) values (93, 418279);
insert into price (itemid, price) values (94, 1388226);
insert into price (itemid, price) values (95, 1035563);
insert into price (itemid, price) values (96, 316530);
insert into price (itemid, price) values (97, 1310856);
insert into price (itemid, price) values (98, 911476);
insert into price (itemid, price) values (99, 783876);
insert into price (itemid, price) values (100, 477740);