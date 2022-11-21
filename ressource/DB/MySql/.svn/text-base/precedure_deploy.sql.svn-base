ALTER TABLE  `user_presta` ADD  `calendar_presta` VARCHAR( 118 ) NOT NULL DEFAULT '0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000000000000';

ALTER TABLE  `price` ADD PRIMARY KEY (  `id_usr_pri` ,  `profil_pri` ) ;

ALTER TABLE  `activity` CHANGE  `type_act`  `type_act` ENUM(  'NW',  'AV',  'OF',  'QU',  'FU',  'PU' ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT  'NW';

ALTER TABLE  `filter_smart` CHANGE  `type_filsma`  `type_filsma` ENUM(  'USR',  'ACT',  'ASK',  'ALL' ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT  'ACT';

ALTER TABLE  `filter` ADD  `type_fil` CHAR( 3 ) NOT NULL DEFAULT  '111';

ALTER TABLE  `filter` DROP PRIMARY KEY ,
ADD PRIMARY KEY (  `id_fil` ,  `id_filsma_fil` ,  `type_fil` );

ALTER TABLE  `filter_smart` DROP PRIMARY KEY ,
ADD PRIMARY KEY (  `id_filsma` ,  `id_user_filsma` ,  `type_filsma` );

-- TODO : modifier la primary key de filter pour que le type rentre dans l'index

ALTER TABLE  `message` CHANGE  `smail_msg`  `smail_msg` SMALLINT( 1 ) NOT NULL DEFAULT  '0';
ALTER TABLE  `message` ADD  `mail_msg` TEXT NULL DEFAULT NULL AFTER  `content_msg`;
ALTER TABLE  `message` ADD  `subject_msg` VARCHAR( 150 ) NULL DEFAULT NULL AFTER  `mail_msg`;

ALTER TABLE `user` DROP `lastname_usr`;
ALTER TABLE  `user` CHANGE  `firstname_usr`  `fullname_usr` VARCHAR( 120 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;

-----------------------------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW `view_presta` AS 
select `up`.`id_usr_presta` AS `id_usr_presta`,`up`.`level_presta` AS `level_presta`,
`up`.`job_presta` AS `job_presta`,`up`.`yearsexp_presta` AS `yearsexp_presta`,
up.calendar_presta as calendar_presta,
if((`p`.`amont_pri` > 0),(`c`.`coeff_ccy` / `p`.`amont_pri`),0) AS `price_presta`,
if((`p`.`amont_pri` > 0),`p`.`amont_pri`,0) AS `amont_presta`,
`p`.`frequency_pri` AS `frequency_presta`,`p`.`currency_pri` AS `currency_presta` 
from ((`user_presta` `up` join `price` `p` on(((`up`.`id_usr_presta` = `p`.`id_usr_pri`) and (`p`.`profil_pri` = 'P')))) join `currency` `c` on((`p`.`currency_pri` = `c`.`unity_ccy`)));

CREATE  VIEW `yoomdev`.`view_customer` AS select `uc`.`id_usr_custo` AS `id_usr_custo`,`uc`.`job_custo` AS `job_custo`,if((`p`.`amont_pri` > 0),(`c`.`coeff_ccy` / `p`.`amont_pri`),0) AS `price_custo`,if((`p`.`amont_pri` > 0),`p`.`amont_pri`,0) AS `amont_custo`,`p`.`frequency_pri` AS `frequency_custo`,`p`.`currency_pri` AS `currency_custo` from ((`yoomdev`.`user_custo` `uc` join `yoomdev`.`price` `p` on(((`uc`.`id_usr_custo` = `p`.`id_usr_pri`) and (`p`.`profil_pri` = 'C')))) join `yoomdev`.`currency` `c` on((`p`.`currency_pri` = `c`.`unity_ccy`)));


CREATE OR REPLACE VIEW `view_activity` 
AS select `a`.`id_act` AS `id_vac`,`a`.`id_usr_act` AS `id_usr_vac`,`a`.`date_act` AS `date_vac`,`a`.`type_act` AS `type_vac`,`a`.`related_act` AS `related_vac`,`a`.`flux_act` AS `flux_vac`,`c`.`privacy_cnt` AS `privacy_vac`,`c`.`id_spt_cnt` AS `id_spt_vac`,`c`.`media_cnt` AS `media_vac`,`c`.`title_cnt` AS `title_vac`,`c`.`views_cnt` AS `views_vac`,`c`.`featured_cnt` AS `featured_vac`,`c`.`desc_cnt` AS `desc_vac`,`c`.`shortdesc_cnt` AS `shortdesc_vac`,`c`.`thumbnail_cnt` AS `thumbnail_vac` 
from (`activity` `a` left join `content` `c` on((`a`.`id_act` = `c`.`id_act_cnt`)));


CREATE OR REPLACE VIEW `view_user` AS
SELECT U.*,C.*,P.* from `user` U
LEFT JOIN  `view_customer` as  C ON (U.id_usr = C.id_usr_custo)
LEFT JOIN  `view_presta` as  P ON (U.id_usr = P.id_usr_presta);


ALTER TABLE  `content` CHANGE  `note_cnt`  `shortdesc_cnt` VARCHAR( 250 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;

ALTER TABLE `user`
  DROP `job_usr`, 
  DROP `yearsexp_usr`,
  DROP `msg_notification_usr`,
  DROP `skills_usr`,
  DROP `fb_connect_usr`,
  DROP `fb_oauth_token_usr`,
  DROP `fb_nb_invite_usr`,
  DROP `fb_autopost_usr`,
  DROP `tw_connect_usr`,
  DROP `tw_oauth_token_usr`,
  DROP `tw_oauth_token_secret_usr`,
  DROP `tw_autopost_usr`,
  DROP `go_oauth_token_usr`;
ALTER TABLE  `user` ADD  `id_spt_nby` VARCHAR( 32 ) NULL AFTER  `mode_nby`;
ALTER TABLE  `user` CHANGE  `shortdesc_usr`  `shortdesc_usr` VARCHAR( 250 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT  'Description non renseignée.';

CREATE TABLE IF NOT EXISTS `user_more` (
  `id_usr_mor` varchar(32) CHARACTER SET utf8 NOT NULL,
  `desc_mor` TEXT CHARACTER SET utf8 NOT NULL,
  `nbresult_mor` enum('5','10','20','30','50') CHARACTER SET utf8 NOT NULL DEFAULT '10',
  `msg_notification_mor` enum('Y','N') CHARACTER SET utf8 NOT NULL DEFAULT 'Y',
  `fb_connect_mor` enum('Y','N') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `fb_oauth_token_mor` varchar(256) CHARACTER SET utf8 NOT NULL,
  `fb_nb_invite_mor` varchar(5) CHARACTER SET utf8 NOT NULL,
  `fb_autopost_mor` enum('Y','N') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `tw_connect_mor` enum('Y','N') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `tw_oauth_token_mor` varchar(64) CHARACTER SET utf8 NOT NULL,
  `tw_oauth_token_secret_mor` varchar(64) CHARACTER SET utf8 NOT NULL,
  `tw_autopost_mor` enum('Y','N') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `go_oauth_token_mor` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_usr_mor`),
  KEY `msg_notification_mor` (`msg_notification_mor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table des options des utilisateurs';

insert into `user_more` (id_usr_mor) select id_usr from user;

ALTER TABLE  `user_user` CHANGE  `status_usrusr`  `status_usrusr` ENUM(  'F',  'W',  'A',  '0' ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT  '0';


DROP TABLE IF EXISTS `msg_usr`;
DROP TABLE IF EXISTS `grp_net`; 
DROP TABLE IF EXISTS `grp_usr`;
CREATE TABLE `grp_usr` (
  `id_grpusr` varchar(32) NOT NULL,
  `id_usr_grpusr` varchar(32) NOT NULL,
  `profil_usr_grpusr` enum('P','C','B') NOT NULL DEFAULT 'P',
  `type_usr_grpusr` enum('F','M','W') NOT NULL DEFAULT 'M',
  `privacy_msg_grpusr` enum('P','R') NOT NULL DEFAULT 'P',
  `date_grpusr` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (  `id_grpusr` ,  `date_grpusr` ),
  KEY `profil_usr_grpusr` (`profil_usr_grpusr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `histo_collaborator`;
CREATE TABLE IF NOT EXISTS `histo_collaborator` (
  `id_coll` int(32) NOT NULL AUTO_INCREMENT,
  `id_grpusr_coll` varchar(32) DEFAULT NULL COMMENT 'sender',
  `initiator_coll` varchar(32) DEFAULT NULL,
  `date_begin_coll` datetime DEFAULT NULL,
  `date_end_coll` datetime DEFAULT NULL,
  PRIMARY KEY (`id_coll`),
  KEY `id_grpusr_coll` (`id_grpusr_coll`),
  KEY `initiator_coll` (`initiator_coll`),
  KEY `date_begin_coll` (`date_begin_coll`),
 KEY `date_end_coll` (`date_end_coll`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=0;


DROP TABLE IF EXISTS `like_usr`;
DROP TABLE IF EXISTS `like_act`; 
DROP TABLE IF EXISTS `like_cmt`;
CREATE TABLE IF NOT EXISTS `like` (
  `id_usr_lik` varchar(32) NOT NULL,
  `id_meta_lik` varchar(32) NOT NULL,
  `date_lik` datetime NOT NULL,
  `type_lik` enum('L','N') NOT NULL DEFAULT 'L',
   `meta_lik` enum('ACT','CMT','USR') NOT NULL DEFAULT 'ACT',
  PRIMARY KEY (`id_usr_lik`,`id_meta_lik`),
  KEY `type_lik` (`type_lik`),
  KEY `id_meta_lik` (`id_meta_lik`),
  KEY `like_meta` (`meta_lik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



ALTER TABLE  `user` ADD  `last_activity_usr` TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

CREATE TABLE `im_messages` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `type` varchar(2) NOT NULL,
  `sent` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;


------------ CLEANNING DATTA --------------------------
delete user_user from user_user
left join `user` ON ( id_follower_usrusr  = id_usr) 
where id_usr is NULL;

ALTER TABLE  `tag` ADD  `lang_tag` VARCHAR( 2 ) NOT NULL DEFAULT  'fr';
ALTER TABLE  `activity` CHANGE  `type_act`  `type_act` ENUM(  'NW',  'AV',  'OF',  'QU',  'FU',  'PU',  'LU',  'LA',  'CU' ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT  'NW';
