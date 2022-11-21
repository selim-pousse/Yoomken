
-- --------------------------------------------------------

--
-- Structure de la table `view_activity`
--

CREATE  OR REPLACE VIEW `view_activity` AS select `a`.`pid_act` AS `pid_vac`,`a`.`id_act` AS `id_vac`,`a`.`id_usr_act` AS `id_usr_vac`,`a`.`date_act` AS `date_vac`,`a`.`type_act` AS `type_vac`,`a`.`related_act` AS `related_vac`,`a`.`flux_act` AS `flux_vac`,
	 `inflow_act` as inflow_vac,
	 `wall_usr_act` as wall_usr_vac,
	  `c`.`privacy_cnt` AS `privacy_vac`,`c`.`id_spt_cnt` AS `id_spt_vac`,`c`.`media_cnt` AS `media_vac`,`c`.`title_cnt` AS `title_vac`,`c`.`views_cnt` AS `views_vac`,`c`.`featured_cnt` AS `featured_vac`,`c`.`desc_cnt` AS `desc_vac`,`c`.`shortdesc_cnt` AS `shortdesc_vac`,`c`.`thumbnail_cnt` AS `thumbnail_vac` from (`activity` `a` left join `content` `c` on((`a`.`id_act` = `c`.`id_act_cnt`)));

-- --------------------------------------------------------

--
-- Structure de la table `view_customer`
--

CREATE  OR REPLACE  VIEW `view_customer` AS select `uc`.`id_usr_custo` AS `id_usr_custo`,`uc`.`job_custo` AS `job_custo`,if((`p`.`amont_pri` > 0),(`c`.`coeff_ccy` / `p`.`amont_pri`),0) AS `price_custo`,if((`p`.`amont_pri` > 0),`p`.`amont_pri`,0) AS `amont_custo`,`p`.`frequency_pri` AS `frequency_custo`,`p`.`currency_pri` AS `currency_custo` from ((`yoomdev`.`user_custo` `uc` join `yoomdev`.`price` `p` on(((`uc`.`id_usr_custo` = `p`.`id_usr_pri`) and (`p`.`profil_pri` = 'C')))) join `yoomdev`.`currency` `c` on((`p`.`currency_pri` = `c`.`unity_ccy`)));

--
-- Contenu de la table `view_customer`
--


-- --------------------------------------------------------

--
-- Structure de la table `view_presta`
--

CREATE  OR REPLACE VIEW `view_presta` AS 
select 
`up`.`id_usr_presta` AS `id_usr_presta`,
`up`.`level_presta` AS `level_presta`,
`up`.`job_presta` AS `job_presta`,
`up`.`yearsexp_presta` AS `yearsexp_presta`,
`up`.`calendar_presta` AS `calendar_presta`,
if((`p`.`amont_pri` > 0),(`c`.`coeff_ccy` / `p`.`amont_pri`),0) AS `price_presta`,
if((`p`.`amont_pri` > 0),`p`.`amont_pri`,0) AS `amont_presta`,
`p`.`frequency_pri` AS `frequency_presta`,
`p`.`currency_pri` AS `currency_presta` 
from ((`user_presta` `up` 
	join `price` `p` on(((`up`.`id_usr_presta` = `p`.`id_usr_pri`) and (`p`.`profil_pri` = 'P')))) 
	join `currency` `c` on((`p`.`currency_pri` = `c`.`unity_ccy`)));

-- --------------------------------------------------------

--
-- Structure de la table `view_user`
--

CREATE  OR REPLACE VIEW  `view_user` AS select `u`.`id_usr` AS `id_usr`,`u`.`profil_usr` AS `profil_usr`,`u`.`status_usr` AS `status_usr`,`u`.`level_usr` AS `level_usr`,`u`.`activate_code_usr` AS `activate_code_usr`,`u`.`regdate_usr` AS `regdate_usr`,`u`.`url_usr` AS `url_usr`,`u`.`privacy_usr` AS `privacy_usr`,`u`.`fullname_usr` AS `fullname_usr`,`u`.`lang_usr` AS `lang_usr`,`u`.`gender_usr` AS `gender_usr`,`u`.`birthdate_usr` AS `birthdate_usr`,`u`.`shortdesc_usr` AS `shortdesc_usr`,`u`.`email_usr` AS `email_usr`,`u`.`phone_usr` AS `phone_usr`,`u`.`mobile_usr` AS `mobile_usr`,`u`.`password_usr` AS `password_usr`,`u`.`nation_usr` AS `nation_usr`,`u`.`id_spt_usr` AS `id_spt_usr`,`u`.`activ_nby` AS `activ_nby`,`u`.`mode_nby` AS `mode_nby`,`u`.`views_usr` AS `views_usr`,`u`.`id_img_usr` AS `id_img_usr`,`u`.`fb_id_usr` AS `fb_id_usr`,`c`.`id_usr_custo` AS `id_usr_custo`,`c`.`job_custo` AS `job_custo`,`c`.`price_custo` AS `price_custo`,`c`.`amont_custo` AS `amont_custo`,`c`.`frequency_custo` AS `frequency_custo`,`c`.`currency_custo` AS `currency_custo`,`p`.`id_usr_presta` AS `id_usr_presta`,`p`.`level_presta` AS `level_presta`,`p`.`job_presta` AS `job_presta`,`p`.`yearsexp_presta` AS `yearsexp_presta`,`p`.`calendar_presta` AS `calendar_presta`,`p`.`price_presta` AS `price_presta`,`p`.`amont_presta` AS `amont_presta`,`p`.`frequency_presta` AS `frequency_presta`,`p`.`currency_presta` AS `currency_presta` from ((`yoomdev`.`user` `u` left join `yoomdev`.`view_customer` `c` on((`u`.`id_usr` = `c`.`id_usr_custo`))) left join `yoomdev`.`view_presta` `p` on((`u`.`id_usr` = `p`.`id_usr_presta`)));
