-- ---------------------------------------------------------------------------
-- Create table of static lookup entities
-- Any LUA file that requires a direct reference to a mob ID
--  can create an entry in this table.  Rather than scour through each LUA file
--  you can create a static table here and update IDs all in one location instead
-- ---------------------------------------------------------------------------

DROP TABLE IF EXISTS `static_mobs`;

CREATE TABLE `static_mobs` (
    `static_name`       varchar(24)     NOT NULL,
    `mobid`             int(10)         NOT NULL,
    PRIMARY KEY (`static_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `static_mobs` WRITE;

INSERT INTO `static_mobs` VALUES 
    ('diabolos_cop',                16818177),
    ('diabolos_prime',              16818204);

UNLOCK TABLES;
