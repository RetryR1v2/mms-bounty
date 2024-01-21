CREATE TABLE `mms_bounty` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`difficulty` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`reward` INT(11) NOT NULL,
	`name` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=9
;
