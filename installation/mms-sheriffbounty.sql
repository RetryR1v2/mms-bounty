CREATE TABLE `mms_sheriffbounty` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`firstname` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
	`lastname` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
	`reason` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
	`reward` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=9
;
