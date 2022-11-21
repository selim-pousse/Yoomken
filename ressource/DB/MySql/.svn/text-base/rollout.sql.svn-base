
ALTER TABLE  `user_more` ADD `fb_app_token_mor` varchar(356) CHARACTER SET utf8 NOT NULL;


/////////////////// OBSOLETE - A PARTIR D'ICI ///////////////////////////

 -- modifier la table like


ALTER TABLE  `activity` CHANGE  `type_act`  `type_act` ENUM(  'NW','AV','CR','OF','QU','FU','PU','LU','LA','CU','GB','RB','WB' ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT  'NW';
-- supprimer l'index unique et ajouter un index normal pour la table activité


ALTER TABLE  `content` ADD  `holder_usr_cnt` varchar(32) DEFAULT NULL;



ALTER TABLE `user` CHANGE `profil_usr` `profil_usr` ENUM('P','C','B','N')
 CHARACTER SET utf8
 NOT NULL
 DEFAULT 'N'
 COMMENT 'P =>presta, C=>customer/employer';


 ALTER TABLE `activity` CHANGE `flux_act` `flux_act` ENUM('JB','SV','NE')
 NOT NULL
 DEFAULT 'NE';


CREATE OR REPLACE VIEW `view_activity` AS 
	select `a`.`pid_act` AS `pid_vac`,`a`.`id_act` AS `id_vac`,`a`.`id_usr_act` AS `id_usr_vac`,`a`.`date_act` AS `date_vac`,`a`.`type_act` AS `type_vac`,`a`.`related_act` AS `related_vac`,`a`.`flux_act` AS `flux_vac`,`a`.`inflow_act` AS `inflow_vac`,`a`.`wall_usr_act` AS `wall_usr_vac`,`c`.`privacy_cnt` AS `privacy_vac`,`c`.`id_spt_cnt` AS `id_spt_vac`,`c`.`media_cnt` AS `media_vac`,`c`.`holder_usr_cnt` AS `holder_usr_vac`,`c`.`title_cnt` AS `title_vac`,`c`.`views_cnt` AS `views_vac`,`c`.`featured_cnt` AS `featured_vac`,`c`.`desc_cnt` AS `desc_vac`,
			`c`.`shortdesc_cnt` AS `shortdesc_vac`,`c`.`thumbnail_cnt` AS `thumbnail_vac`, deleted_act as deleted_vac,lang_act as lang_vac, paie_cnt as paie_vac, currency_cnt as currency_vac
	from (`activity` `a` left join `content` `c` on((`a`.`id_act` = `c`.`id_act_cnt`)));
 








/////////////////// OBSOLETE - A PARTIR D'ICI ///////////////////////////

ALTER TABLE  `like` ADD  `cmt_lik`  INT NULL DEFAULT NULL;


ALTER TABLE  `like` CHANGE  `type_lik`  `type_lik` ENUM(  'D',  'R',  'W',  'A',  'L' ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT  'L';


ALTER TABLE  `like` ADD  `bdg_lik` VARCHAR( 32 ) NULL AFTER  `meta_lik`;

TODO--ALTER TABLE  `like` ADD  `pid_lik` INT NOT NULL AUTO_INCREMENT FIRST , ADD PRIMARY KEY (  `pid_lik` );

 
 ------------- ajouter la table badge
 
 
 
 ------------ modiifer l'odre du champ status_usrusr enum '0','F','W','A' de la table user_user
 
 -table content
ALTER TABLE  `content` ADD `paie_cnt` int(11) DEFAULT '0';
ALTER TABLE  `content` ADD  `currency_cnt` varchar(3) DEFAULT 'EUR';
 
 -- table Tag
 ALTER TABLE  `tag` CHANGE  `type_tag`  `type_tag` ENUM(  'skill','degree','service','personality','other' ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT  'other';
 ALTER TABLE  `tag` ADD `order_tag` int(11) DEFAULT '0';
 ALTER TABLE  `tag` ADD `deleted_tag` int(1) DEFAULT '0';
 
 -- table ACTIVITY
ALTER TABLE  `activity` CHANGE  `type_act`  `type_act` ENUM(  'NW','AV','OF','QU','FU','PU','LU','LA','CU','GB','RB','WB' ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT  'NW';
ALTER TABLE  `activity` ADD  `deleted_act` INT( 1 ) NOT NULL DEFAULT  0;
ALTER TABLE  `activity` ADD  `lang_act` varchar(2) NOT NULL DEFAULT 'fr';

------------- renommer order_act en pid_act  de la table activity
 
 
 ----------- ajouter pid_cmt dans la table comment
 TODO--ALTER TABLE  `comment` ADD  `pid_cmt` INT NOT NULL AUTO_INCREMENT FIRST , ADD PRIMARY KEY (  `pid_cmt` );
 
 -- table filter_smart
 DELETE FROM filter_smart WHERE alias_filsma = "PP=MY_POSTS";

 UPDATE filter_smart SET order_filsma = 4,access_filsma=-3,`active_filsma`=0 WHERE alias_filsma = "AL=ALL";
 UPDATE filter_smart SET active_filsma = 1 ,type_filsma = "111"  WHERE alias_filsma = "CC=MY_COLLS";
 
 
 
 -- view activity
CREATE OR REPLACE VIEW `view_activity` AS 
	select `a`.`id_act` AS `id_vac`,`a`.`id_usr_act` AS `id_usr_vac`,`a`.`date_act` AS `date_vac`,`a`.`type_act` AS `type_vac`,`a`.`related_act` AS `related_vac`,`a`.`flux_act` AS `flux_vac`,`a`.`inflow_act` AS `inflow_vac`,`a`.`wall_usr_act` AS `wall_usr_vac`,`c`.`privacy_cnt` AS `privacy_vac`,`c`.`id_spt_cnt` AS `id_spt_vac`,`c`.`media_cnt` AS `media_vac`,`c`.`title_cnt` AS `title_vac`,`c`.`views_cnt` AS `views_vac`,`c`.`featured_cnt` AS `featured_vac`,`c`.`desc_cnt` AS `desc_vac`,
			`c`.`shortdesc_cnt` AS `shortdesc_vac`,`c`.`thumbnail_cnt` AS `thumbnail_vac`, deleted_act as deleted_vac,lang_act as lang_vac, paie_cnt as paie_vac, currency_cnt as currency_vac
	from (`activity` `a` left join `content` `c` on((`a`.`id_act` = `c`.`id_act_cnt`)));
 
 -- table message
ALTER TABLE  `message` CHANGE  `type_msg`  `type_msg` enum('DE','ED','FO','OT','YD','ND','RB','AB','YB','NB','RU','CD') NOT NULL DEFAULT 'OT' COMMENT "DE => start DEAL ED => end deal FO => follow user OT => other (no specific action) YD => accept deal ND => refuse deal AB => ask for badge YB => yes to give badge NB => no to give badge RB => receive badge"