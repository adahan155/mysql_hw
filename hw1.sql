USE db_42b5a4;
create table hello(
`id` INT  PRIMARY KEY NOT NULL AUTO_INCREMENT,
`url` varchar(255) NOT NULL,
`comment` varchar(255) NULL
);

INSERT INTO hello (`url`, `comment`)VALUES(
"https://github.com/adahan155/mysql_hw",
"Здесь должна была быть шутка"
);