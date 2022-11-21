-- phpMyAdmin SQL Dump
-- version 4.0.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 05, 2017 at 11:40 AM
-- Server version: 5.5.33
-- PHP Version: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `yoomken.li`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `pid_act` int(11) NOT NULL AUTO_INCREMENT,
  `id_act` varchar(32) NOT NULL,
  `id_usr_act` varchar(32) NOT NULL,
  `wall_usr_act` varchar(32) DEFAULT NULL,
  `date_act` datetime NOT NULL,
  `type_act` enum('NW','AV','CR','OF','QU','FU','PU','LU','LA','CU','GB','RB','WB') NOT NULL DEFAULT 'NW',
  `related_act` text,
  `flux_act` enum('JB','SV','NE') NOT NULL DEFAULT 'NE',
  `inflow_act` int(1) NOT NULL DEFAULT '1',
  `deleted_act` int(1) NOT NULL DEFAULT '0',
  `lang_act` varchar(2) NOT NULL DEFAULT 'fr',
  PRIMARY KEY (`pid_act`),
  KEY `id_usr_act` (`id_usr_act`),
  KEY `date` (`date_act`),
  KEY `id_act_index` (`id_act`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=533 ;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`pid_act`, `id_act`, `id_usr_act`, `wall_usr_act`, `date_act`, `type_act`, `related_act`, `flux_act`, `inflow_act`, `deleted_act`, `lang_act`) VALUES
(285, '4532bc07ef5cd6772f5f6dee07a28949', '7d6653aaa16976e12b6cf7c774f83c1f', NULL, '2012-09-07 20:01:31', 'NW', '', 'SV', 1, 0, 'fr'),
(287, '47dc2298472a9f94ce71d95ed3730caa', '7d6653aaa16976e12b6cf7c774f83c1f', NULL, '2012-09-07 20:01:59', 'OF', '', 'SV', 1, 0, 'fr'),
(288, '410e6e47fdfb99826ee07c5d617cfb1b', '7d6653aaa16976e12b6cf7c774f83c1f', NULL, '2012-09-07 20:02:53', 'NW', '', 'SV', 1, 0, 'fr'),
(289, '150fc3c83e0bac071685d3d88ce93290', '7d6653aaa16976e12b6cf7c774f83c1f', NULL, '2012-09-07 20:05:06', 'NW', '', 'SV', 1, 0, 'fr'),
(290, '51ddcdb9417d444de3149d92a91665bd', '7d6653aaa16976e12b6cf7c774f83c1f', NULL, '2012-09-07 20:06:31', 'NW', '', 'SV', 1, 0, 'fr'),
(291, '3b00a641ff9af7aa3f38c27e04d908df', '7d6653aaa16976e12b6cf7c774f83c1f', NULL, '2012-09-09 11:23:09', 'NW', '', 'SV', 1, 0, 'fr'),
(292, '0b16dae85630f79ce2f42af1ad5eb78d', '7d6653aaa16976e12b6cf7c774f83c1f', NULL, '2012-09-07 20:19:50', 'NW', '', 'SV', 1, 0, 'fr'),
(293, 'e754bcf2f7be2b09502d3dc72a5c1cfb', '7d6653aaa16976e12b6cf7c774f83c1f', NULL, '2012-09-07 22:13:35', 'PU', '{"privacy":true,"url":true,"webs":true,"fullname":true,"birthday":true}', 'JB', 1, 0, 'fr'),
(294, '632a97a412ed0649dd0c4b0d6714e2a5', '7d6653aaa16976e12b6cf7c774f83c1f', NULL, '2012-09-08 07:59:00', 'PU', '{"webs":true,"url":true,"privacy":true}', 'JB', 1, 0, 'fr'),
(295, '7360e0eb849ea6ef8d6ed7761d9690da', '7d6653aaa16976e12b6cf7c774f83c1f', NULL, '2012-09-09 12:21:06', 'NW', '', 'JB', 1, 0, 'fr'),
(296, '261d85ca981a22cf32f0d5fee9d4b5d5', 'a3cefde48284f70b2098d7015e987148', NULL, '2012-09-13 13:50:48', 'NW', '', 'SV', 1, 1, 'fr'),
(297, 'dd6ea5d68a0d91f19383d21394a2064e', 'a3cefde48284f70b2098d7015e987148', NULL, '2012-09-13 14:35:26', 'NW', '', 'SV', 1, 1, 'fr'),
(298, 'da17140ff413ee4d8a6e8538579c4d62', 'a3cefde48284f70b2098d7015e987148', NULL, '2012-09-13 14:35:47', 'NW', '', 'SV', 1, 1, 'fr'),
(299, '95cbf505f9cb52ef254cd064e964af26', 'a3cefde48284f70b2098d7015e987148', NULL, '2012-09-13 15:14:52', 'NW', '', 'SV', 1, 1, 'fr'),
(300, '12d26cc674652e848a7019d569e80c4b', 'a3cefde48284f70b2098d7015e987148', NULL, '2012-09-13 15:27:39', 'NW', '', 'SV', 1, 1, 'fr'),
(301, '86139c87f6edc9169aa116a4173be3b5', 'a3cefde48284f70b2098d7015e987148', NULL, '2012-09-13 15:30:20', 'QU', '', 'SV', 1, 1, 'fr'),
(302, '7ca581b52121fdb10f2fde3510319d78', 'a3cefde48284f70b2098d7015e987148', NULL, '2012-09-15 13:25:27', 'PU', '{"privacy":true,"fullname":true,"url":true,"tags":true,"webs":true}', 'JB', 1, 0, 'fr'),
(303, '2b0b542588a10c5b4bc62aa7a3cc0a4c', 'a3cefde48284f70b2098d7015e987148', NULL, '2012-09-16 21:56:33', 'PU', '{"webs":true,"birthday":true}', 'JB', 1, 0, 'fr'),
(311, '171b46e01a9262bc3ceee5a4e44233c7', 'a3cefde48284f70b2098d7015e987148', NULL, '2012-09-16 10:54:37', 'FU', '841ef8a50591e500450e46b20f0071cd;178cd2f3df2d88613b46bb6e96a77f3a;a530b55030587b46519449c39181d1b8', '', 1, 0, 'fr'),
(312, 'b842a75c0218f60ff6d790f4a39ab7a5', 'a3cefde48284f70b2098d7015e987148', NULL, '2012-09-16 12:07:07', 'QU', '', 'SV', 1, 1, 'fr'),
(313, 'ee91b06daf243a32ade42abff1e289b1', 'a3cefde48284f70b2098d7015e987148', NULL, '2012-09-18 12:59:42', 'QU', '', 'SV', 1, 1, 'fr'),
(316, '4aebd75b78ce1d25bbdaaed5d1ec6430', 'a3cefde48284f70b2098d7015e987148', NULL, '2012-09-19 13:18:10', 'FU', '6b2e63b1fd55069fb7cb35fb60f61ed7', '', 1, 0, 'fr'),
(317, '04943acf0aed6c8d27f36830ff39fe32', '00', NULL, '2012-09-19 15:23:36', 'PU', '{"url":true,"spot":true,"tags":true,"webs":true,"picture":true}', 'JB', 1, 0, 'fr'),
(341, '0a9968edd204f786369430eed467e366', '7d6653aaa16976e12b6cf7c774f83c1f', NULL, '2012-09-20 23:15:26', 'NW', '', 'SV', 1, 0, 'fr'),
(342, '79533508cfa42e528f831add9d581307', '7d6653aaa16976e12b6cf7c774f83c1f', NULL, '2012-09-20 23:22:27', 'NW', '', 'SV', 1, 0, 'fr'),
(343, '63ad66ee8e2f94c6f05bb2e7e0fa22a4', '7d6653aaa16976e12b6cf7c774f83c1f', NULL, '2012-09-22 14:34:15', 'NW', '', 'SV', 1, 0, 'fr'),
(344, '97cc9f5fc79a69668012955a2ef54991', '7d6653aaa16976e12b6cf7c774f83c1f', NULL, '2012-09-22 15:23:33', 'NW', '', 'SV', 1, 0, 'fr'),
(345, 'ab2c7513099b5e3beeb11110bc09c280', '7d6653aaa16976e12b6cf7c774f83c1f', NULL, '2012-09-22 15:23:52', 'NW', '', 'SV', 1, 0, 'fr'),
(346, 'c9017c508d4c2abfecbb75ae221a5e84', '7d6653aaa16976e12b6cf7c774f83c1f', NULL, '2012-09-22 15:17:35', 'NW', '', 'SV', 1, 0, 'fr'),
(348, '82f86c3ac00dba7f1982bbfd72374b0b', '7d6653aaa16976e12b6cf7c774f83c1f', NULL, '2012-09-22 15:24:07', 'NW', '', 'SV', 1, 0, 'fr'),
(349, '87fb4c00052559e2c34c470de0cb57b5', '7d6653aaa16976e12b6cf7c774f83c1f', NULL, '2012-09-23 01:10:42', 'NW', '', 'SV', 1, 0, 'fr'),
(350, 'ed54c93c2d6cc83b0f7f092c15a2291a', '7d6653aaa16976e12b6cf7c774f83c1f', NULL, '2012-09-23 03:10:01', 'NW', '', 'SV', 1, 0, 'fr'),
(351, '5897d63d6889e9b1cd7e47bc0164eab1', '7d6653aaa16976e12b6cf7c774f83c1f', NULL, '2012-09-27 17:34:51', 'PU', '{"webs":true}', 'JB', 1, 0, 'fr'),
(352, '7075995a8a4816a84d17101820889e95', '7d6653aaa16976e12b6cf7c774f83c1f', NULL, '2012-09-28 08:41:09', 'NW', '', 'SV', 1, 0, 'fr'),
(353, 'a3c696077291b95107b748882d8a6110', '7d6653aaa16976e12b6cf7c774f83c1f', NULL, '2012-09-28 15:59:02', 'NW', '', 'SV', 1, 0, 'fr'),
(385, '868e09fd67701fe22fa694496846c897', '6b2e63b1fd55069fb7cb35fb60f61ed7', NULL, '2012-10-01 12:33:12', 'FU', '7d6653aaa16976e12b6cf7c774f83c1f', 'SV', 1, 0, 'fr'),
(389, '2370705bdfe30381de170736e0d49390', '7d6653aaa16976e12b6cf7c774f83c1f', NULL, '2012-11-03 23:05:13', 'FU', '79b1b9dc1b338006650c78d3b4919b04', 'SV', 1, 0, 'fr'),
(393, '576e33426024e422591cc65e5d701a2f', '', NULL, '2012-11-04 01:22:52', 'AV', '6b2e63b1fd55069fb7cb35fb60f61ed7', 'SV', 1, 0, 'fr'),
(395, '9a2257b227bbfa697c1b76450b0d6651', '7d6653aaa16976e12b6cf7c774f83c1f', NULL, '2012-11-04 01:33:08', 'AV', '6b2e63b1fd55069fb7cb35fb60f61ed7', 'SV', 1, 0, 'fr'),
(396, '39932d5ed5208b52ccf8db4eea80e60a', '7d6653aaa16976e12b6cf7c774f83c1f', NULL, '2012-11-05 23:23:13', 'NW', '', 'JB', 1, 0, 'fr'),
(397, '477a3fbb39a2afa207b4dbcf7709be14', '7d6653aaa16976e12b6cf7c774f83c1f', NULL, '2012-11-06 00:53:49', 'NW', '', 'JB', 1, 0, 'fr'),
(398, '8d386909d14a090e7205e363e5b2623c', '7d6653aaa16976e12b6cf7c774f83c1f', NULL, '2012-11-06 00:55:39', 'NW', '', 'JB', 1, 0, 'fr'),
(399, 'ce1356dd0a793f27bceb303b47a138ac', '7d6653aaa16976e12b6cf7c774f83c1f', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-06 11:30:10', 'QU', '', 'JB', 1, 0, 'fr'),
(400, '82dc943ef1f4117cb40deb5db3292518', '7d6653aaa16976e12b6cf7c774f83c1f', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-06 11:33:58', 'NW', '', 'JB', 1, 0, 'fr'),
(401, 'f96bdf025cfdd0cf498d229973d19599', '7d6653aaa16976e12b6cf7c774f83c1f', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-06 11:34:58', 'NW', '', 'SV', 1, 0, 'fr'),
(402, 'cb4c3e0b9ba31d639fe05a3e75e94fa1', '7d6653aaa16976e12b6cf7c774f83c1f', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-06 11:37:24', 'NW', '', 'JB', 1, 0, 'fr'),
(403, 'fa8ed1cbf905ce0b447693c809ccbdcf', '7d6653aaa16976e12b6cf7c774f83c1f', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-06 13:05:57', 'QU', '', 'SV', 1, 0, 'fr'),
(404, 'bd8879e5aa624f93306e5bb42635b159', '7d6653aaa16976e12b6cf7c774f83c1f', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-06 13:11:02', 'QU', '', 'SV', 1, 0, 'fr'),
(405, 'f7d29dbe974719c05cfebffd75302adb', '7d6653aaa16976e12b6cf7c774f83c1f', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-06 13:16:45', 'QU', '', 'SV', 1, 0, 'fr'),
(406, '32d223ddba666104ea4d2a0bd3dd71bf', '7d6653aaa16976e12b6cf7c774f83c1f', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-06 13:32:33', 'QU', '', 'SV', 1, 0, 'fr'),
(407, '6116c8ed756f09dac41966f339fcc24e', '7d6653aaa16976e12b6cf7c774f83c1f', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-06 13:34:34', 'QU', '', 'SV', 1, 0, 'fr'),
(408, 'c1919898d533ba880c371c39d17ce719', '7d6653aaa16976e12b6cf7c774f83c1f', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-06 13:36:17', 'QU', '', 'JB', 1, 0, 'fr'),
(409, '5b4cd053eeda4c80917e0ebf3e6efa5b', '7d6653aaa16976e12b6cf7c774f83c1f', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-06 13:36:45', 'QU', '', 'JB', 1, 0, 'fr'),
(410, '69c2f705d89aa4e921338549caf1b752', '7d6653aaa16976e12b6cf7c774f83c1f', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-06 13:40:11', 'QU', '', 'JB', 1, 0, 'fr'),
(411, '732f1588e2784fc2bfc334b696ad3a9e', '7d6653aaa16976e12b6cf7c774f83c1f', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-06 13:40:34', 'QU', '', 'JB', 1, 0, 'fr'),
(412, '3ac705109895352f027ee70d48d8a141', '7d6653aaa16976e12b6cf7c774f83c1f', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-06 13:41:44', 'QU', '', 'JB', 1, 0, 'fr'),
(413, '6def0e6727a4355cf1c35892f6b66f59', '7d6653aaa16976e12b6cf7c774f83c1f', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-06 13:41:57', 'NW', '', 'JB', 1, 0, 'fr'),
(414, '4f5cb32b06667282cdf6bb46a75e27c5', '7d6653aaa16976e12b6cf7c774f83c1f', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-06 13:42:07', 'QU', '', 'JB', 1, 0, 'fr'),
(415, '1d1bb6919f0e70f6612918061c184324', '7d6653aaa16976e12b6cf7c774f83c1f', '', '2012-11-07 16:06:53', 'PU', '{"webs":true,"services":true,"fullname":true,"amont":true,"frequency":true,"currency":true,"level":true,"calendar":true,"yearsexp":true}', 'JB', 1, 0, 'fr'),
(419, '3b495e03901b23f1f69b31354e784bad', '7d6653aaa16976e12b6cf7c774f83c1f', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-07 13:55:40', 'OF', '', 'JB', 1, 0, 'fr'),
(420, '9d3c94228808a503a0c74e21c83f572a', '7d6653aaa16976e12b6cf7c774f83c1f', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-07 13:56:48', 'AV', '6b2e63b1fd55069fb7cb35fb60f61ed7', 'SV', 1, 0, 'fr'),
(421, 'e0075b3c184bfb4fb83b70754a4e567c', '7d6653aaa16976e12b6cf7c774f83c1f', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-07 16:09:13', 'FU', '48ae9648a43e3633ae647c2583d84116', '', 1, 0, 'fr'),
(422, 'f7af01dc321a94ecf2d60039d874896e', '7d6653aaa16976e12b6cf7c774f83c1f', '', '2012-11-09 21:19:13', 'PU', '{"amont":true,"frequency":true,"currency":true,"level":true,"calendar":true,"webs":true,"yearsexp":true}', 'JB', 1, 0, 'fr'),
(427, 'd565fab0a3718401f7e12ef65eb8003a', '79b1b9dc1b338006650c78d3b4919b04', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-15 00:06:06', 'FU', '7d6653aaa16976e12b6cf7c774f83c1f', '', 1, 0, 'fr'),
(428, '5a55be7fc390e2b1e389f64b057b705f', '79b1b9dc1b338006650c78d3b4919b04', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-15 00:08:56', 'NW', '', 'JB', 1, 0, 'fr'),
(429, 'cdee1f8f6d42295a8f9b25c08c6b6d8b', '79b1b9dc1b338006650c78d3b4919b04', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-15 00:18:17', 'OF', '', 'JB', 1, 0, 'fr'),
(430, '08d6efb10305f2090292dab279eecf2b', '79b1b9dc1b338006650c78d3b4919b04', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-17 13:41:49', 'QU', '', 'JB', 1, 0, 'fr'),
(431, '0ceead01e302b49382ce22688eb022a1', '7d6653aaa16976e12b6cf7c774f83c1f', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-17 18:01:45', 'QU', '', 'SV', 1, 0, 'fr'),
(432, '536c50cdd0b062dea0fac16c7491ca6e', '79b1b9dc1b338006650c78d3b4919b04', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-18 12:08:30', '', '7d6653aaa16976e12b6cf7c774f83c1f', '', 1, 0, 'fr'),
(433, '6ca4a95cb0d2e088a1b7db618d040b70', '79b1b9dc1b338006650c78d3b4919b04', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-18 12:16:21', '', '7d6653aaa16976e12b6cf7c774f83c1f', '', 1, 0, 'fr'),
(435, 'dc07ed4bdb4c912a7cff3a91ea290810', '0fbef09a987b7a2f6f5aad18a31a5c43', '', '2012-11-27 22:56:04', 'PU', '{"shortdesc":true,"amont":true,"frequency":true,"currency":true,"level":true,"calendar":true,"services":true,"webs":true,"yearsexp":true}', 'JB', 1, 0, 'fr'),
(436, '901f012073ad8fede61515304269b57f', '79b1b9dc1b338006650c78d3b4919b04', '', '2012-11-28 20:59:58', 'PU', '{"fullname":true,"shortdesc":true,"amont":true,"frequency":true,"currency":true,"level":true,"webs":true,"picture":true,"yearsexp":true}', 'JB', 1, 0, 'fr'),
(437, '6d76f12cb1e5dbb8b02c18d26cd38cdb', 'f7a5c01ea63f9176ff7352da1b5dcaa5', '', '2012-12-02 11:33:59', 'PU', '{"fullname":true,"gender":true,"shortdesc":true,"job":true,"amont":true,"frequency":true,"currency":true,"level":true,"calendar":true,"services":true,"webs":true}', 'JB', 1, 0, 'fr'),
(438, 'cce58ad16940e2006f8b48b16e3afbe8', '5a6097a8f128c86769da4e977927a78d', '5a6097a8f128c86769da4e977927a78d', '2013-04-17 02:48:27', 'GB', '{"towho":"f7a5c01ea63f9176ff7352da1b5dcaa5","badge":"funny"}', '', 1, 0, 'xx'),
(439, '94cd75143a13462a931a47b4b7725beb', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'f7a5c01ea63f9176ff7352da1b5dcaa5', '2013-04-17 02:48:27', 'RB', '{"towho":"5a6097a8f128c86769da4e977927a78d","badge":"funny"}', '', 0, 0, 'xx'),
(440, 'c98889c2f67b835ae87e9b20f9631412', 'a3cefde48284f70b2098d7015e987148', 'a3cefde48284f70b2098d7015e987148', '2013-04-17 02:52:53', 'GB', '{"towho":"5a6097a8f128c86769da4e977927a78d","badge":"funny"}', '', 1, 0, 'xx'),
(441, '8025ad2337bd813ac70bab0688d3514f', '5a6097a8f128c86769da4e977927a78d', '5a6097a8f128c86769da4e977927a78d', '2013-04-17 02:52:53', 'RB', '{"towho":"a3cefde48284f70b2098d7015e987148","badge":"funny"}', '', 0, 0, 'xx'),
(442, '543d36dfadf60f7a6d8841a19292e757', 'a3cefde48284f70b2098d7015e987148', 'a3cefde48284f70b2098d7015e987148', '2013-04-17 02:53:40', 'GB', '{"towho":"5a6097a8f128c86769da4e977927a78d","badge":"nounou"}', '', 1, 0, 'xx'),
(443, '681a75a223388d7d75079bf6f1580e9d', '5a6097a8f128c86769da4e977927a78d', '5a6097a8f128c86769da4e977927a78d', '2013-04-17 02:53:40', 'RB', '{"towho":"a3cefde48284f70b2098d7015e987148","badge":"nounou"}', '', 0, 0, 'xx'),
(444, '1701b544ceea3ee97224457b9b324aa1', '79b1b9dc1b338006650c78d3b4919b04', '79b1b9dc1b338006650c78d3b4919b04', '2013-04-18 23:38:15', 'GB', '{"towho":"6b2e63b1fd55069fb7cb35fb60f61ed7","badge":"bricoler"}', '', 1, 0, 'xx'),
(445, 'b495637a21fbe47b84182e9478e6dc61', '6b2e63b1fd55069fb7cb35fb60f61ed7', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-04-18 23:38:15', 'RB', '{"towho":"79b1b9dc1b338006650c78d3b4919b04","badge":"bricoler"}', '', 0, 0, 'xx'),
(446, '84052dc2584b30131401ef71d872c0fd', '79b1b9dc1b338006650c78d3b4919b04', '79b1b9dc1b338006650c78d3b4919b04', '2013-04-18 23:38:55', 'GB', '{"towho":"6b2e63b1fd55069fb7cb35fb60f61ed7","badge":"attachant"}', '', 1, 0, 'xx'),
(447, '0a1854b2e8bc1ced0a43dfa23ad5e030', '6b2e63b1fd55069fb7cb35fb60f61ed7', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-04-18 23:38:55', 'RB', '{"towho":"79b1b9dc1b338006650c78d3b4919b04","badge":"attachant"}', '', 0, 0, 'xx'),
(448, 'e6b1e41d61b74cdd67e95c119446fe54', '79b1b9dc1b338006650c78d3b4919b04', '79b1b9dc1b338006650c78d3b4919b04', '2013-04-18 23:40:08', 'GB', '{"towho":"a3cefde48284f70b2098d7015e987148","badge":"attachant"}', '', 1, 0, 'xx'),
(449, '283a71eb878d31187acee289ba9ad7da', 'a3cefde48284f70b2098d7015e987148', 'a3cefde48284f70b2098d7015e987148', '2013-04-18 23:40:08', 'RB', '{"towho":"79b1b9dc1b338006650c78d3b4919b04","badge":"attachant"}', '', 0, 0, 'xx'),
(450, '26b466ba836bd3a7ef92ddf5a680ba4c', '5a6097a8f128c86769da4e977927a78d', '5a6097a8f128c86769da4e977927a78d', '2013-04-19 09:45:53', 'FU', 'f7a5c01ea63f9176ff7352da1b5dcaa5;a3cefde48284f70b2098d7015e987148;841ef8a50591e500450e46b20f0071cd;48ae9648a43e3633ae647c2583d84116', '', 1, 0, 'xx'),
(451, '31c121e061edabb6609ab85abaa1c522', '5a6097a8f128c86769da4e977927a78d', '5a6097a8f128c86769da4e977927a78d', '2013-04-28 02:49:16', 'QU', '', 'SV', 1, 1, 'fr'),
(452, 'd45f0528abe36c5060e1e562d7da365a', '5a6097a8f128c86769da4e977927a78d', '', '2013-04-28 02:57:46', 'PU', '{"gender":true,"spot":true,"amont":true,"frequency":true,"currency":true,"level":true,"services":true,"webs":true,"yearsexp":true,"birthday":true}', 'JB', 1, 0, 'xx'),
(456, 'e389f8d464e0ab07cf51b81dd54a3d96', 'a530b55030587b46519449c39181d1b8', 'a530b55030587b46519449c39181d1b8', '2013-05-30 10:51:11', 'FU', '5a6097a8f128c86769da4e977927a78d;6b2e63b1fd55069fb7cb35fb60f61ed7;f7a5c01ea63f9176ff7352da1b5dcaa5', '', 1, 0, 'xx'),
(457, '996e746d6b02d99b33830933f3fedb47', '178cd2f3df2d88613b46bb6e96a77f3a', '178cd2f3df2d88613b46bb6e96a77f3a', '2013-05-30 11:25:10', 'NW', '', 'JB', 1, 0, 'en'),
(458, '6999f337f97688a18dc2459ddb2526c2', 'a3cefde48284f70b2098d7015e987148', 'a3cefde48284f70b2098d7015e987148', '2013-05-30 11:29:55', 'NW', '', 'JB', 1, 1, 'fr'),
(459, 'a4152e5367608792af773fc914fa03cd', 'a3cefde48284f70b2098d7015e987148', 'a3cefde48284f70b2098d7015e987148', '2013-05-30 11:36:50', 'NW', '', 'JB', 1, 1, 'fr'),
(460, '70dfa87dcb9b57f6dd3ffe03b3b0592c', 'a3cefde48284f70b2098d7015e987148', 'a3cefde48284f70b2098d7015e987148', '2013-05-30 11:48:02', 'NW', '', 'JB', 1, 1, 'fr'),
(461, '08af8b816012362b4d17b6ab1f0c8600', 'a3cefde48284f70b2098d7015e987148', 'a3cefde48284f70b2098d7015e987148', '2013-05-30 11:49:46', 'NW', '', 'JB', 1, 1, 'fr'),
(462, 'cd915f41de4f2fe88422d1d7ad61915d', 'a3cefde48284f70b2098d7015e987148', 'a3cefde48284f70b2098d7015e987148', '2013-05-30 13:40:25', 'NW', '', 'JB', 1, 0, 'fr'),
(463, 'ce90f495c8b0d7d8becf553b1b320914', 'a3cefde48284f70b2098d7015e987148', 'a3cefde48284f70b2098d7015e987148', '2013-05-30 13:42:18', 'QU', '', 'JB', 1, 0, 'fr'),
(464, '547941e8563217966f0e80036c021e12', '178cd2f3df2d88613b46bb6e96a77f3a', '178cd2f3df2d88613b46bb6e96a77f3a', '2013-05-30 14:56:32', 'NW', '', 'JB', 1, 0, 'en'),
(465, '3e3955492ae6078c35f60f703e0272a8', '178cd2f3df2d88613b46bb6e96a77f3a', '178cd2f3df2d88613b46bb6e96a77f3a', '2013-05-30 14:58:14', 'NW', '', 'JB', 1, 0, 'en'),
(466, 'dfd5fda3f017aef57404e3b5cd9dfbca', 'a530b55030587b46519449c39181d1b8', 'a530b55030587b46519449c39181d1b8', '2013-05-30 15:23:53', 'QU', '', 'JB', 1, 1, 'fr'),
(467, '0635ca25706fb0e20d66ae4c7aa77d54', '6b2e63b1fd55069fb7cb35fb60f61ed7', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-30 15:33:23', 'GB', '{"towho":"79b1b9dc1b338006650c78d3b4919b04","badge":"travaillleur"}', '', 1, 0, 'xx'),
(468, '06a73adc2f65dd4aceb899495834a23a', '79b1b9dc1b338006650c78d3b4919b04', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 15:33:23', 'RB', '{"towho":"6b2e63b1fd55069fb7cb35fb60f61ed7","badge":"travaillleur"}', '', 0, 0, 'xx'),
(469, '527cecef1ed95bda95894abd1031f565', '6b2e63b1fd55069fb7cb35fb60f61ed7', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-30 15:33:38', 'GB', '{"towho":"79b1b9dc1b338006650c78d3b4919b04","badge":"peindre"}', '', 1, 0, 'xx'),
(470, '464a91f06cd88bde40a53388974785d9', '79b1b9dc1b338006650c78d3b4919b04', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 15:33:38', 'RB', '{"towho":"6b2e63b1fd55069fb7cb35fb60f61ed7","badge":"peindre"}', '', 0, 0, 'xx'),
(471, 'a5cb47045b1623cd6bab15976f843e0e', '6b2e63b1fd55069fb7cb35fb60f61ed7', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-30 15:34:12', 'GB', '{"towho":"79b1b9dc1b338006650c78d3b4919b04","badge":"flexible"}', '', 1, 0, 'xx'),
(472, '6c8a54635688f19128c3fd7e85e48717', '79b1b9dc1b338006650c78d3b4919b04', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 15:34:12', 'RB', '{"towho":"6b2e63b1fd55069fb7cb35fb60f61ed7","badge":"flexible"}', '', 0, 0, 'xx'),
(473, 'b8ec0e57146370e4f089484b381f33bf', '6b2e63b1fd55069fb7cb35fb60f61ed7', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-30 15:34:36', 'GB', '{"towho":"79b1b9dc1b338006650c78d3b4919b04","badge":"ponctual"}', '', 1, 0, 'xx'),
(474, 'cbc67682efc65540ba13485bf60e62d4', '79b1b9dc1b338006650c78d3b4919b04', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 15:34:36', 'RB', '{"towho":"6b2e63b1fd55069fb7cb35fb60f61ed7","badge":"ponctual"}', '', 0, 0, 'xx'),
(475, 'adce037c52ffd798b0e8a6f58c9f0dc3', '6b2e63b1fd55069fb7cb35fb60f61ed7', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-30 15:34:48', 'GB', '{"towho":"79b1b9dc1b338006650c78d3b4919b04","badge":"amical"}', '', 1, 0, 'xx'),
(476, '4692c2918dd3dddab4b82d94c603f41a', '79b1b9dc1b338006650c78d3b4919b04', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 15:34:48', 'RB', '{"towho":"6b2e63b1fd55069fb7cb35fb60f61ed7","badge":"amical"}', '', 0, 0, 'xx'),
(477, 'f944322fb99be6aed44869baae2009b5', '6b2e63b1fd55069fb7cb35fb60f61ed7', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-30 15:35:24', 'GB', '{"towho":"f7a5c01ea63f9176ff7352da1b5dcaa5","badge":"bricoler"}', '', 1, 0, 'xx'),
(478, '37c992201c9ff7e42afc21f5dee25eac', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'f7a5c01ea63f9176ff7352da1b5dcaa5', '2013-05-30 15:35:24', 'RB', '{"towho":"6b2e63b1fd55069fb7cb35fb60f61ed7","badge":"bricoler"}', '', 0, 0, 'xx'),
(479, '0d02ddbfaee275c1a4f310095ef0f4ef', '6b2e63b1fd55069fb7cb35fb60f61ed7', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-30 15:35:46', 'GB', '{"towho":"a3cefde48284f70b2098d7015e987148","badge":"electricity"}', '', 1, 0, 'xx'),
(480, '841e634ec673721993273e2e7a4d38a9', 'a3cefde48284f70b2098d7015e987148', 'a3cefde48284f70b2098d7015e987148', '2013-05-30 15:35:46', 'RB', '{"towho":"6b2e63b1fd55069fb7cb35fb60f61ed7","badge":"electricity"}', '', 0, 0, 'xx'),
(481, '048204c3f98137a98c812e4a0a862312', '6b2e63b1fd55069fb7cb35fb60f61ed7', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-30 15:35:57', 'GB', '{"towho":"2bd8063bffa0986bfbe7e265cfba8a63","badge":"couture"}', '', 1, 0, 'xx'),
(482, '4b627a22b29652734fd0fb67e1d2dced', '2bd8063bffa0986bfbe7e265cfba8a63', '2bd8063bffa0986bfbe7e265cfba8a63', '2013-05-30 15:35:57', 'RB', '{"towho":"6b2e63b1fd55069fb7cb35fb60f61ed7","badge":"couture"}', '', 0, 0, 'xx'),
(483, '4390507e8e3e378c43755c5fb281af42', '6b2e63b1fd55069fb7cb35fb60f61ed7', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-30 15:36:14', 'GB', '{"towho":"48ae9648a43e3633ae647c2583d84116","badge":"decor"}', '', 1, 0, 'xx'),
(484, '3243c4ea19d15ac948bc64cb30c444b2', '48ae9648a43e3633ae647c2583d84116', '48ae9648a43e3633ae647c2583d84116', '2013-05-30 15:36:14', 'RB', '{"towho":"6b2e63b1fd55069fb7cb35fb60f61ed7","badge":"decor"}', '', 0, 0, 'xx'),
(485, '22f59118d4b83c81021f34d231d10946', '6b2e63b1fd55069fb7cb35fb60f61ed7', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-30 15:36:48', 'GB', '{"towho":"2bd8063bffa0986bfbe7e265cfba8a63","badge":"direct"}', '', 1, 0, 'xx'),
(486, '49acb1b47b7d3c2e47c5cf31d64e2691', '2bd8063bffa0986bfbe7e265cfba8a63', '2bd8063bffa0986bfbe7e265cfba8a63', '2013-05-30 15:36:48', 'RB', '{"towho":"6b2e63b1fd55069fb7cb35fb60f61ed7","badge":"direct"}', '', 0, 0, 'xx'),
(487, '2b3bfc6e338bf1226aa3de0e229803b5', '6b2e63b1fd55069fb7cb35fb60f61ed7', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-30 15:37:08', 'GB', '{"towho":"178cd2f3df2d88613b46bb6e96a77f3a","badge":"generous"}', '', 1, 0, 'xx'),
(488, '268e7fe53f09210f6b6c0f48b1b33a96', '178cd2f3df2d88613b46bb6e96a77f3a', '178cd2f3df2d88613b46bb6e96a77f3a', '2013-05-30 15:37:08', 'RB', '{"towho":"6b2e63b1fd55069fb7cb35fb60f61ed7","badge":"generous"}', '', 0, 0, 'xx'),
(489, '776fb7c3c906227910ed63cc3643dc7a', '6b2e63b1fd55069fb7cb35fb60f61ed7', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-30 15:37:21', 'GB', '{"towho":"48ae9648a43e3633ae647c2583d84116","badge":"open"}', '', 1, 0, 'xx'),
(490, 'ecc6099b3c2b8e88acc336df840a996c', '48ae9648a43e3633ae647c2583d84116', '48ae9648a43e3633ae647c2583d84116', '2013-05-30 15:37:21', 'RB', '{"towho":"6b2e63b1fd55069fb7cb35fb60f61ed7","badge":"open"}', '', 0, 0, 'xx'),
(491, 'ec48afd9c84082c36316b8f850a20475', '6b2e63b1fd55069fb7cb35fb60f61ed7', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-30 15:38:14', 'GB', '{"towho":"a530b55030587b46519449c39181d1b8","badge":"habile"}', '', 1, 0, 'xx'),
(492, '04f20ec6f6ed6262972b6852d8c812d4', 'a530b55030587b46519449c39181d1b8', 'a530b55030587b46519449c39181d1b8', '2013-05-30 15:38:14', 'RB', '{"towho":"6b2e63b1fd55069fb7cb35fb60f61ed7","badge":"habile"}', '', 0, 0, 'xx'),
(493, '2306663a27081db8f481b19bc64ab611', '6b2e63b1fd55069fb7cb35fb60f61ed7', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-30 15:38:37', 'GB', '{"towho":"a530b55030587b46519449c39181d1b8","badge":"generous"}', '', 1, 0, 'xx'),
(494, 'a3b7f330fcfc92b42be7a0e5ac1aa76d', 'a530b55030587b46519449c39181d1b8', 'a530b55030587b46519449c39181d1b8', '2013-05-30 15:38:37', 'RB', '{"towho":"6b2e63b1fd55069fb7cb35fb60f61ed7","badge":"generous"}', '', 0, 0, 'xx'),
(495, 'ba40d569306f292180e3fed3a85b8b08', '6b2e63b1fd55069fb7cb35fb60f61ed7', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-30 15:39:02', 'GB', '{"towho":"178cd2f3df2d88613b46bb6e96a77f3a","badge":"nounou"}', '', 1, 0, 'xx'),
(496, 'bb433221d68a682ff916d31c984b743f', '178cd2f3df2d88613b46bb6e96a77f3a', '178cd2f3df2d88613b46bb6e96a77f3a', '2013-05-30 15:39:02', 'RB', '{"towho":"6b2e63b1fd55069fb7cb35fb60f61ed7","badge":"nounou"}', '', 0, 0, 'xx'),
(497, 'abaac59b47d3207a0e46e0af7dfe75e7', '6b2e63b1fd55069fb7cb35fb60f61ed7', '', '2013-05-30 16:47:04', 'PU', '{"fullname":true,"gender":true,"amont":true,"frequency":true,"currency":true,"level":true,"services":true,"webs":true,"yearsexp":true}', 'JB', 1, 0, 'xx'),
(498, '1d5683969b2c0f22a259fab68ce4c992', '6b2e63b1fd55069fb7cb35fb60f61ed7', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-30 16:45:47', 'CU', '79b1b9dc1b338006650c78d3b4919b04', '', 1, 0, 'xx'),
(499, '24e3e53f5d9c28370210b0c7655ba870', '79b1b9dc1b338006650c78d3b4919b04', '', '2013-05-30 17:06:09', 'PU', '{"privacy":true,"fullname":true,"shortdesc":true,"amont":true,"yearsexp":true,"services":true,"webs":true}', 'JB', 1, 0, 'xx'),
(500, '0090aec1c2957cd748fd4f94af9a88de', 'a530b55030587b46519449c39181d1b8', '', '2013-05-30 16:51:03', 'PU', '{"amont":true,"services":true,"webs":true}', 'SV', 1, 0, 'xx'),
(501, 'a099f81185a0ee132aa3659878dd0917', '941af2c99f4f7895b481ab9c3261e4ee', '', '2013-05-30 17:04:23', 'PU', '{"fullname":true,"spot":true,"amont":true,"frequency":true,"currency":true,"level":true,"services":true,"webs":true,"yearsexp":true}', 'JB', 1, 0, 'xx'),
(502, 'b7f64f27fe3f27448f07a21b213c5db6', 'a530b55030587b46519449c39181d1b8', 'a530b55030587b46519449c39181d1b8', '2013-05-30 17:10:53', 'GB', '{"towho":"79b1b9dc1b338006650c78d3b4919b04","badge":"travaillleur"}', '', 1, 0, 'xx'),
(503, 'f2b5928cf606fe15c8f93a4f4c192fbe', '79b1b9dc1b338006650c78d3b4919b04', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 17:10:53', 'RB', '{"towho":"a530b55030587b46519449c39181d1b8","badge":"travaillleur"}', '', 0, 0, 'xx'),
(504, '09c6407bef306ca314a215e7f72d850e', 'a530b55030587b46519449c39181d1b8', 'a530b55030587b46519449c39181d1b8', '2013-05-30 17:11:11', 'GB', '{"towho":"79b1b9dc1b338006650c78d3b4919b04","badge":"dispo"}', '', 1, 0, 'xx'),
(505, 'f5f5c820ea3e7eea9eedabfbf481a417', '79b1b9dc1b338006650c78d3b4919b04', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 17:11:11', 'RB', '{"towho":"a530b55030587b46519449c39181d1b8","badge":"dispo"}', '', 0, 0, 'xx'),
(506, '4b69ff27c9a16682a4217c000e8f3545', 'a530b55030587b46519449c39181d1b8', 'a530b55030587b46519449c39181d1b8', '2013-05-30 17:12:04', 'GB', '{"towho":"79b1b9dc1b338006650c78d3b4919b04","badge":"bricoler"}', '', 1, 0, 'xx'),
(507, 'db3f9916eb2cf11a717d957a28203910', '79b1b9dc1b338006650c78d3b4919b04', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 17:12:04', 'RB', '{"towho":"a530b55030587b46519449c39181d1b8","badge":"bricoler"}', '', 0, 0, 'xx'),
(508, 'fa36d717e1621f1802361cd62c78647e', 'a530b55030587b46519449c39181d1b8', 'a530b55030587b46519449c39181d1b8', '2013-05-30 17:13:54', 'GB', '{"towho":"79b1b9dc1b338006650c78d3b4919b04","badge":"decor"}', '', 1, 0, 'xx'),
(509, '399b58928a9331d1e8bfc83875f4fc59', '79b1b9dc1b338006650c78d3b4919b04', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 17:13:54', 'RB', '{"towho":"a530b55030587b46519449c39181d1b8","badge":"decor"}', '', 0, 0, 'xx'),
(510, '3406ad920a2a680f6942614dc2382382', 'a530b55030587b46519449c39181d1b8', 'a530b55030587b46519449c39181d1b8', '2013-05-30 17:14:09', 'GB', '{"towho":"79b1b9dc1b338006650c78d3b4919b04","badge":"amical"}', '', 1, 0, 'xx'),
(511, 'eef1d55a04d57003eea0af4735cac5db', '79b1b9dc1b338006650c78d3b4919b04', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 17:14:09', 'RB', '{"towho":"a530b55030587b46519449c39181d1b8","badge":"amical"}', '', 0, 0, 'xx'),
(512, '917ab1dc1c340f8bf54b2d936fe02dc4', 'a530b55030587b46519449c39181d1b8', 'a530b55030587b46519449c39181d1b8', '2013-05-30 17:15:03', 'GB', '{"towho":"79b1b9dc1b338006650c78d3b4919b04","badge":"peindre"}', '', 1, 0, 'xx'),
(513, 'b2e72d41816f1a9df81f00e92d6c28eb', '79b1b9dc1b338006650c78d3b4919b04', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 17:15:03', 'RB', '{"towho":"a530b55030587b46519449c39181d1b8","badge":"peindre"}', '', 0, 0, 'xx'),
(514, 'd3faa2fb6cc9e4bfb5295a974d0403b4', 'a530b55030587b46519449c39181d1b8', 'a530b55030587b46519449c39181d1b8', '2013-05-30 17:33:55', 'QU', '', 'JB', 1, 1, 'fr'),
(515, '5eb6dd0eed8c9057298b7feda95fb67d', 'a530b55030587b46519449c39181d1b8', 'a530b55030587b46519449c39181d1b8', '2013-05-30 18:22:50', 'QU', '', 'JB', 1, 1, 'fr'),
(516, 'f8331425f3a89d15c6b5d298b112ceaa', 'a530b55030587b46519449c39181d1b8', 'a530b55030587b46519449c39181d1b8', '2013-05-31 04:29:40', 'QU', '', 'JB', 1, 0, 'fr'),
(517, '0f602b507c2a2b8802876cf77b61ac43', 'a530b55030587b46519449c39181d1b8', 'a530b55030587b46519449c39181d1b8', '2013-05-31 09:18:10', 'GB', '{"towho":"6b2e63b1fd55069fb7cb35fb60f61ed7","badge":"serviable"}', '', 1, 0, 'xx'),
(518, '4439cc0450d71bbe4b8224ac14003c2b', '6b2e63b1fd55069fb7cb35fb60f61ed7', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-31 09:18:10', 'RB', '{"towho":"a530b55030587b46519449c39181d1b8","badge":"serviable"}', '', 0, 0, 'xx'),
(519, 'd0042cc185b574d58187377c380f546d', 'a530b55030587b46519449c39181d1b8', 'a530b55030587b46519449c39181d1b8', '2013-05-31 09:19:28', 'GB', '{"towho":"6b2e63b1fd55069fb7cb35fb60f61ed7","badge":"peindre"}', '', 1, 0, 'xx'),
(520, '4b9faf9f9610031130557d938bd27404', '6b2e63b1fd55069fb7cb35fb60f61ed7', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-31 09:19:28', 'RB', '{"towho":"a530b55030587b46519449c39181d1b8","badge":"peindre"}', '', 0, 0, 'xx'),
(521, '97af61129f459ef8256f5f94a058f19b', '79b1b9dc1b338006650c78d3b4919b04', '', '2013-05-31 10:58:51', 'PU', '{"shortdesc":true,"level":true,"yearsexp":true,"webs":true,"calendar":true}', 'JB', 1, 0, 'xx'),
(522, '47adc3bc4fff8db972c1701c4d286759', 'a530b55030587b46519449c39181d1b8', 'a530b55030587b46519449c39181d1b8', '2013-05-31 11:14:29', 'FU', '178cd2f3df2d88613b46bb6e96a77f3a;48ae9648a43e3633ae647c2583d84116;79b1b9dc1b338006650c78d3b4919b04', '', 1, 0, 'xx'),
(523, '7167bd95850817ea622d41df31964520', 'a530b55030587b46519449c39181d1b8', 'a530b55030587b46519449c39181d1b8', '2013-05-31 11:04:35', 'GB', '{"towho":"941af2c99f4f7895b481ab9c3261e4ee","badge":"balenced"}', '', 1, 0, 'xx'),
(524, '8315f92116fb8362c4f81ced0666f4c2', '941af2c99f4f7895b481ab9c3261e4ee', '941af2c99f4f7895b481ab9c3261e4ee', '2013-05-31 11:04:35', 'RB', '{"towho":"a530b55030587b46519449c39181d1b8","badge":"balenced"}', '', 0, 0, 'xx'),
(525, 'dc95f5887bba86d5c0c14164945430f8', 'a530b55030587b46519449c39181d1b8', 'a530b55030587b46519449c39181d1b8', '2013-05-31 11:05:00', 'GB', '{"towho":"941af2c99f4f7895b481ab9c3261e4ee","badge":"attachant"}', '', 1, 0, 'xx'),
(526, '62cc9900a96b1a192cfc35b44d100422', '941af2c99f4f7895b481ab9c3261e4ee', '941af2c99f4f7895b481ab9c3261e4ee', '2013-05-31 11:05:01', 'RB', '{"towho":"a530b55030587b46519449c39181d1b8","badge":"attachant"}', '', 0, 0, 'xx'),
(527, 'afd15b193deba34e28c9f853c3653885', '79b1b9dc1b338006650c78d3b4919b04', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-31 11:19:22', 'CU', 'a530b55030587b46519449c39181d1b8', '', 1, 0, 'xx'),
(528, '4cc6412835cd25a5d18214ba8456df50', '941af2c99f4f7895b481ab9c3261e4ee', '941af2c99f4f7895b481ab9c3261e4ee', '2013-06-02 17:38:41', 'NW', '', 'SV', 1, 0, 'fr'),
(529, 'ce5843307ce99863a62a309ac9e47917', '5a6097a8f128c86769da4e977927a78d', '5a6097a8f128c86769da4e977927a78d', '2013-09-14 01:28:38', '', '', 'JB', 1, 0, 'xx'),
(530, '014102de290dab378622ca5ea0e6a93a', '5a6097a8f128c86769da4e977927a78d', '5a6097a8f128c86769da4e977927a78d', '2013-09-14 01:29:00', 'NW', '', 'JB', 1, 0, 'fr'),
(531, '298a4cd3cb1a22cfdc5f01f55c87156f', '5a6097a8f128c86769da4e977927a78d', '5a6097a8f128c86769da4e977927a78d', '2013-09-14 01:30:28', 'NW', '', 'JB', 1, 0, 'fr'),
(532, '65df8ab94556876b40e4ace399340b3f', '5a6097a8f128c86769da4e977927a78d', '5a6097a8f128c86769da4e977927a78d', '2013-09-14 01:37:06', 'NW', '', 'JB', 1, 0, 'fr');

-- --------------------------------------------------------

--
-- Table structure for table `activity_network`
--

CREATE TABLE `activity_network` (
  `id_act_actnet` varchar(32) NOT NULL,
  `id_net_actnet` varchar(32) NOT NULL,
  PRIMARY KEY (`id_act_actnet`,`id_net_actnet`),
  KEY `activity_network_ibfk_2` (`id_net_actnet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `badge`
--

CREATE TABLE `badge` (
  `name_bdg` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `title_bdg` varchar(64) CHARACTER SET utf8 NOT NULL,
  `desc_bdg` text CHARACTER SET utf8 NOT NULL,
  `rules_bdg` text,
  `type_bdg` enum('PERS','SKILL','ACTION','WISH') CHARACTER SET utf8 NOT NULL DEFAULT 'WISH',
  `parent_bdg` varchar(32) DEFAULT NULL,
  `status_bdg` smallint(6) NOT NULL DEFAULT '1',
  `lang_bdg` varchar(2) NOT NULL DEFAULT 'fr',
  UNIQUE KEY `name_bdg` (`name_bdg`,`lang_bdg`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `badge`
--

INSERT INTO `badge` (`name_bdg`, `title_bdg`, `desc_bdg`, `rules_bdg`, `type_bdg`, `parent_bdg`, `status_bdg`, `lang_bdg`) VALUES
('1user', '1st Visitors', 'People with this badge are the first visitors and users who have had the curiosity to discover our Yoomken network. We thank them because without them  the project would not have been continued.', 'This badge is unlocked, If you are part in the first 1000 registered user in Yoomken.', 'ACTION', NULL, 1, 'en'),
('1user', '1er Visiteurs', 'Les détenteurs de ce badge sont les premiers visiteurs et utilisateurs qui ont eu la curiosité de découvrir notre réseau Yoomken. De la part de toute l''équipe, nous les remercions car sans eux le projet Yoomken n''aurai pas pu être amorçé.', 'Ce badge vous est débloqué dans le cas oû vous faites partie des 1000 premiers inscrits de Yoomken.', 'ACTION', NULL, 1, 'fr'),
('amical', 'friendly', 'People with this badge have good human contact to make friends and to keep them. Their main qualities come from their listening and communication.', '', 'PERS', '59aea376bb5a51fa034d8963e2ea815d', 1, 'en'),
('amical', 'amical', 'Les détenteurs de ce badge ont le sens du contact pour se faire des amis et les entretenir. Leurs principales qualités proviennent de leur écoute et leur communication.', '', 'PERS', '59aea376bb5a51fa034d8963e2ea815d', 1, 'fr'),
('assembly', 'assembly furniture', 'The holders of this badge has an ease to install the furniture and assemble objects.', NULL, 'SKILL', '671c9eca7f36118e0e336a9def3fdee0', 1, 'en'),
('assembly', 'Montage & Assemblage', 'Les titulaires de ce badge possédent une aisance à monter le mobilier et assembler les objets (montage de meuble, pose de parquet etc..). ', NULL, 'SKILL', '671c9eca7f36118e0e336a9def3fdee0', 1, 'fr'),
('attachant', 'endearing', 'Endearing people are very appreciated by their relations. This means that people with this badge are in very good position to be supported or to receive help.', NULL, 'PERS', '59aea376bb5a51fa034d8963e2ea815d', 1, 'en'),
('attachant', 'attachant', 'Les personnes attachantes sont trés appréciés par leurs relations. Ce qui implique que les detenteurs de ce badge se placent en position trés favorable pour être supporté ou recevoir de l''aide.', NULL, 'PERS', '59aea376bb5a51fa034d8963e2ea815d', 1, 'fr'),
('balenced', 'balanced', 'People with this badge are in harmony between out their workload and their personal stuff. It is obvious to them "Personal life should interfere rarely with the profesionnal life".', NULL, 'PERS', '59aea376bb5a51fa034d8963e2ea815d', 1, 'en'),
('balenced', 'équilibré', 'Les détenteurs de ce badge sont en harmonie entre leur charge de travail et leur vie personnelle.', NULL, 'PERS', '59aea376bb5a51fa034d8963e2ea815d', 1, 'fr'),
('bodyCare', 'body care', 'People with this badge are known to practice satisfactory body care or to follow  body care rituals for themself.', NULL, 'SKILL', '4f1c6a961dec28865c792b5b2514120c', 1, 'en'),
('bodyCare', 'soin du corps', 'Les personnes avec ce badge sont reconnues pour pratiquer des soins satisfaisantes sur le corps ou pour suivre eux-même des rituels de soin au quotidien. Dans les deux cas, elles sont suceptibles de partager des idées intéressantes pour entrenir la jeunesse et la beauté du corps.', NULL, 'SKILL', '4f1c6a961dec28865c792b5b2514120c', 1, 'fr'),
('bricoler', 'DIY', 'People with this badge have demonstrated outside or inside the professional context they were remarkable in DIY tasks related to the creation, improvement, repair and maintenance of all material things.', NULL, 'SKILL', '671c9eca7f36118e0e336a9def3fdee0', 1, 'en'),
('bricoler', 'bricolage', 'Les détenteurs de ce badge ont démontré en tant qu''amateur ou professionnel qu''ils étaient remarquables dans les tâches de bricolage liées à la création, l''amélioration, la réparation et l''entretien de toutes choses matérielles.', NULL, 'SKILL', '671c9eca7f36118e0e336a9def3fdee0', 1, 'fr'),
('brillant', 'brilliant', 'People with this badge have proven they are remarkable in the tasks entrusted to them. Either by showing their understanding and adaptions to the needs of their customers or by providing a perfect result.', NULL, 'PERS', '5f1c6a961dec28865c792b5b2514120c', 1, 'en'),
('brillant', 'brillant', 'Les détenteurs de ce badge ont démontré qu''ils étaient remarquables dans les tâches qui leur sont confiées. Soit en prouvant qu''ils savaient comprendre et s''adapter aux besoins de leurs clients ou soit en fournissant un résultat parfait. ', NULL, 'PERS', '5f1c6a961dec28865c792b5b2514120c', 1, 'fr'),
('calme', 'quiet', '', NULL, 'PERS', '59aea376bb5a51fa034d8963e2ea815d', 0, 'en'),
('calme', 'calme', '', NULL, 'PERS', '59aea376bb5a51fa034d8963e2ea815d', 0, 'fr'),
('coiffure', 'hairdressing', 'Holders of this badge have demonstrated their skills in the art of arranging and cutting the hair.', NULL, 'SKILL', '4f1c6a961dec28865c792b5b2514120c', 1, 'en'),
('coiffure', 'coiffure', 'Les détenteurs de ce badge ont démontré une habileté dans l''art d''arranger et couper les cheveux.', NULL, 'SKILL', '4f1c6a961dec28865c792b5b2514120c', 1, 'fr'),
('communicatif', 'communicative', 'People who received this badge have shown they excel the art of communication in a private sphere as well as in a business environment.', NULL, 'PERS', '59aea376bb5a51fa034d8963e2ea815d', 1, 'en'),
('communicatif', 'communicatif', 'Les personnes détenant ce badge ont montré qu''ils maîtrisent l''art de la communication dans un environnement privé ou d''affaires.', NULL, 'PERS', '59aea376bb5a51fa034d8963e2ea815d', 1, 'fr'),
('construction', 'construction', 'By receiving this badge, these holders have proven to their relations they excelled in construction (masonry, roofing, tile installation etc. ..) and are therefore able to transfer advices in their respective area.', 'People with this badge are logically autorized in the professional sphere to assemble different parts of a building using materials and techniques appropriate which comply with the regulations in force.  This badge is only given to professionals that you know.', 'SKILL', '671c9eca7f36118e0e336a9def3fdee0', 1, 'en'),
('construction', 'construction', 'En recevant ce badge, ces détenteurs logiquement professionels ont prouvé à leurs relations qu''ils excelaient dans la construction (maçonnerie, couverture etc.. ) et sont donc capable de transférer des conseils dans leur domaine respective.', 'Les personnes avec ce badge sont logiquement habilitées dans le cadre professionnelle à assembler différents éléments d''un édifice en utilisant des matériaux et des techniques appropriées qui respectent les réglementations en vigueur. \nCe badge ne doit être donné donc qu''à des professionnels que vous connaissez.', 'SKILL', '671c9eca7f36118e0e336a9def3fdee0', 1, 'fr'),
('cosmetic', 'cosmetic', 'This badge holders have a good experience and knowledge in the use of cosmetics to beautify the face or various external parts of the human body.', NULL, 'SKILL', '4f1c6a961dec28865c792b5b2514120c', 1, 'en'),
('cosmetic', 'cosmetique', 'Les détenteurs de ce badge possédent une bonne expérience et connaisance dans l''utilisation de produits cosmétiques pour l''embellissement du visage ou diverses parties superficielles du corps humain.', NULL, 'SKILL', '4f1c6a961dec28865c792b5b2514120c', 1, 'fr'),
('couture', 'sewing', 'People with this badge are known to have excellent skills in making, editing or adjusting clothing whether for leisure or work.', NULL, 'SKILL', '671c9eca7f36118e0e336a9def3fdee0', 1, 'en'),
('couture', 'couture', 'Les détenteurs de ce badge sont reconnus pour posséder un excellent savoir-faire dans la confection, la retouche ou l''ajustement de vêtements que ce soit pour le loisir ou le travail. ', NULL, 'SKILL', '671c9eca7f36118e0e336a9def3fdee0', 1, 'fr'),
('creative', 'creative', 'People with this badge are able to innovate, to find new ideas, designing a new product or to see solutions where everyone see barriers. <br/>\n"Being creative make often the difference between good operators and high-potential", Julien Lucas.', NULL, 'PERS', '5f1c6a961dec28865c792b5b2514120c', 1, 'en'),
('creative', 'creatif', 'Les détenteurs de ce badge sont capables d''innover, de trouver de nouvelles idées, de concevoir un nouveau produit ou de voir des solutions là ou tout le monde voit des barrières. <br/>\n"Etre créatif fait souvent la différence entre les bons opérationnels et les haut-potentiels", Julien Lucas.', NULL, 'PERS', '5f1c6a961dec28865c792b5b2514120c', 1, 'fr'),
('cuisiner', 'cooking', 'People with this badge hold the art of cooking. They have demonstrated they knew how to prepare food and cook dishes of flavour.', NULL, 'SKILL', '5e1c6a961dec28865c792b5b2514120c', 1, 'en'),
('cuisiner', 'cuisinerie', 'Les détenteurs de ce badge maitrisent l''art culinaire. Ils ont démontré qu''ils savaient préparer des aliments et cuisiner des plats avec saveur.', NULL, 'SKILL', '5e1c6a961dec28865c792b5b2514120c', 1, 'fr'),
('decor', 'decoration', 'People with this badge have a great talent to embellish a room or an object. By receiving this badge, they have satisfied their relations by sharing good decorating ideas.', NULL, 'SKILL', '671c9eca7f36118e0e336a9def3fdee0', 1, 'en'),
('decor', 'décoration', 'Les détenteurs de ce badge possêdent un excellent talent céative pour embéllir une piéce ou un objet. En recevant ce badge, ils ont satisfait  leur entourage en partageant entre autre des bonnes idées de décoration.', NULL, 'SKILL', '671c9eca7f36118e0e336a9def3fdee0', 1, 'fr'),
('direct', 'direct', 'People with this badge have the particularity to go straight to the point with tact.<br/>\n"People who are direct keep their integrity by being honest towards others", Kobad Ghandy.', '', 'PERS', '59aea376bb5a51fa034d8963e2ea815d', 1, 'en'),
('direct', 'direct', 'Les détenteurs de ce badge ont la particularité d''aller droit au but sans chemins détournés en faisant preuve de tact.<br/>\n"Les personnes directs conservent leur intégrité en étant honnêtes vis à vis des gens", Kobad Ghandy.', '', 'PERS', '59aea376bb5a51fa034d8963e2ea815d', 1, 'fr'),
('dispo', 'availaible', 'People with this badge are concerned to keep being available and responding to all requests. Even when they are in downtime, they do the effort to call back.', NULL, 'PERS', '5f1c6a961dec28865c792b5b2514120c', 1, 'en'),
('dispo', 'disponible', 'Les détenteurs de ce badge sont soucieux de se rendre disponible en répondant à toutes les sollicitations. Même lorsqu''ils sont en période d''indisponibilité, ils font l''effort de rappeler.  ', NULL, 'PERS', '5f1c6a961dec28865c792b5b2514120c', 1, 'fr'),
('donator', 'donator', 'People with this badge are donors who contributed financially to raise the Yoomken project. On behalf of the entire team, we thank them for their trust.', 'This badge is gotten if you have had the opportunity to make a donation during our companions launched via crowdfunding platforms <a href=''http://www.kickstarter.com''> KickStarter </ a> or <a href = ''http://www.fundraise.com''> Fundraise </ a>', 'ACTION', NULL, 1, 'en'),
('donator', 'donateur', 'Les détenteurs de ce badge sont les donateurs qui ont contribué financièrement à faire démarer le projet Yoomken. De la part de toute l''équipe, nous les remercions de leur confiance et de leurs précieux soutiens.', 'Ce badge est acquis dans le cas oû vous avez eu l''occasion de faire une donation durant nos compagnes de crowdfunding lancé via les plateformes <a href=''http://www.kickstarter.com''>KickStarter</a> ou <a href=''http://www.fundraise.com''>Fundraise</a> ', 'ACTION', NULL, 1, 'fr'),
('ecolo', 'green', 'Being green can be summarized in "3R" which are the three basic rules: reduce, reuse and recycle. People with this badge follow these rules and / or offer solutions that help to apply these rules.', NULL, 'PERS', '5f1c6a961dec28865c792b5b2514120c', 1, 'en'),
('ecolo', 'écolo', 'Etre écolo se résume en "3R" qui sont les trois règles fondamentaux : réduire, réutiliser et recycler. Les détendeurs de ce badge suivent ces fondamentaux et/ou offrent des solutions qui les appliquent. ', NULL, 'PERS', '5f1c6a961dec28865c792b5b2514120c', 1, 'fr'),
('electricity', 'electricity', 'By receiving this badge, the holders have shown that they can effectively carry out a system or electrical wiring in accordance with the recent standards.', 'Logically, this badge is only given to professionals that you know since it represents a expertise in accordance to recent electrical standards essential to avoid electrical problem in the house.', 'SKILL', '671c9eca7f36118e0e336a9def3fdee0', 1, 'en'),
('electricity', 'electricité', 'En recevant ce badge, les détenteurs logiquement profesionnels ont démontré qu''elles étaient capable de réaliser efficacement une installation électrique mise aux récentes normes.', 'Les personnes avec ce badge sont logiquement des professionels habitués à câbler des réseaux basse et haute tension. Ce badge ne doit être donné qu''à des professionnels que vous connaissez puisqu''il represente un métier qui a connaisance des récentes normes indispensable en raison de l''impact direct sur la sécurité de la population.\n', 'SKILL', '671c9eca7f36118e0e336a9def3fdee0', 1, 'fr'),
('energic', 'energic', 'The owners of this badge hold a high energy and motivation to get things done, not only for themselves but also for the people around them to give their personal best.', NULL, 'PERS', '5f1c6a961dec28865c792b5b2514120c', 1, 'en'),
('energic', 'énergique', 'Les propriétaires de ce badge détiennent une grande énergie et motivation pour faire avancer les choses. Cette energie se transmet aussi aux gens autour d''eux afin d''atteindre une performance optimale.', NULL, 'PERS', '5f1c6a961dec28865c792b5b2514120c', 1, 'fr'),
('flexible', 'flexible', 'Flexible people demonstrate an ability to adapt to circumstances such as an intervention out of their regular schedule or offering exclusive services. People with  this badge have proven that we can count on them to adapt.', '', 'PERS', '5f1c6a961dec28865c792b5b2514120c', 1, 'en'),
('flexible', 'flexible', 'Les personnes flexibles démontrent une capacité d''adaptation aux circonstances qui peut se traduire par une intervention en dehors de leur horaire habituel ou par la presatation de services exclusifs. Les détenteurs de ce badge ont prouvé qu''on peut compter sur eux pour s''adapter.', '', 'PERS', '5f1c6a961dec28865c792b5b2514120c', 1, 'fr'),
('funny', 'funny', 'People who received this badge have shown that it easy to entertain people whether they are kids or adults.', NULL, 'PERS', '59aea376bb5a51fa034d8963e2ea815d', 1, 'en'),
('funny', 'amusant', 'Les personnes qui ont acquis ce badge ont montré qu''ils ont une facilité à amuser les gens qu''ils soient petits ou grands.', NULL, 'PERS', '59aea376bb5a51fa034d8963e2ea815d', 1, 'fr'),
('gastronomie', 'gastronomy', '', NULL, 'SKILL', NULL, 0, 'en'),
('gastronomie', 'gastronomie', '', NULL, 'SKILL', NULL, 0, 'fr'),
('generous', 'generous', 'Generosity isn''t just about money, it''s also giving his time and attention. People with this badge have these generous qualities that express their greatness of soul.', '', 'PERS', '59aea376bb5a51fa034d8963e2ea815d', 1, 'en'),
('generous', 'généreux', 'La générosité ne concerne pas que le porte-monnaie, c''est aussi donner de son temps et de l''attention.  Les acquéreurs de ce badge disposent de ces qualités généreuses qui expriment leur grandeur d''âme.', '', 'PERS', '59aea376bb5a51fa034d8963e2ea815d', 1, 'fr'),
('gentil', 'kind', ' ', '', 'PERS', '59aea376bb5a51fa034d8963e2ea815d', 0, 'en'),
('gentil', 'gentil', ' ', '', 'PERS', '59aea376bb5a51fa034d8963e2ea815d', 0, 'fr'),
('habile', 'dexterous', ' People with this badge recognized dexterous, have shown they practice with talent and skill their manual art.', '', 'PERS', '5f1c6a961dec28865c792b5b2514120c', 1, 'en'),
('habile', 'habile', ' Les détenteurs de ce badge reconnus habiles ont montré qu''ils pratiquaient avec adresse et compétence leur art de leurs mains.', '', 'PERS', '5f1c6a961dec28865c792b5b2514120c', 1, 'fr'),
('helpPerson', 'assistance to a person', 'People with this badge are known by their communities as being sensitive to the plight of elderly or vulnerable people and eager to help them.', NULL, 'SKILL', '9657daa44260bb346d8baaed5f865606', 1, 'en'),
('helpPerson', 'assistance à la personne', 'Les détenteurs de ce badge sont reconnus par leur entourage comme étant des personnes sensibles aux difficultés des personnes fragiles ou agées et désireux de les aider.', NULL, 'SKILL', '9657daa44260bb346d8baaed5f865606', 1, 'fr'),
('jardin', 'gardening', 'People with this badge are passionate about gardering and have all the knowledges to plant and maintain plants in ideal conditions for their development both for aesthetic and / or food purposes.', NULL, 'SKILL', '671c9eca7f36118e0e336a9def3fdee0', 1, 'en'),
('jardin', 'jardinage', 'Les personnes qui ont acquis ce badge sont des passionnées de jardinnage et possédent toutes les connaissances pour planter et maintenir des végétaux dans des conditions idéales pour leur développement  que ce soit pour un but esthétique et/ou alimentaire.', NULL, 'SKILL', '671c9eca7f36118e0e336a9def3fdee0', 1, 'fr'),
('keepingPets', 'keeping of pets', 'People who received this badge are known to love animals and care to them.', NULL, 'SKILL', '9657daa44260bb346d8baaed5f865606', 1, 'en'),
('keepingPets', 'garde d''animaux', 'Les personnes qui possédent ce badge sont reconnues pour aimer les animaux et en prendre le plus grand soin.', NULL, 'SKILL', '9657daa44260bb346d8baaed5f865606', 1, 'fr'),
('lavage', 'washing', 'People with this badge are used to wash clothes or towels and know therefore various tricks to achieve it in the best way.', NULL, 'SKILL', 'd2ffb970ba1b3700f8ea9baa32bffd74', 1, 'en'),
('lavage', 'lavage linge', 'Les détenteurs de ce badge ont l''habitude de laver le linge et ont donc connaissance de divers astuces pour le réaliser de la meilleur maniére.', NULL, 'SKILL', 'd2ffb970ba1b3700f8ea9baa32bffd74', 1, 'fr'),
('menuserie', 'woodwork', 'People with this badge master the art of carpentry applications as an amateur or profesionnal, making them eligible to build or repair of movable objects such as beds, doors, etc. ..', NULL, 'SKILL', '671c9eca7f36118e0e336a9def3fdee0', 1, 'en'),
('menuserie', 'menuserie', 'Les détenteurs de ce badge maitrise l''art de la menuserie en tant qu''amateur ou profesionnel, ce qui les rend éligible à construire ou réparer des objets mobiliers tel que des lits, des portes etc..', NULL, 'SKILL', '671c9eca7f36118e0e336a9def3fdee0', 1, 'fr'),
('moving', 'moving belongings', 'Holders have received this badge from their relations who have been grateful for their action during a transport of their personal properties. they either provided a suitable vehicle or were involved in the effort of moving.', NULL, 'SKILL', '49aea376bb5a51fa034d8963e2ea815d', 1, 'en'),
('moving', 'transport de biens mobiliers', 'Les détenteurs ont reçu ce badge de leurs relations qui ont été reconnaissantes de leur action à l''occasion d''un transport de leurs biens mobiliers. ils ont soit fournit un véhicule adapté ou soit participé à l''effort du déplacement.', NULL, 'SKILL', '49aea376bb5a51fa034d8963e2ea815d', 1, 'fr'),
('nettoyer', 'cleaning', 'People with this badge are meticulous in the cleanliness and get a pleasure to leave behind things clean and tidy.', NULL, 'SKILL', 'd2ffb970ba1b3700f8ea9baa32bffd74', 1, 'en'),
('nettoyer', 'nettoyage', 'Les détenteurs de ce badge sont minitieux dans la propreté et ont un plaisir de laisser derriére eux les choses propres et bien rangées. ', NULL, 'SKILL', 'd2ffb970ba1b3700f8ea9baa32bffd74', 1, 'fr'),
('nounou', 'baby-sitting', 'People who received this badge have proven they know devoting attention to children and educating them in a playful way.', NULL, 'SKILL', '9657daa44260bb346d8baaed5f865606', 1, 'en'),
('nounou', 'baby-sitting', 'Les personnes qui ont reçu ce badge ont prouvé qu''elles savent accorder une attention aux enfants et les éduquer de façon ludique.', NULL, 'SKILL', '9657daa44260bb346d8baaed5f865606', 1, 'fr'),
('nounouplus', 'nanny', 'People with this badge have been recognized by some families as perfect nannies.', 'Logically, this badge is only given to professionals that you know and who are authorized in the professional sphere to care babies and children. ', 'SKILL', '9657daa44260bb346d8baaed5f865606', 1, 'en'),
('nounouplus', 'nounou', 'Les personnes détenant ce badge ont été reconnues par certaines familles comme des nounous d''enfer.', 'Logiquement, ce badge n''est donné qu''à des professionnels que vous connaissez et qui sont habilitées dans le cadre professionnel à s''occuper des bébés et enfants.', 'SKILL', '9657daa44260bb346d8baaed5f865606', 1, 'fr'),
('nutrition', 'nutrition', 'The science of nutrition is a dietary approach for a health perpective. People with this badge possess the knowledges to advise or offer balanced eating. <br/>\n"Let your food be your medicine", Hippocrates.', NULL, 'SKILL', '5e1c6a961dec28865c792b5b2514120c', 1, 'en'),
('nutrition', 'nutrition', 'La science de la nutrition est une approche alimentaire dans une perpective de santé. Les détenteurs de ce badge possédent les connaisances pour conseiller ou offrir des alimentations équilibrées. <br/>\n« Que ton aliment soit ton médicament », disait Hippocrate.', NULL, 'SKILL', '5e1c6a961dec28865c792b5b2514120c', 1, 'fr'),
('open', 'open mind', 'Open mind, it''s to accept to meet opposed points of view and recognizing a certain value. Therefore, people with this badge clearly respect each other''s differences. <br/>\n"The mind is like a parachute: it only works when it''s open." Edgar Morin.', NULL, 'PERS', '59aea376bb5a51fa034d8963e2ea815d', 1, 'en'),
('open', 'ouvert d''esprit', 'L''ouverture d''esprit, c''est accepter de rencontrer des points de vue opposés aux siens et en reconnaitre une certaine valeur. Les détenteurs de ce badge respectent donc clairement les différences des autres.<br/>\n"L''esprit est comme un parachute: il ne fonctionne que lorsqu''il est ouvert."  Edgar Morin.', '', 'PERS', '59aea376bb5a51fa034d8963e2ea815d', 1, 'fr'),
('organized', 'organized', 'Organized people take the time to plan methodically their future tasks. This means people with this badge have control of their time and are better prepared to reach their goals.', NULL, 'PERS', '5f1c6a961dec28865c792b5b2514120c', 1, 'en'),
('organized', 'organisé', 'Les personnes organisées prennent le temps de planifier méthodiquement leurs tâches futures. Ce qui implique que les detenteurs de ce badge maitrisent leur emploi du temps et sont les mieux préparés pour avancer vers des objectifs fixés.', NULL, 'PERS', '5f1c6a961dec28865c792b5b2514120c', 1, 'fr'),
('patisser', 'pastry', 'The art of pastry refers to both the know-how for the preparation of cakes and pies and as well the art of their confection. People with this badge have good skills in the sweet food preparation.', NULL, 'SKILL', '5e1c6a961dec28865c792b5b2514120c', 1, 'en'),
('patisser', 'pâtisserie', 'L''art de la pâtisserie désigne à la fois le savoir faire pour les préparations de gâteaux et tartes et ainsi que l''art de leur confection. Les détenteurs de ce badge possèdent des compétences reconnues dans la préparation culinaire sucrée.', NULL, 'SKILL', '5e1c6a961dec28865c792b5b2514120c', 1, 'fr'),
('peindre', 'painting', 'People with this badge have demonstrated an impressive efficacy in coating and painting surfaces such as wall, ceiling and woodwork.', NULL, 'SKILL', '671c9eca7f36118e0e336a9def3fdee0', 1, 'en'),
('peindre', 'peinture', 'Les personnes avec ce badge ont démontré une impressionnante efficacité à enduire et peindre les surfaces tel que les murs, plafonds et boiseries.', NULL, 'SKILL', '671c9eca7f36118e0e336a9def3fdee0', 1, 'fr'),
('plomberie', 'plumbing', 'People with this badge have been recognized in a profesionel context for their good work to install tubes, pipes, valves, valve assemblies or devices that allows the flow of fluid (liquid or gas) safely.', 'Logically, this badge must only be given to the professionals that you know since much of the plumbing work is regulated by government  due to the direct impact on the public''s health, safety, and welfare.', 'SKILL', '671c9eca7f36118e0e336a9def3fdee0', 1, 'en'),
('plomberie', 'plomberie', 'Les détenteurs de ce badge ont été reconnus dans un cadre profesionel pour leur bonne pratique d''instalation  des tuyaux, tubes, robinets ou soupapes qui permet la circulation de fluide (liquide ou gaz) de façon sécuritaire. ', 'Logiquement, ce badge ne doit être donné qu''à des professionels que vous connaissez puisque le travail de plomberie est régie par des codes d''installation strictes en raison de l''impact direct sur la santé, la sécurité et le bien-être de la population.', 'SKILL', '671c9eca7f36118e0e336a9def3fdee0', 1, 'fr'),
('ponctual', 'punctual', 'Being punctual has many facets such as showing up on time, completing their tasks before the deadline sets... People who received this badge master all of them.', NULL, 'PERS', '5f1c6a961dec28865c792b5b2514120c', 1, 'en'),
('ponctual', 'ponctuel', 'Etre ponctuel a de nombreuses facettes tel qu''arriver à l''heure, accomplir ses tâches avant la fin des délais... Les personnes qui ont reçu ce badge suivent tous ces qualités.', NULL, 'PERS', '5f1c6a961dec28865c792b5b2514120c', 1, 'fr'),
('productif', 'productive', 'People with this badge are known to have a good work performance.', NULL, 'PERS', '5f1c6a961dec28865c792b5b2514120c', 1, 'en'),
('productif', 'productif', 'Les détenteurs de ce badge sont reconnus pour avoir un bon rendement de travail. ', NULL, 'PERS', '5f1c6a961dec28865c792b5b2514120c', 1, 'fr'),
('rapide', 'fast', 'People with this badge act quickly. They are quick to arrive to the destination or to perform their duties very satisfactorily.', NULL, 'PERS', '5f1c6a961dec28865c792b5b2514120c', 1, 'en'),
('rapide', 'rapide', 'Les détenteurs de ce badge agissent vite. ils font preuve de rapidité pour arriver à destination ou accomplir leur tâche de manière trés satisfaisante.', NULL, 'PERS', '5f1c6a961dec28865c792b5b2514120c', 1, 'fr'),
('receptif', 'receptive', 'Listening is the basis of all human relationships. This badge holders have well it understood, they are receptive to the needs of their interlocutor and act accordingly.<br/>\n"If a man has two ears and one mouth, is to listen twice more as he speak.", Samuel Beckett.', NULL, 'PERS', '59aea376bb5a51fa034d8963e2ea815d', 1, 'en'),
('receptif', 'réceptif', 'Etre à l''écoute est la base de toute relation humaine. Les détenteurs de ce badge l''ont bien compris, ils sont réceptifs aux besoins de leurs interlocuteurs et agissent en conséquence. <br/>\n"Si l''homme a deux oreilles et une bouche, c''est pour écouter deux fois plus qu''il ne parle.", Samuel Beckett.', NULL, 'PERS', '59aea376bb5a51fa034d8963e2ea815d', 1, 'fr'),
('repairBike', 'repair bikecycle', 'Holders of this badge has known to have an extensive experience and knowledge in the maintenance and repair of bikecycle.', NULL, 'SKILL', '9657daa44260bb346d8baaed5f865607', 1, 'en'),
('repairBike', 'reparation vélo', 'Les détenteurs de ce badge sont connus pour posséder une vaste expérience et connaisance dans l''entretien ou la réparation des bicyclettes. \n', NULL, 'SKILL', '9657daa44260bb346d8baaed5f865607', 1, 'fr'),
('repairCar', 'repair car', 'Holders of this badge has known to have an extensive experience and knowledge in the maintenance and repair of cars.', NULL, 'SKILL', '9657daa44260bb346d8baaed5f865607', 1, 'en'),
('repairCar', 'reparation voiture', 'Les détenteurs de ce badge sont connus pour posséder une vaste expérience et connaisance dans l''entretien ou la réparation des voitures. ', NULL, 'SKILL', '9657daa44260bb346d8baaed5f865607', 1, 'fr'),
('repairMachine', 'repair machine', 'The owners of this badge have shown an impressive ability to diagnose electrical and mechanical abnormalities of defective devices. What makes them better able to repair efficiently.', NULL, 'SKILL', '9657daa44260bb346d8baaed5f865607', 1, 'en'),
('repairMachine', 'reparation appareil', 'Les propriétaires de ce badge ont montré une impressionnante faculté à diagnostiquer les anomalies électriques ou mécaniques des appareils défecteux. Ce qui les rend mieux à même de réparer efficacement. ', NULL, 'SKILL', '9657daa44260bb346d8baaed5f865607', 1, 'fr'),
('repairMoto', 'repair motorcycle', 'Holders of this badge has known to have an extensive experience and knowledge in the maintenance and repair of motorcycle.', NULL, 'SKILL', '9657daa44260bb346d8baaed5f865607', 1, 'en'),
('repairMoto', 'reparation moto', 'Les détenteurs de ce badge sont connus pour posséder une vaste expérience et connaisance dans l''entretien ou la réparation des motos. ', NULL, 'SKILL', '9657daa44260bb346d8baaed5f865607', 1, 'fr'),
('repassage', 'ironing', 'This badge holders are used to iron clothes and are known to do it carefully.', NULL, 'SKILL', 'd2ffb970ba1b3700f8ea9baa32bffd74', 1, 'en'),
('repassage', 'repassage', 'Les détenteurs de ce badge ont l''habitude de repasser à la main tout sorte de vétements et sont reconnus pour le faire soigneusement.', NULL, 'SKILL', 'd2ffb970ba1b3700f8ea9baa32bffd74', 1, 'fr'),
('serviable', 'helpful', 'Be helpful or help others are strong actions  that Yoomken defends and promotes in the network. If a person help another one, the recipient should expect to do the same thing if the opportunity arises.  The holders of this badge are responsive to people''s needs and give the effort they can do to help hoping that one day the recipient will do the same.<br/>\n"It should help each other, it''s the law of nature." Jean de la Fontaine.', NULL, 'PERS', '59aea376bb5a51fa034d8963e2ea815d', 1, 'en'),
('serviable', 'serviable', 'Etre serviable ou rendre service sont des actions fortes que Yoomken défend et encourage dans le réseau. Si une personne rend service à un autre, la personne benéficiaire doit s''attendre à faire de même si l''occasion se présente. Les détenteurs de ce badge sont réactives au besoins des gens et apportent l''effort qu''ils peuvent pour rendre service en espérant qu''un jour le bénéficiare agissent de même pour les autres. <br/>\n"Il se faut entraider, c''est la loi de nature.", Jean de la Fontaine.', NULL, 'PERS', '59aea376bb5a51fa034d8963e2ea815d', 1, 'fr'),
('solidaire', 'solidary', 'Solidarity is a high value that Yoomken defends and promotes in the network. People with this badge have generous attentions to support a cause or a person in need. <br/>\n"The great thing about democracy is solidarity." Victor Hugo.', NULL, 'PERS', '59aea376bb5a51fa034d8963e2ea815d', 1, 'en'),
('solidaire', 'solidaire', 'La solidarité est un lien social d''engagement qui unie les personnes. C''est une valeur forte que Yoomken porte et encourage dans le réseau. Les détenteurs de ce badge possédent des attentions généreuses afin de soutenir une cause ou une personne dans le besoin.<br/>\n"La grande chose de la démocratie, c''est la solidarité.", Victor Hugo.', NULL, 'PERS', '59aea376bb5a51fa034d8963e2ea815d', 1, 'fr'),
('teaching', 'teaching', 'People who received this badge have shown they can transform knowledge into reasonable units so that others can learn and enhance their skills.', NULL, 'SKILL', NULL, 0, 'en'),
('teaching', 'enseignement', 'Les personnes qui ont acquis ce badge ont montré qu''ils s''ont en mesure de transférer les connaissances en unités raisonnables, afin que d''autres puissent apprendre et améliorer leurs compétences.', NULL, 'SKILL', NULL, 0, 'fr'),
('travaillleur', 'hard-working', 'People who have received this badge hold a large professional conscience. They are this kinds of people who give 100% to do a good work.', NULL, 'PERS', '5f1c6a961dec28865c792b5b2514120c', 1, 'en'),
('travaillleur', 'travaillleur', 'Les personnes qui ont reçu ce badge détiennent une grande conscience professionelle. Ce genre de personnes sont prêt à donner leur tout pour que le résultat de leur travail soit utile ou bénéfique à d''autres.', NULL, 'PERS', '5f1c6a961dec28865c792b5b2514120c', 1, 'fr'),
('volantaire', 'volunteer', '', NULL, 'PERS', '5f1c6a961dec28865c792b5b2514120c', 0, 'en'),
('volantaire', 'volantaire', '', NULL, 'PERS', '5f1c6a961dec28865c792b5b2514120c', 0, 'fr'),
('Volontaire', 'Badge Volontaire ou Bénèvole', 'Ce badge pourrait être utile, car ça serait  intéressant de savoir qui sont les personnes qui sont potentiellement prêts à faire des services bénévoles.', NULL, 'WISH', NULL, -3, 'fr');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `pid_cmt` int(11) NOT NULL AUTO_INCREMENT,
  `id_cmt` varchar(32) NOT NULL,
  `id_usr_cmt` varchar(32) NOT NULL,
  `id_act_cmt` varchar(32) NOT NULL,
  `date_cmt` datetime NOT NULL,
  `text_cmt` text,
  `id_prt_cmt` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`pid_cmt`),
  UNIQUE KEY `id_cmt` (`id_cmt`),
  KEY `id_usr_cmt` (`id_usr_cmt`,`id_act_cmt`),
  KEY `id_act_cmt` (`id_act_cmt`),
  KEY `id_related_cmt` (`id_prt_cmt`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=86 ;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`pid_cmt`, `id_cmt`, `id_usr_cmt`, `id_act_cmt`, `date_cmt`, `text_cmt`, `id_prt_cmt`) VALUES
(1, '0166108fb67cab8534003f1732e7e406', '7d6653aaa16976e12b6cf7c774f83c1f', '41bacfe201c96a64d00980b29c2851ea', '2012-09-07 12:49:09', 'cvxcvcxvxcv', ''),
(2, '087b83231c319870eaf88e580834e7dc', '7d6653aaa16976e12b6cf7c774f83c1f', '150fc3c83e0bac071685d3d88ce93290', '2012-09-07 20:05:13', 'asdasdasd', ''),
(3, '0b6d76dabad76b63eed79143bb9d70d6', '7d6653aaa16976e12b6cf7c774f83c1f', '87fb4c00052559e2c34c470de0cb57b5', '2012-09-24 14:18:40', 'sdsds', ''),
(4, '0cd42a574a7951d21b4ccba4cd79d3f7', '7d6653aaa16976e12b6cf7c774f83c1f', '150fc3c83e0bac071685d3d88ce93290', '2012-09-07 20:20:03', 'asdasd', ''),
(5, '0ef1db2aa4db14d9d4d1debef8e8e179', 'a3cefde48284f70b2098d7015e987148', 'ee91b06daf243a32ade42abff1e289b1', '2012-09-18 12:59:54', 'fsdgdfdd', ''),
(6, '102a40c0b38e9e00ed4c8a2177529a6d', '7d6653aaa16976e12b6cf7c774f83c1f', '0b16dae85630f79ce2f42af1ad5eb78d', '2012-09-07 20:19:56', 'sadasdasd', ''),
(7, '10c4bbcc7e76ab14c6adbecab7d5bebf', '7d6653aaa16976e12b6cf7c774f83c1f', '3b00a641ff9af7aa3f38c27e04d908df', '2012-09-07 20:23:36', 'asdasdas', ''),
(8, '12e166c9529540cbc6e1adaa321afc6a', '7d6653aaa16976e12b6cf7c774f83c1f', '150fc3c83e0bac071685d3d88ce93290', '2012-09-07 20:22:21', 'dsfsdfsdf', ''),
(9, '16707cb96b51c6ccf920deb7927d6873', '7d6653aaa16976e12b6cf7c774f83c1f', '51ddcdb9417d444de3149d92a91665bd', '2012-09-07 20:06:38', 'sdaadas', ''),
(10, '229b9e6a479ca083484b0ff8569d3d01', '7d6653aaa16976e12b6cf7c774f83c1f', '3b00a641ff9af7aa3f38c27e04d908df', '2012-09-07 20:23:43', 'adsdssd', ''),
(11, '268926a3141232821f82b5a2768d9579', '7d6653aaa16976e12b6cf7c774f83c1f', '150fc3c83e0bac071685d3d88ce93290', '2012-09-07 20:21:47', 'dsfsdfs', ''),
(12, '272878c23469bffc05ffc76970f0ce9c', '7d6653aaa16976e12b6cf7c774f83c1f', '86139c87f6edc9169aa116a4173be3b5', '2012-09-22 19:27:42', 'sdsdsd', ''),
(13, '2c658f4ac5e69a4900efd008d9cbe58d', '7d6653aaa16976e12b6cf7c774f83c1f', '150fc3c83e0bac071685d3d88ce93290', '2012-09-07 20:20:10', 'asdasd', ''),
(14, '3271e9a1e902b2ca9dc09824abcf2eea', '7d6653aaa16976e12b6cf7c774f83c1f', '150fc3c83e0bac071685d3d88ce93290', '2012-09-07 20:20:07', 'asdasd', ''),
(15, '32f643319c067fba5187d69473e63d6b', '7d6653aaa16976e12b6cf7c774f83c1f', '150fc3c83e0bac071685d3d88ce93290', '2012-09-07 20:22:05', 'sdfsdfsdf', ''),
(16, '3a266a8e66d55d31f8566536a9c97a70', 'a3cefde48284f70b2098d7015e987148', 'b842a75c0218f60ff6d790f4a39ab7a5', '2012-09-16 12:07:28', 'dsnfsdfnsd', ''),
(17, '47fa918b298a5ccb4d8e8603c318b05b', '7d6653aaa16976e12b6cf7c774f83c1f', '87fb4c00052559e2c34c470de0cb57b5', '2012-09-24 14:07:55', 'dans osdkjd', ''),
(18, '48b0225fbb47206437e3044d07bb7d04', '7d6653aaa16976e12b6cf7c774f83c1f', '150fc3c83e0bac071685d3d88ce93290', '2012-09-07 20:21:52', 'dsfsdf', ''),
(19, '4c84e240b7b1046bc5ddaa5c32dedee1', '7d6653aaa16976e12b6cf7c774f83c1f', '41bacfe201c96a64d00980b29c2851ea', '2012-09-07 12:49:12', 'xcvxcv', ''),
(20, '4f7904bdc4e8f488cfe17e1dfe93884e', '7d6653aaa16976e12b6cf7c774f83c1f', '410e6e47fdfb99826ee07c5d617cfb1b', '2012-09-07 20:04:40', 'sadasdasd', ''),
(21, '51cdce60b5cabe175229087c56d7f9f4', '7d6653aaa16976e12b6cf7c774f83c1f', '41bacfe201c96a64d00980b29c2851ea', '2012-09-07 09:30:47', 'dsfdsfsd\nsdfsdf', ''),
(22, '59aae09814a536b30041a7db1984e490', '7d6653aaa16976e12b6cf7c774f83c1f', '87fb4c00052559e2c34c470de0cb57b5', '2012-09-24 14:18:12', 'sdsdsd', ''),
(23, '59c3826a86f647b2f97997dccf7f1176', '7d6653aaa16976e12b6cf7c774f83c1f', '150fc3c83e0bac071685d3d88ce93290', '2012-09-07 20:22:00', 'dsfsdfsdfdsf', ''),
(24, '59cb5f05cf7ab44616da8104066f3f2f', '7d6653aaa16976e12b6cf7c774f83c1f', '1ef53e492ed25d7a9b6b4527a33b12e2', '2012-09-07 09:11:58', 'sdasdas', ''),
(25, '5d48de5cbaac7b41bcd0a517d5d07434', '7d6653aaa16976e12b6cf7c774f83c1f', 'a3c696077291b95107b748882d8a6110', '2012-09-28 16:00:46', 'sdasdasd\n', ''),
(26, '66920c7d6dcc0a7ec6f213e5f54801ef', '7d6653aaa16976e12b6cf7c774f83c1f', '3b00a641ff9af7aa3f38c27e04d908df', '2012-09-07 20:23:00', 'sadasdasdasd', ''),
(27, '6c7d195b9e3fd96ad0c28cdbf85dc133', '7d6653aaa16976e12b6cf7c774f83c1f', 'ed54c93c2d6cc83b0f7f092c15a2291a', '2012-09-24 14:22:11', 'dsfsdfsd', ''),
(28, '6e73c5a79f039412701ad6fa8c6391c2', '7d6653aaa16976e12b6cf7c774f83c1f', 'ed54c93c2d6cc83b0f7f092c15a2291a', '2012-09-24 14:19:04', 'sdsdsd', ''),
(29, '7db14d8f75e0480544e68f50562f3724', '7d6653aaa16976e12b6cf7c774f83c1f', '3b00a641ff9af7aa3f38c27e04d908df', '2012-09-07 20:23:39', 'asdasdasd', ''),
(30, '7f76429f9e4ed6790f5c4bca40f2666f', '7d6653aaa16976e12b6cf7c774f83c1f', '41bacfe201c96a64d00980b29c2851ea', '2012-09-07 09:16:29', 'sdfsdfsdf', ''),
(31, '84369aa28c727bec3c831e9391a61ca8', 'a3cefde48284f70b2098d7015e987148', 'b842a75c0218f60ff6d790f4a39ab7a5', '2012-09-16 12:07:21', 'dfsdmfsdmn', ''),
(32, '845304453be56d60d462883f8b45693e', '7d6653aaa16976e12b6cf7c774f83c1f', '3b00a641ff9af7aa3f38c27e04d908df', '2012-09-07 20:23:09', 'asdasda', ''),
(33, '8bd999a7c314eecbd1b34445a8d761b8', '7d6653aaa16976e12b6cf7c774f83c1f', '150fc3c83e0bac071685d3d88ce93290', '2012-09-07 20:21:49', 'sdfsdfsd', ''),
(34, '90615cdf4be8559ddc4b8b31e5a13605', '7d6653aaa16976e12b6cf7c774f83c1f', '150fc3c83e0bac071685d3d88ce93290', '2012-09-07 20:21:54', 'sdfsdfsdf', ''),
(35, '91b5e28cd21e77c4a6e6cf540efe09fb', '7d6653aaa16976e12b6cf7c774f83c1f', '65b33c7e7111728fa77533f1f74e0b18', '2012-09-06 19:36:02', 'sdfdsfds', ''),
(36, '9b3d3f7e671e003d5174dd17f3dad1ff', '7d6653aaa16976e12b6cf7c774f83c1f', '41bacfe201c96a64d00980b29c2851ea', '2012-09-07 08:42:15', 'asdasdaadas\n', ''),
(37, '9fdb3eb699b164542bb9d11817004a32', '7d6653aaa16976e12b6cf7c774f83c1f', '87fb4c00052559e2c34c470de0cb57b5', '2012-09-24 14:21:30', 'sdsdsd', ''),
(38, 'a04ace3f57c64841fcfadecf4433e4a7', '7d6653aaa16976e12b6cf7c774f83c1f', '41bacfe201c96a64d00980b29c2851ea', '2012-09-07 09:36:40', 'dsfsdfsdf', ''),
(39, 'a1e2c2e92f53862065bf1c1041de8e8d', '7d6653aaa16976e12b6cf7c774f83c1f', '3b00a641ff9af7aa3f38c27e04d908df', '2012-09-07 20:23:04', 'sadasd', ''),
(40, 'a200a15d05c770275bac5264422e095f', '7d6653aaa16976e12b6cf7c774f83c1f', '41bacfe201c96a64d00980b29c2851ea', '2012-09-07 12:49:16', 'cxvxcv', ''),
(41, 'a9b33c67be3f12a9cbcc7c0b92a70c19', '7d6653aaa16976e12b6cf7c774f83c1f', '410e6e47fdfb99826ee07c5d617cfb1b', '2012-09-07 20:03:52', 'bonjour la compagnie', ''),
(42, 'ad4e4f0b7ffb9fcb0af9827aadcf91c1', '7d6653aaa16976e12b6cf7c774f83c1f', '3b00a641ff9af7aa3f38c27e04d908df', '2012-09-07 21:07:13', 'LEAVE_CMT...', ''),
(43, 'b53d844d6383406de22d49412b6bcd5e', '7d6653aaa16976e12b6cf7c774f83c1f', '12d26cc674652e848a7019d569e80c4b', '2012-09-28 08:35:50', 'xcxcxc', ''),
(44, 'bcd97f97f7b6a980f42faa24f2b26b73', '79b1b9dc1b338006650c78d3b4919b04', '5a55be7fc390e2b1e389f64b057b705f', '2012-11-15 00:20:22', 'ah si je le vois', ''),
(45, 'bceaf7cb7180a35690933de6891e9697', '7d6653aaa16976e12b6cf7c774f83c1f', '150fc3c83e0bac071685d3d88ce93290', '2012-09-07 20:20:13', 'asdasda', ''),
(46, 'c07062c7eaee4f45eff4449eeb1395b8', '7d6653aaa16976e12b6cf7c774f83c1f', '410e6e47fdfb99826ee07c5d617cfb1b', '2012-09-07 20:04:47', 'asdasdasd', ''),
(47, 'cdf3f41e905ffe3433f568338a6f56ee', '7d6653aaa16976e12b6cf7c774f83c1f', '41bacfe201c96a64d00980b29c2851ea', '2012-09-07 09:39:50', 'dslfksldkf sd fsdfsd', ''),
(48, 'd1bfc8f136a263bfad40602343941cfd', '7d6653aaa16976e12b6cf7c774f83c1f', '41bacfe201c96a64d00980b29c2851ea', '2012-09-07 09:19:16', 'fgdfgdfg', ''),
(49, 'd579874a04581604285bba1973a68500', '7d6653aaa16976e12b6cf7c774f83c1f', '3b00a641ff9af7aa3f38c27e04d908df', '2012-09-07 20:08:32', 'asdasdasd', ''),
(50, 'd726cde93312f215785ccbd22a624694', '7d6653aaa16976e12b6cf7c774f83c1f', '3b00a641ff9af7aa3f38c27e04d908df', '2012-09-07 21:10:04', 'LEAVE_CMT...', ''),
(51, 'dc8daf9ebef550d8f254cea6db606a57', '79b1b9dc1b338006650c78d3b4919b04', '5a55be7fc390e2b1e389f64b057b705f', '2012-11-15 00:20:00', 'pourquoi je vois le commentaire.', ''),
(52, 'e0d424a5c713448edbcd0f8e6be24263', '79b1b9dc1b338006650c78d3b4919b04', 'cdee1f8f6d42295a8f9b25c08c6b6d8b', '2012-11-15 23:25:24', 'c''est trop cher je trouve, je cherche moins cher', ''),
(53, 'e0dca15a93b6b2fc707d27b0705b2245', '7d6653aaa16976e12b6cf7c774f83c1f', '1ef53e492ed25d7a9b6b4527a33b12e2', '2012-09-07 09:17:42', 'sddfsfsdfsd sdf', ''),
(54, 'e5f2e9fb93d26c10851dc4fedf8a4188', '7d6653aaa16976e12b6cf7c774f83c1f', '86139c87f6edc9169aa116a4173be3b5', '2012-09-22 19:24:54', 'sdsdsd', ''),
(55, 'ea70a20c63a1f480dc8e57a365cd9aa5', '7d6653aaa16976e12b6cf7c774f83c1f', '410e6e47fdfb99826ee07c5d617cfb1b', '2012-09-07 20:04:34', 'sadasdas', ''),
(56, 'eb2c6b38d4370ee39ea1917339e07123', '7d6653aaa16976e12b6cf7c774f83c1f', '150fc3c83e0bac071685d3d88ce93290', '2012-09-07 20:20:16', 'asdasd', ''),
(57, 'eb9a4b994f435d344d13e2d2d0beb9fb', '7d6653aaa16976e12b6cf7c774f83c1f', '3b00a641ff9af7aa3f38c27e04d908df', '2012-09-07 20:08:57', 'asdasdasd', ''),
(58, 'ef5cd174d11cf29c805f5614823735e9', '7d6653aaa16976e12b6cf7c774f83c1f', '86139c87f6edc9169aa116a4173be3b5', '2012-09-22 19:25:06', 'sdsdsd', ''),
(59, 'f21046f7ab4911bd776795ea83eff056', '79b1b9dc1b338006650c78d3b4919b04', '5a55be7fc390e2b1e389f64b057b705f', '2012-11-15 00:19:17', 'pas mal', ''),
(60, 'f96636189e4702f06a6e5aa18ee36000', '7d6653aaa16976e12b6cf7c774f83c1f', '87fb4c00052559e2c34c470de0cb57b5', '2012-09-24 14:16:05', 'dfsdfsdfsd', ''),
(61, 'fd743195136d62e902a157b2b2cd0e1b', '7d6653aaa16976e12b6cf7c774f83c1f', '65b33c7e7111728fa77533f1f74e0b18', '2012-09-06 19:33:35', 'sdfdsfds', ''),
(62, 'fed485952191d1b663fdb6b270d63c48', '7d6653aaa16976e12b6cf7c774f83c1f', '3b00a641ff9af7aa3f38c27e04d908df', '2012-09-07 20:12:04', 'asdasdassadasdd', ''),
(63, 'ff1e62a186467d0ba091195d2f751a88', '7d6653aaa16976e12b6cf7c774f83c1f', '82f86c3ac00dba7f1982bbfd72374b0b', '2012-09-24 14:17:59', 'sdsd', ''),
(64, 'ff45864d685cc0e17f097dc8dd53aa6d', '7d6653aaa16976e12b6cf7c774f83c1f', '150fc3c83e0bac071685d3d88ce93290', '2012-09-07 20:21:57', 'sdfsdfsdf', ''),
(71, '834ad036127efbe963be04d562783ef8', 'a3cefde48284f70b2098d7015e987148', 'fae8c41b9f97670fad332eb081733396', '2013-04-28 09:44:02', '@[Ahmad Gabriel Al Kotob](contact:Ahmadgabrielalkotob) est pour moi un trés bon electricien. il se trouve à coté de chez toi à bures. A+', ''),
(72, '774c379b94e5a726b8adef78c1782785', '5a6097a8f128c86769da4e977927a78d', 'fae8c41b9f97670fad332eb081733396', '2013-04-28 09:47:48', 'merci bcp shingo', ''),
(79, '7537b8ba16b32c19f4a8101c452b6757', '6b2e63b1fd55069fb7cb35fb60f61ed7', 'f8331425f3a89d15c6b5d298b112ceaa', '2013-05-31 06:15:10', '- Appliquer d''abord un enduit de lissage.\n- Peindre les finitions avec l''aide d''un ruban adhésif.\n- Peindre une 1er couche.\n- Enfin, peindre une 2nd couche. Bon courage !', ''),
(83, '9e02c5700a0ead183ee94ae640820f26', '178cd2f3df2d88613b46bb6e96a77f3a', 'f8331425f3a89d15c6b5d298b112ceaa', '2013-05-31 08:33:07', 'Tu peux voir ça avec @[Kim](contact:Kim) , c''est un bon peintre en indépendant prés de chez toi.', ''),
(84, 'e075d5dfd1b322dc1263bd7c37d64b62', 'a530b55030587b46519449c39181d1b8', 'serviable', '2013-05-31 09:18:10', 'merci pour ton aide', ''),
(85, '18473b0f99d2cb2af7432cf77752ca9f', 'a530b55030587b46519449c39181d1b8', 'peindre', '2013-05-31 09:19:29', 'et merci d''avoir partagé tes connaissances.', '');

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id_act_cnt` varchar(32) NOT NULL,
  `privacy_cnt` enum('P','G','R') NOT NULL DEFAULT 'P',
  `id_spt_cnt` varchar(32) NOT NULL,
  `media_cnt` text,
  `title_cnt` varchar(250) DEFAULT NULL,
  `views_cnt` int(3) unsigned NOT NULL DEFAULT '0',
  `featured_cnt` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `desc_cnt` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `shortdesc_cnt` varchar(250) DEFAULT NULL,
  `thumbnail_cnt` varchar(250) DEFAULT NULL,
  `id_prv_cnt` tinyint(4) unsigned NOT NULL,
  `paie_cnt` int(11) DEFAULT '0',
  `currency_cnt` varchar(3) DEFAULT 'EUR',
  `holder_usr_cnt` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_act_cnt`),
  KEY `privacy` (`privacy_cnt`),
  KEY `title` (`title_cnt`),
  KEY `views` (`views_cnt`),
  KEY `featured` (`featured_cnt`),
  KEY `id_spt_cnt` (`id_spt_cnt`),
  KEY `id_prv_cnt` (`id_prv_cnt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id_act_cnt`, `privacy_cnt`, `id_spt_cnt`, `media_cnt`, `title_cnt`, `views_cnt`, `featured_cnt`, `desc_cnt`, `shortdesc_cnt`, `thumbnail_cnt`, `id_prv_cnt`, `paie_cnt`, `currency_cnt`, `holder_usr_cnt`) VALUES
('0062840d92bf0ed8ea7bef08c272026a', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 1, 0, 'Sentez-vous libre de partager vos découvertes ou vos conseils.', '', '', 1, 0, 'EUR', NULL),
('014102de290dab378622ca5ea0e6a93a', 'P', 'f01d198551e75d0985e58c465b739e57', '', '', 2, 0, 'sdasdsad', 'sdasdsad', '077518ed143cc1701ba7711dd335dad8,a794bdf5e26ad24ab1e00250d589a218,ff9d07ed823d8d590fe6ec4b219a7ee8,ad7ed14762d24f9b278a315923083334,4fa62ddd46c3ebf539bd736766be8ef9,f330fbec5ad2ddb42b8c54a5a38f31a7,2f1e913fd4bc4c405d58065af1162d5e', 1, 0, 'CHF', NULL),
('02cd58bcad67f92e5e97c791b8a66183', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'yxcyxcyxcyx', '', '', 1, 0, 'EUR', NULL),
('06faa1dd5921a3dce73d188930cf4d3e', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', NULL, NULL, 0, 0, 'sdasdasd', NULL, NULL, 1, 0, 'EUR', NULL),
('0879796946d5c9a10fe87a7ffe0838e0', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 1, 0, 'werjhwer werhwer', 'werjhwer werhwer', '', 1, 0, 'CHF', NULL),
('08af8b816012362b4d17b6ab1f0c8600', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 1, 0, 'hello bures', 'hello bures', '', 1, 0, '€', NULL),
('08d6efb10305f2090292dab279eecf2b', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 2, 0, 'Connaissez vous le prix moyen d''une prestation de création de site web?', 'Connaissez vous le prix moyen d''une prestation de création de site web?', '', 1, 0, 'EUR', NULL),
('0a784991ffc08508af507d88ededb7ba', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'dfsfsdfsdf', '', '', 1, 0, 'EUR', NULL),
('0a9968edd204f786369430eed467e366', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 2, 0, 'dsfdsf', '', '', 1, 0, 'EUR', NULL),
('0b16dae85630f79ce2f42af1ad5eb78d', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 8, 0, 'asdasd', '', '', 1, 0, 'EUR', NULL),
('0b4a7a6e5047dc258a65b3a902a916ce', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'selim pousse', '', '', 1, 0, 'EUR', NULL),
('0ceead01e302b49382ce22688eb022a1', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 2, 0, 'dsfdsff', 'dsfdsff', '', 1, 0, 'EUR', NULL),
('108d2b150afda6383d757e3fc4aaaa7d', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'Sentez-vous libre de partager vos découvertes ou vos conseils.', '', '', 1, 0, 'EUR', NULL),
('108d62e143999fdc8437c5b9ebc80a5f', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', NULL, NULL, 0, 0, 'sasadsadas', NULL, NULL, 1, 0, 'EUR', NULL),
('122fb97faeb84543f12396afaeaa6dde', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'dsdasdasd\nsadasdas', '', '', 1, 0, 'EUR', NULL),
('12d26cc674652e848a7019d569e80c4b', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 54, 0, 'dsfsdfsd', '', '', 1, 0, 'EUR', NULL),
('12e0449213c3a96b3a815851e29dd321', 'P', 'd41d8cd98f00b204e9800998ecf8427e', '', '', 0, 0, 'Asdasdsad', '', '', 1, 0, 'EUR', NULL),
('14bf1e87241e4cb584ba5ba44739262e', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'sdsadsad', '', '', 1, 0, 'EUR', NULL),
('150fc3c83e0bac071685d3d88ce93290', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 18, 0, 'sdasdasdas', '', '', 1, 0, 'EUR', NULL),
('199b798e0ccfa9fe5657e7808e6d38e5', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', NULL, NULL, 0, 0, 'bonjour la campagnie!', NULL, NULL, 1, 0, 'EUR', NULL),
('1ba3e1a42c5a30ae58c3ca5bb1a72cf8', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'Sentez-vous libre de partager vos découvertes ou vos conseils.', '', '', 1, 0, 'EUR', NULL),
('1ef53e492ed25d7a9b6b4527a33b12e2', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 8, 0, 'sadsada', '', '', 1, 0, 'EUR', NULL),
('235013987bee37c027e768a763acd918', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'sadasd', '', '', 1, 0, 'EUR', NULL),
('25e6bb5942c8d358ad6c3ab7825df8f1', 'P', 'f69e83f278f07765a4bebae3bcebd4ac', '', '', 0, 0, 'Sadasd', '', '', 1, 0, 'EUR', NULL),
('261d85ca981a22cf32f0d5fee9d4b5d5', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 3, 0, 'dfkldsfksdfsd\ns', '', '', 1, 0, 'EUR', NULL),
('282d612f7177620700b84bc72a0cdc7f', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'Sentez-vous libre de partager vos découvertes ou vos conseils.', '', '', 1, 0, 'EUR', NULL),
('28f342f0be3efffb4be3d59d0f17119b', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 1, 0, 'j''aime les autres quand il m''aide', 'j''aime les autres quand il m''aide', '', 1, 0, 'EUR', NULL),
('298a4cd3cb1a22cfdc5f01f55c87156f', 'P', 'f01d198551e75d0985e58c465b739e57', '', '', 1, 0, 'asdasd', 'asdasd', 'aa3a78637fe4ac6aca9324951a71018c,a04c4ca9dfe3ac2bef69af8f851c74ae,d39b25b0fb5a27504ffc93ba013d26f0,3d52dcd090271f17cb0317a7491028a9,56cda029f398373bdfa7be6cbb7dfca6', 1, 0, 'CHF', NULL),
('29f8584de520ea410c54b2c23f5b9e58', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'dsfsfsdfsdffd', '', '', 1, 0, 'EUR', NULL),
('2a8a4b7375d92aac520c7ce261a4af3c', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'sdasdasd', '', '', 1, 0, 'EUR', NULL),
('2cc61d59b2910c94bc661ea156d91666', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'asdsadas', '', '', 1, 0, 'EUR', NULL),
('2d2fb0e52d594cb9fff19ec9397eed8b', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'dsfsdfsdfsdf', '', '', 1, 0, 'EUR', NULL),
('2e587fbfa205144a39b0f9adac692215', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'Sentez-vous libre de partager vos découvertes ou vos conseils.', '', '', 1, 0, 'EUR', NULL),
('2fa96e78a747b898b90562bb3387e8da', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'bonjour sélim tu vas bien', '', '', 1, 0, 'EUR', NULL),
('31c121e061edabb6609ab85abaa1c522', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 1, 0, 'j''aurai besoin de trouver un électricien. Pourriez vous me conseiller? merci.', 'j''aurai besoin de trouver un électricien. Pourriez vous me conseiller? merci.', '', 1, 0, 'CHF', NULL),
('34daf30f74017772c8b68a12e7b70810', 'P', 'f69e83f278f07765a4bebae3bcebd4ac', '', '', 0, 0, 'Dfsfs', '', '', 1, 0, 'EUR', NULL),
('36a003c982af3dff6a92228d85b22b43', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', NULL, NULL, 0, 0, 'sddsfdsf bdsfdshfj\ndsfdsf', NULL, NULL, 1, 0, 'EUR', NULL),
('36bcb8ecd44d63906472e5a48bb4edca', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'ewrwerwrwr', '', '', 1, 0, 'EUR', NULL),
('36c8d1e78ee6650b34f87b87938b0763', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'sadsadsad', '', '', 1, 0, 'EUR', NULL),
('3813c4482063ca4827b5d3650d26c7a9', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'dfdsfsdf', '', '', 1, 0, 'EUR', NULL),
('3b00a641ff9af7aa3f38c27e04d908df', 'P', 'e2203d735b01fce50df9b55c8c7ce7d8', '', '', 27, 0, 'Sdasdasd', '', '', 1, 0, 'EUR', NULL),
('3cae80d32f315dc294cf49c358d809e2', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', 'sadsad', 0, 0, 'sadsad', '', '', 1, 0, 'EUR', NULL),
('3d4901382a054db417162e9dbf59660c', 'P', '9a17d384d40280c631820243ca7a0266', '', 'Cvcvbcb', 0, 0, 'sdsada  asdsadsfdsfds\n\n\n\nasdsadsad\nsadas\nsadsad\nsadasd\nsadsda\nasdasdas\nasdasdsajdjsadjhsad\nasdasjdhsajdhsa\nasdasdsads\nsadasdasdasdssssssssss\nsd\nsdadasdsadsjkdjaskdjasjd\nasdjaskdjaskjdasd\nsadjaksjdkjkjssssssssssssssssss\n', '', '', 1, 0, 'EUR', NULL),
('3d849300bcda33ea9d5b47936d606ceb', 'P', '103211ea2c12ba25e4c195a0b7eb687b', '', '', 0, 0, 'Dsfdsfsdfsdfsdfsd', '', '', 1, 0, 'EUR', NULL),
('3e3955492ae6078c35f60f703e0272a8', 'P', 'f148706390f82e8c19a659a2a2be2bf2', '', '', 1, 0, 'Vous ne vous sentez pas à l’aise avec l’idée de travailler pour un seul employeur ? Vous souhaitez concilier vies familiale et professionnelle ? Les alternatives au CDI n’intéressent pas que les seniors et peuvent constituer un véritable tremplin à la création d’activité. Travailler à temps partagé pour employeurs peut vous séduire. L’avantage est double : vous offrez vos compétences à plusieurs personnes, tout en abordant des problématiques variées, en présence de nombreux interlocuteurs.\n(www.mairie12.paris.fr)', 'Vous ne vous sentez pas à l’aise avec l’idée de travailler pour un seul employeur ? Vous souhaitez concilier vies familiale et professionnelle ? Les alternatives au CDI n’intéressent pas que les seniors et peuvent constituer un véritable tremplin à l', '', 1, 0, '€', NULL),
('410e6e47fdfb99826ee07c5d617cfb1b', 'P', 'e2203d735b01fce50df9b55c8c7ce7d8', '', '', 7, 0, 'bonjour la compagnie', '', '', 1, 0, 'EUR', NULL),
('41bacfe201c96a64d00980b29c2851ea', 'P', 'e2203d735b01fce50df9b55c8c7ce7d8', '', '', 32, 0, 'Bonjour tout le monde', '', '', 1, 0, 'EUR', NULL),
('42c31681ef3884e117da942c5ed7b914', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 1, 0, 'sdsdsd', 'sdsdsd', '', 1, 0, 'EUR', NULL),
('4532bc07ef5cd6772f5f6dee07a28949', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 1, 0, 'asdasdasd', '', '', 1, 0, 'EUR', NULL),
('4565aa8b30a8dadbac644aa732969f7f', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'asdasd', '', '', 1, 0, 'EUR', NULL),
('45a1ffa953ca1388d81dcc22305d94b6', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'sdfdsfsdfs', '', '', 1, 0, 'EUR', NULL),
('47a119717148a7bb3eef99fb85252c42', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'Sentez-vous libre de partager vos découvertes ou vos conseils.', '', '', 1, 0, 'EUR', NULL),
('47dc2298472a9f94ce71d95ed3730caa', 'P', 'e2203d735b01fce50df9b55c8c7ce7d8', '', '', 1, 0, 'Asdasdasdas', '', '', 1, 0, 'EUR', NULL),
('4a806b173031b19653ea725b1d99aea1', 'P', 'f69e83f278f07765a4bebae3bcebd4ac', '', '', 0, 0, 'dsfsdfsdfsdsa\nsdasd\nsadasdas', '', '', 1, 0, 'EUR', NULL),
('4b7e5f8a741d046c996aedd14ac259da', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'sdasdasd', '', '', 1, 0, 'EUR', NULL),
('4cc6412835cd25a5d18214ba8456df50', 'P', 'c14405a94c63499d02662e798f910c23', '', '', 1, 0, 'cxyyxcyxc', 'cxyyxcyxc', '', 1, 0, '€', NULL),
('4f4d58bb860b3cbb4fe2a36ca8724ee1', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'sdfsdfsdf', '', '', 1, 0, 'EUR', NULL),
('51ddcdb9417d444de3149d92a91665bd', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 5, 0, 'sadsadasdas', '', '', 1, 0, 'EUR', NULL),
('547941e8563217966f0e80036c021e12', 'P', 'f01d198551e75d0985e58c465b739e57', '', '', 1, 0, 'Vous ne vous sentez pas à l’aise avec l’idée de travailler pour un seul employeur ? Vous souhaitez concilier vies familiale et professionnelle ? Les alternatives au CDI n’intéressent pas que les seniors et peuvent constituer un véritable tremplin à la création d’activité. Travailler à temps partagé pour employeurs peut vous séduire. L’avantage est double : vous offrez vos compétences à plusieurs personnes, tout en abordant des problématiques variées, en présence de nombreux interlocuteurs.\n(www.mairie12.paris.fr)', 'Vous ne vous sentez pas à l’aise avec l’idée de travailler pour un seul employeur ? Vous souhaitez concilier vies familiale et professionnelle ? Les alternatives au CDI n’intéressent pas que les seniors et peuvent constituer un véritable tremplin à l', '', 1, 0, 'CHF', NULL),
('576e33426024e422591cc65e5d701a2f', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 1, 0, 'j''aime les autres quand il m''aide', 'j''aime les autres quand il m''aide', '', 1, 0, 'EUR', NULL),
('577e2644405566381b5b301a94bd3fa7', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 1, 0, 'j''ecris un message sur ton mur', 'j''ecris un message sur ton mur', '', 1, 0, 'EUR', NULL),
('58fc1a9ceaf04e54d62f881a99a86caa', 'P', 'f69e83f278f07765a4bebae3bcebd4ac', '', '', 0, 0, 'dsfsdfsdf dddddddddddddddddddddddddddddddddddddddddddddddd erewr  ewrewurze ewrewzur ewre rewur\nddddddddddfsddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd\ndfdsfsdfdfdf dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd\ndfsdf\nfdfsdfsfsdfdsfdsfsdfsdf sdfsdfsdfsdf sdfsdfs\ndfdsfdsf\ndsfsdfdf', '', '', 1, 0, 'EUR', NULL),
('592649fc727aa11dbd2651ec290f5971', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', NULL, NULL, 0, 0, 'asdsdas www.yoomken.com dsfsdfds \nflsakdasd\nsaddsadasd', NULL, NULL, 1, 0, 'EUR', NULL),
('5a55be7fc390e2b1e389f64b057b705f', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 11, 0, 'J''ai rien a dire...', 'J''ai rien a dire...', '', 1, 0, 'EUR', NULL),
('5c4b477655a7fb7b662ee2f7d8d26d80', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'sdasdasd', '', '', 1, 0, 'EUR', NULL),
('5eb6dd0eed8c9057298b7feda95fb67d', 'P', '230c06bb802da8b08228f757b74f8dbb', '', '', 1, 0, 'Bonjour, quelles sont les étapes importantes à suivre pour repeindre un mur ?\nSinon une suggestion sur une personne habile dans ce domaine, merci d''avance.', 'Bonjour, quelles sont les étapes importantes à suivre pour repeindre un mur ?\nSinon une suggestion sur une personne habile dans ce domaine, merci d''avance.', '', 1, 0, '€', NULL),
('635dddb049aa5b2d10643a50a0ab2199', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 13, 0, 'je cherche un électricien dans le coin. Pourriez vous me conseiller ? merci. @selimpousse', 'je cherche un électricien dans le coin. Pourriez vous me conseiller ? merci. @selimpousse', '', 1, 0, 'CHF', NULL),
('65b33c7e7111728fa77533f1f74e0b18', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 128, 0, 'dfsfdsf dsfdsf sdf', '', '', 1, 0, 'EUR', NULL),
('65df8ab94556876b40e4ace399340b3f', 'P', 'f01d198551e75d0985e58c465b739e57', '', '', 1, 0, 'yxcyxc', 'yxcyxc', '39a39604d2628dec4ef3f0dbcdce6c20,6feb1983d7a954235e1966ccd3a080c0', 1, 0, 'CHF', NULL),
('699293b87e63ffa7393728157406a514', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'sdasdasda', '', '', 1, 0, 'EUR', NULL),
('6999f337f97688a18dc2459ddb2526c2', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 1, 0, 'post à creteil', 'post à creteil', '', 1, 0, '€', NULL),
('6ac4c9b84551fd3ea272f529a2996cb5', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'Sentez-vous libre de partager vos découvertes ou vos conseils.', '', '', 1, 0, 'EUR', NULL),
('6d5808332cea03c4ce075b42ac9962af', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', NULL, NULL, 0, 0, 'sasadsadas', NULL, NULL, 1, 0, 'EUR', NULL),
('6d6d4363bfd045f5ddedcdc26f7160c1', 'P', 'f69e83f278f07765a4bebae3bcebd4ac', '', '', 0, 0, 'Sdasdasd', '', '', 1, 0, 'EUR', NULL),
('6ff22a7071946bc7a6038d06a06d766b', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'sdasdasd', '', '', 1, 0, 'EUR', NULL),
('7075995a8a4816a84d17101820889e95', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 3, 0, 'sdsadasdas', 'sdsadasdas', '', 1, 0, 'EUR', NULL),
('70765d51ac3b8b0b4cd637d52ae0815c', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'Sentez-vous libre de partager vos découvertes ou vos conseils.', '', '', 1, 0, 'EUR', NULL),
('70dfa87dcb9b57f6dd3ffe03b3b0592c', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 1, 0, 'et celui ci', 'et celui ci', '', 1, 0, '€', NULL),
('731db8801e59ead6bfcc1d1e358c983b', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'Sentez-vous libre de partager vos découvertes ou vos conseils.', '', '', 1, 0, 'EUR', NULL),
('7360e0eb849ea6ef8d6ed7761d9690da', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 3, 0, 'je partage sur www.twiter.com', '', '', 1, 0, 'EUR', NULL),
('73b3f98b63d9a5be9639cf342bdf8a1b', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 1, 0, 'j''aime les autres quand il m''aide', 'j''aime les autres quand il m''aide', '', 1, 0, 'EUR', NULL),
('741c8f95211d90455f897fb7e71f27c9', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', 'dsfsdfsdf', 0, 0, 'dsfsdfjds \ndsfsdfhsdjfjdshf', '', '', 1, 0, 'EUR', NULL),
('749b033ecbb568fd068f6097f1e3da38', 'P', 'df8341cdaf8419ff6ef4779cc970d24b', '', 'Support informatique', 0, 0, 'Je fournis de l''aide pour l''installation de votre PC, ou aide en tout genre contre rémunération.', '', '', 1, 0, 'EUR', NULL),
('76b452eb64426b3eec66396852e8dfcb', 'P', 'e2203d735b01fce50df9b55c8c7ce7d8', '', '', 2, 0, 'Sadasdasd', '', '', 1, 0, 'EUR', NULL),
('79533508cfa42e528f831add9d581307', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 2, 0, 'a', '', '', 1, 0, 'EUR', NULL),
('79953a2d74c73d5905920742e3d16b5d', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 1, 0, 'je l''aimme', 'je l''aimme', '', 1, 0, 'EUR', NULL),
('7c01831a748ceb50c23488f475e870a0', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 1, 0, 'j''aime les autres quand il m''aide', 'j''aime les autres quand il m''aide', '', 1, 0, 'EUR', NULL),
('7c8a3884b86bf4bffb9982c68d2d850b', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'Sentez-vous libre de partager vos découvertes ou vos conseils.', '', '', 1, 0, 'EUR', NULL),
('82f86c3ac00dba7f1982bbfd72374b0b', 'P', 'e2203d735b01fce50df9b55c8c7ce7d8', '', '', 40, 0, 'wewqe§', 'wewqe§', '', 1, 0, 'EUR', NULL),
('84ce184e036d6eca9523d3276200c652', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 1, 0, 'j''aime les autres quand il m''aide', 'j''aime les autres quand il m''aide', '', 1, 0, 'EUR', NULL),
('84d5aa1d2b51dfd137856600e84bc5fc', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'article intéressant sur les baby-sitter http.//blabla.com', '', '', 1, 0, 'EUR', NULL),
('86139c87f6edc9169aa116a4173be3b5', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', NULL, NULL, 112, 0, 'sdsadasd', NULL, NULL, 1, 0, 'EUR', NULL),
('87fb4c00052559e2c34c470de0cb57b5', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 28, 0, 'dsfdsfsd', 'dsfdsfsd', '6b46a83fe2d29f886dbbc265d7039504', 1, 0, 'EUR', NULL),
('8b3b88fb231fbb683d09f847959c3113', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'Sentez-vous libre de partager vos découvertes ou vos conseils.', '', '', 1, 0, 'EUR', NULL),
('8e7de896a4875d92ea281dcf020b2a08', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'Sentez-vous libre de partager vos découvertes ou vos conseils.', '', '', 1, 0, 'EUR', NULL),
('9410fa7bc05bf4088885b8f6c65cfc3c', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'sadsadsad', '', '', 1, 0, 'EUR', NULL),
('94d35de36eb30fe11103970d39bcf890', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', NULL, NULL, 0, 0, 'yoomken.com', NULL, NULL, 1, 0, 'EUR', NULL),
('95cbf505f9cb52ef254cd064e964af26', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 5, 0, 'test toto', '', '', 1, 0, 'EUR', NULL),
('9774cbcf468f87a49a9a513d325a3a67', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'fdssdfd', '', '', 1, 0, 'EUR', NULL),
('98fe9524d671d1883b7475333b369f24', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 2, 0, 'dfjsdfjsdjf', 'dfjsdfjsdjf', '', 1, 0, 'EUR', NULL),
('996e746d6b02d99b33830933f3fedb47', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 1, 0, 'Bonjour, je voudrais rénover le vieux parquet dans notre salon. Pouvez-vous me donner quelques conseils?', 'Bonjour, je voudrais rénover le vieux parquet dans notre salon. Pouvez-vous me donner quelques conseils?', '', 1, 0, '€', NULL),
('9a2257b227bbfa697c1b76450b0d6651', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 2, 0, 'Un autre avis', 'Un autre avis', '', 1, 0, 'EUR', NULL),
('9c2b5bc46160a011d4a7188f815b3679', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', NULL, NULL, 0, 0, 'sasadsadas', NULL, NULL, 1, 0, 'EUR', NULL),
('9dfff3c3c3ace111e92c621b1ec93d49', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'sadasda', '', '', 1, 0, 'EUR', NULL),
('a247c85cc118b5f9196f52e614cf96e7', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', NULL, NULL, 0, 0, 'sasadsadas ddsfsdf dsjfsdf sdfdsfjsd.', NULL, NULL, 1, 0, 'EUR', NULL),
('a3c696077291b95107b748882d8a6110', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 9, 0, 'sadasdasdasda', 'sadasdasdasda', '', 1, 0, 'EUR', NULL),
('a3d1c5be22f2572d3695e7b0da54cc31', 'P', 'f5f6de19cb14519cc29ecb2695feb61e', '', 'Analyste Financier, Developpeur', 0, 0, 'Cherche un travail a temps partiel pour compléter mes revenus. Travaille a domicile pour tous projets informatique dans le domaine de la finance.', '', '', 1, 0, 'EUR', NULL),
('a4152e5367608792af773fc914fa03cd', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 1, 0, 'content', 'content', '', 1, 0, '€', NULL),
('a6bac1321a145452b4307de3c2368b72', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'Sentez-vous libre de partager vos découvertes ou vos conseils.', '', '', 1, 0, 'EUR', NULL),
('a96e20f15215b749f234b3a9df4c294e', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'Sentez-vous libre de partager vos découvertes ou vos conseils.', '', '', 1, 0, 'EUR', NULL),
('a99d439a15b39dd83a52b736fc56f996', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'sdsdasd\nasdasd\nasdasda\n', '', '', 1, 0, 'EUR', NULL),
('a9c9bc045740689cd767bce586390760', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'ssdfsd dsfsdfsdfsdf', '', '', 1, 0, 'EUR', NULL),
('aae2bc84618a7e0f4f0baab083165f51', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', NULL, NULL, 0, 0, 'sadasd', NULL, NULL, 1, 0, 'EUR', NULL),
('aaf8114c305e4a0e2a8d472ba0f7c37c', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'sadsadsada', '', '', 1, 0, 'EUR', NULL),
('ab2c7513099b5e3beeb11110bc09c280', 'P', 'e2203d735b01fce50df9b55c8c7ce7d8', '', '', 5, 0, 'sadasdasdsad', 'sadasdasdsad', '', 1, 0, 'EUR', NULL),
('ace31e8ecb9eae3be9e7d532239fbf41', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'asdsdsd', '', '', 1, 0, 'EUR', NULL),
('ae76a742510bffcff18592b202253e8a', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'Sentez-vous libre de partager vos découvertes ou vos conseils.', '', '', 1, 0, 'EUR', NULL),
('b6846a2f9d4c705a50dd076ca2e2bf38', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', NULL, NULL, 0, 0, 'sadsad asdasjhd sahdajd jas asdjasjdas sajdhas djas jhd asj asdhjas asdhasjd jh\nsadasd\nasdasd', NULL, NULL, 1, 0, 'EUR', NULL),
('b69a197948783827a5d1a28b51dedc47', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', NULL, NULL, 0, 0, 'Yomken.com\nddsfsdfdsf', NULL, NULL, 1, 0, 'EUR', NULL),
('b842a75c0218f60ff6d790f4a39ab7a5', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', NULL, NULL, 4, 0, 'dsfsdsdfhdsf', NULL, NULL, 1, 0, 'EUR', NULL),
('b8dd2a347b9f9320f9a96867bcc2f963', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', NULL, NULL, 0, 0, 'sasadsadas', NULL, NULL, 1, 0, 'EUR', NULL),
('bb2fb11061bc324615aa08db310c57f6', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'dsfsfsdfds', '', '', 1, 0, 'EUR', NULL),
('be60305eceae2de80526764a42f1b38c', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'Sentez-vous libre de partager vos découvertes ou vos conseils.', '', '', 1, 0, 'EUR', NULL),
('bed7c2d64a2fe7f90610497e041e13f2', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'Sentez-vous libre de partager vos découvertes ou vos conseils.', '', '', 1, 0, 'EUR', NULL),
('c28acfdddd21cac99d9b4d9731e1179c', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'sadasdsa', '', '', 1, 0, 'EUR', NULL),
('c2d1a8a38eba3f2240143f8e410d0079', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'Sentez-vous libre de partager vos découvertes ou vos conseils.', '', '', 1, 0, 'EUR', NULL),
('c6d93ac36b1fa98b404d085322ba82c9', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'sadasdasd', '', '', 1, 0, 'EUR', NULL),
('c788cf47d8004bb29925a12653be2451', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', NULL, NULL, 0, 0, 'sasadsadas', NULL, NULL, 1, 0, 'EUR', NULL),
('c9017c508d4c2abfecbb75ae221a5e84', 'P', 'e2203d735b01fce50df9b55c8c7ce7d8', '', '', 2, 0, 'salut c''est frais', 'salut c''est frais', '', 1, 0, 'EUR', NULL),
('c9b73130c5f90d456c78bdf50f0362c3', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 1, 0, 'je l''aimme', 'je l''aimme', '', 1, 0, 'EUR', NULL),
('ca56d447a67a630ce1998c9621d4cf33', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'Sentez-vous libre de partager vos découvertes ou vos conseils.', '', '', 1, 0, 'EUR', NULL),
('cb23349d906d3428d4203abe61dfda19', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', NULL, NULL, 0, 0, 'dsfsdf dshfdshf dsfds .', NULL, NULL, 1, 0, 'EUR', NULL),
('cbba88fecad6e732aee6b90b8bcacfda', 'P', 'e2203d735b01fce50df9b55c8c7ce7d8', '', '', 0, 0, 'Dsfdsfsdf', '', '', 1, 0, 'EUR', NULL),
('cd915f41de4f2fe88422d1d7ad61915d', 'P', 'f059097d60ffa8eaa4d19bdf10005a72', '', '', 1, 0, 'Je cherche un bon coach personnel. Pouvez-vous me donner quelques conseils?', 'Je cherche un bon coach personnel. Pouvez-vous me donner quelques conseils?', '', 1, 0, '€', NULL),
('cdee1f8f6d42295a8f9b25c08c6b6d8b', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 8, 0, 'Je propose une offre de soutien scolaire a 30 eur', 'Je propose une offre de soutien scolaire a 30 eur', '', 1, 0, 'EUR', NULL),
('ce90f495c8b0d7d8becf553b1b320914', 'P', 'f059097d60ffa8eaa4d19bdf10005a72', '', '', 1, 0, 'How much should I pay for for cooking lessons?', 'How much should I pay for for cooking lessons?', '', 1, 0, '€', NULL),
('ce92ffed97867ec30671db2983b10baa', 'P', 'f69e83f278f07765a4bebae3bcebd4ac', '', 'Sadasdas', 0, 0, 'skjdskadas\nsadsajd\n\n\naskdjasd\nasdasjkdasjdkasdjas\nsadsad\nasasdasédaséld\n\n\n\n\n\n\nsdad', '', '', 1, 0, 'EUR', NULL),
('cf7091ba40f9506c73147d286492c410', 'P', '264d508ef8cd0b1834465f532210f1a9', '', 'femme a la retraite', 0, 0, 'Kinesitarepeute a la retraite cherche petit boulot pour occuper mon temps libre.&lt;br /&gt;<br />\nAccepte garde d''enfants, travail domestiques ou échange de service.', '', '702e1a6cbf9c4e8229476ce5d39e1afb', 1, 0, 'EUR', NULL),
('d15d4a7a582a6020c11f7ec5eaea600d', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'kvxcvckvvcxv vxcvjhcxvcx', '', '', 1, 0, 'EUR', NULL),
('d1c46c5df59009d65713983983fab3b5', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'Sentez-vous libre de partager vos découvertes ou vos conseils.', '', '', 1, 0, 'EUR', NULL),
('d3faa2fb6cc9e4bfb5295a974d0403b4', 'P', '230c06bb802da8b08228f757b74f8dbb', '', '', 1, 0, 'Bonjour, quelles sont les étapes importantes à suivre pour repeindre mon mur ?\nSinon une suggestion sur personne habile dans ce domaine, merci d''avance.', 'Bonjour, quelles sont les étapes importantes à suivre pour repeindre mon mur ?\nSinon une suggestion sur personne habile dans ce domaine, merci d''avance.', '', 1, 0, '€', NULL),
('d6d916c938c6dfe61f8482bd2fcc7b12', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'Sentez-vous libre de partager vos découvertes ou vos conseils.', '', '', 1, 0, 'EUR', NULL),
('d731529c5649cdb281211c388532d970', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', NULL, NULL, 0, 0, 'dsfdsfsd dsfsdkjf.', NULL, NULL, 1, 0, 'EUR', NULL),
('d751975c1e021843d6be05312e33b0b8', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'Sentez-vous libre de partager vos découvertes ou vos conseils.', '', '', 1, 0, 'EUR', NULL),
('da17140ff413ee4d8a6e8538579c4d62', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 1, 0, 'selil', '', '', 1, 0, 'EUR', NULL),
('da442d34f08883a9da13c0e6f4e4b785', 'P', 'f69e83f278f07765a4bebae3bcebd4ac', '', '', 0, 0, 'dsasdasddsasd\nsdkasjdasda\ngdfggdfg\ndfgdfgdfgfdgdgdf\nfgdgdffgfdgfd', '', '', 1, 0, 'EUR', NULL),
('db5107afe06f0313c0f69a0443ed82b9', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'Sentez-vous libre de partager vos découvertes ou vos conseils.', '', '', 1, 0, 'EUR', NULL),
('dbe8214cbb419708d4bd10467dd3d563', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', NULL, NULL, 0, 0, 'sasadsadas', NULL, NULL, 1, 0, 'EUR', NULL),
('dca976e5347ce2a6bdcfc66e1f847c85', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', NULL, NULL, 0, 0, 'sasadsadas', NULL, NULL, 1, 0, 'EUR', NULL),
('dd6ea5d68a0d91f19383d21394a2064e', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 1, 0, 'jhjhjkh', '', '', 1, 0, 'EUR', NULL),
('ddbcd17b32b965065e3dde70a5b7bc4f', 'P', 'e2203d735b01fce50df9b55c8c7ce7d8', '', '', 1, 0, 'Ssadasda', '', '', 1, 0, 'EUR', NULL),
('df9e864d6ed67e60130a4990cb94bccf', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', NULL, NULL, 0, 0, 'dsfdsfsd dsfjsdhf jsd fsdhf', NULL, NULL, 1, 0, 'EUR', NULL),
('dfd5fda3f017aef57404e3b5cd9dfbca', 'P', '03e6f0dba7369437497b38cb168220fa', '', '', 7, 0, 'Bonjour, quelles sont les étapes importantes à suivre pour peindre un mur ?', 'Bonjour, quelles sont les étapes importantes à suivre pour peindre un mur ?', '', 1, 0, '€', NULL),
('e29997b7bdf894d341c05d1b6e0eed2a', 'P', 'e2203d735b01fce50df9b55c8c7ce7d8', '', '', 0, 0, 'Bonjour', '', '', 1, 0, 'EUR', NULL),
('e2b0fdab45045ddf77ebeddd5a8898d0', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', NULL, NULL, 0, 0, 'une autre question', NULL, NULL, 1, 0, 'EUR', NULL),
('e4ad2db698c96d46bf25004f38bcbfc2', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'sadasdsa', '', '', 1, 0, 'EUR', NULL),
('e4f45b779d09d577d7469695f5f8ba96', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'dsfsdfsdf', '', '', 1, 0, 'EUR', NULL),
('e854034f7fbfd690a8591d9fee402330', 'P', 'e2203d735b01fce50df9b55c8c7ce7d8', '', '', 0, 0, 'Dsfdsfdsfds', '', '', 1, 0, 'EUR', NULL),
('ea291897cc5a5b6abe6e820007132851', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'assadasd', '', '', 1, 0, 'EUR', NULL),
('ea9293345bd4e61549829c5f30794695', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', NULL, NULL, 0, 0, 'sdasd sadhasjd sadasdj asdsadhaj asjdasdha asdhajsdhdasj sadhajsdha asjdhadssad\nasdad\nsadassad', NULL, NULL, 1, 0, 'EUR', NULL),
('eabc853664dab380b2ce2f2cd80dbdde', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'sdfsdfsdf', '', '', 1, 0, 'EUR', NULL),
('eb03307675a20dd75816ae10b803b190', 'P', '03bd16f1fff98aa59ee7a6e59462654e', '', 'Coiffeur', 0, 0, 'je propose des  coupes à moitié prix.', '', '', 1, 0, 'EUR', NULL),
('eba823492a6cb9c0b89e3a68515e4e0c', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', NULL, NULL, 0, 0, 'salut selim tu vas bien dsfdsjf  jdshfdsf dsf hhjdsfsdf ?\nJe t''aime bien et toi', NULL, NULL, 1, 0, 'EUR', NULL),
('ecf349cee7f79f4b5c3a6dabdd032b89', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'dsfsdfsd', '', '', 1, 0, 'EUR', NULL),
('ed54c93c2d6cc83b0f7f092c15a2291a', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 29, 0, 'dsfsdfsdf\nsdfsdfsdlfsd fsjdfdsf', 'dsfsdfsdf\nsdfsdfsdlfsd fsjdfdsf', '', 1, 0, 'EUR', NULL),
('ee91b06daf243a32ade42abff1e289b1', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', NULL, NULL, 3, 0, 'ssddsd', NULL, NULL, 1, 0, 'EUR', NULL),
('f09084608112810233438078ac83e83e', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', NULL, NULL, 0, 0, 'hello http://yoomken.com', NULL, NULL, 1, 0, 'EUR', NULL),
('f3a13e51d22d8ad2a2ffb43d3c61abc0', 'P', 'f69e83f278f07765a4bebae3bcebd4ac', '', '', 0, 0, 'Sadsad', '', '', 1, 0, 'EUR', NULL),
('f3f6f4b4d788dd4b15674975b7b2efb8', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'hello xxycxyc', '', '', 1, 0, 'EUR', NULL),
('f568f4d32ffa851b3f36ed7a9e734c5e', 'P', 'e2203d735b01fce50df9b55c8c7ce7d8', '', '', 0, 0, 'Sdad sjadajshd sajd asjdajsd sadjasjd askdhk asjdkas dasjhdaksj das dasjdhas daskd asdhaskdaskdhsajdhksadh asdhaskdhaskdjshdkas jshj jksadh sagd hsgdhad sgadjas', '', '', 1, 0, 'EUR', NULL),
('f6691d777cc48b6ff44cfdc2ea812e5d', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'asddsads', '', '', 1, 0, 'EUR', NULL),
('f8331425f3a89d15c6b5d298b112ceaa', 'P', '230c06bb802da8b08228f757b74f8dbb', '', '', 24, 0, 'Bonjour, quelles sont les étapes importantes à suivre pour repeindre un mur ?', 'Bonjour, quelles sont les étapes importantes à suivre pour repeindre un mur ?', '', 1, 0, '€', NULL),
('f86e00ce3a33eaf6f7fe631d7482b26c', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 0, 0, 'sdfsdfdfsf', '', '', 1, 0, 'EUR', NULL),
('fae8c41b9f97670fad332eb081733396', 'P', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '', '', 12, 0, 'Salut à tous ! je recherche un bon électricien dans le coin. Pourriez vous m''aider ? merci d''avance.', 'Salut à tous ! je recherche un bon électricien dans le coin. Pourriez vous m''aider ? merci d''avance.', '', 1, 0, 'CHF', NULL),
('fd5483e85bf532ea6d857806e56dd541', 'P', 'e2203d735b01fce50df9b55c8c7ce7d8', '', '', 2, 0, 'Sadasd', '', '', 1, 0, 'EUR', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `unity_ccy` varchar(3) CHARACTER SET utf8 NOT NULL,
  `coeff_ccy` float NOT NULL DEFAULT '1' COMMENT '/EUR',
  PRIMARY KEY (`unity_ccy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`unity_ccy`, `coeff_ccy`) VALUES
('CHF', 1.3),
('EUR', 1),
('GPB', 0.8);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id_act_evt` varchar(32) NOT NULL,
  `date_start_evt` datetime NOT NULL,
  `date_end_evt` datetime DEFAULT NULL,
  PRIMARY KEY (`id_act_evt`),
  KEY `date_start` (`date_start_evt`),
  KEY `date_end` (`date_end_evt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `filter`
--

CREATE TABLE `filter` (
  `id_fil` int(4) NOT NULL,
  `id_filsma_fil` varchar(32) NOT NULL,
  `id_fildef_fil` varchar(11) NOT NULL,
  `id_op_fil` int(4) NOT NULL,
  `id_in_fil` int(4) NOT NULL,
  `value_fil` varchar(1000) NOT NULL,
  `label_fil` varchar(500) NOT NULL,
  `attach_fil` enum('AND','OR') NOT NULL DEFAULT 'OR',
  `type_fil` char(3) NOT NULL DEFAULT '111',
  PRIMARY KEY (`id_fil`,`id_filsma_fil`,`type_fil`),
  KEY `tok_fildef_fil_4` (`id_fildef_fil`),
  KEY `id_op_fil_4` (`id_op_fil`),
  KEY `id_in_fil_4` (`id_in_fil`),
  KEY `id_filsma_fil_4` (`id_filsma_fil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filter`
--

INSERT INTO `filter` (`id_fil`, `id_filsma_fil`, `id_fildef_fil`, `id_op_fil`, `id_in_fil`, `value_fil`, `label_fil`, `attach_fil`, `type_fil`) VALUES
(1, '', 'p', 10, 5, 'ME>', 'je piste', 'OR', '111'),
(1, '0149e6da273464fc163020f107620a33', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '01a64c073dac1393f8d779b82be861a5', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '01a64c073dac1393f8d779b82be861a5', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '027f6e00fb2b4b206b654d0cfef0b65b', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '02c34672915e2417bfd6a4b8402ee1a3', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '02c34672915e2417bfd6a4b8402ee1a3', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '02ca235cbebe9a251dd2c4f285c360a9', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '034405bff40a911ee90f0a6155ea16bd', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '0382595b313131bfcafc626587cc21dd', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '03e84c5f819d999a34d7ab4b94498af8', 'c', 3, 1, '', '', 'OR', '111'),
(1, '0412a8ebc296397a7335dad51e2643c9', 'c', 3, 1, '', '', 'OR', '111'),
(1, '04330f7242fce65e7d8d66774a3e9951', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '04330f7242fce65e7d8d66774a3e9951', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '0433b51b2cbeb8a8d720d5b85084e802', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '0433b51b2cbeb8a8d720d5b85084e802', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '043445b86abbdf47e3d850d3dacf34f1', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '043445b86abbdf47e3d850d3dacf34f1', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '04b916f14ff6fae2d090c2bb9ec88291', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '04b916f14ff6fae2d090c2bb9ec88291', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '050a73e2213b06963f80bf9a63dab31e', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '0531bb6e47d8ffd761bb75b5cbf08f94', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '0531bb6e47d8ffd761bb75b5cbf08f94', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '057c2cad40f02e7a0812966758f3a55e', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '058da87894eba8e48ceaf6d87c1d9a79', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '058da87894eba8e48ceaf6d87c1d9a79', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '06068ad0bbe2ce0ac40fe5ff2e6c7f27', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '06068ad0bbe2ce0ac40fe5ff2e6c7f27', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '064b0026e2a662dac1a964487f21bb3b', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '064b0026e2a662dac1a964487f21bb3b', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '06cefa94478ecd34a60235618d1ae08c', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '07b593bfc1da998d9751b6f95e8ffbb6', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '07cf27a29dedb5ddb333c2fa843e7060', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '07cf27a29dedb5ddb333c2fa843e7060', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '082573e20d78f29737470c087da83ca8', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '08ad3dc033023f63d506a65ab5f0f32a', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '08ad3dc033023f63d506a65ab5f0f32a', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '08b34a9a6c74b01d6935462ee2542e04', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '08b34a9a6c74b01d6935462ee2542e04', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '09b8879bb164945e9009a7808c2b3d83', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '0a6ad6b5f342c8ca5c6600d27f99b565', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '0a72b10b0e3f2958e428c5cc72a47bc2', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '0aadc747a5517e3ae42a2eaf8b729413', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '0ae678a427de5b6c36db714c7d6f1a69', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '0af330bbd7b8734e332cbfe2d4d01397', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '0c41358fa1335f978d40df0cb49454ca', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '0cb029f015db4e25afc7951c75166ecf', 'c', 3, 1, '', '', 'OR', '111'),
(1, '0d51fe5782799b66d2a089aeb4a2acfe', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '0d891a641390d88cccda90baa304adad', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '0db283151508f927ad2596e47864238f', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '0dcbdf3b38adce34f189df1d20e70c0e', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '0e407dac4367665662004c803a341f83', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '0e407dac4367665662004c803a341f83', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '0e46b9b91c83b9e42920edabeb4e7d09', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '0e46b9b91c83b9e42920edabeb4e7d09', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '0eaf5cc7858913a44fac4d462ebef1ce', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '0f2096ada30a8b3948e8fb6427553d18', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '0f2096ada30a8b3948e8fb6427553d18', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '0f388e22d5f5e1a469e917e25ef4706f', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '0f3f59e0b85c2f28b08808851f527fa1', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '0f3f59e0b85c2f28b08808851f527fa1', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '0f5519aafc0058d45b56b42f862c63ea', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '0f6bff4a79d876b197c813477308b471', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '0f6d8f1d45ae51133df4e29986035ea4', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '0f8f57f5d2cd739f9b358bd951edca84', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '0fac92e94335bd15c4dd9118c684ca55', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '0fb539e117382e00c5b83820cc3e4063', 'c', 3, 1, '', '', 'OR', '111'),
(1, '101491963e00ff10c0339d20219645c1', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '1033092492d39baeff5ea3f06436cb11', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '10e33b16a003d7f8ac5705cb7caac1e2', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '1342288b03fd288fa53490fa40529a25', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '13ed5dd7fde4a41e33ad26d90c4b31db', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '141262a9486cfc00e4faf7d05c172809', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '141fd71349ecdfac06e2408ad7b18c94', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '155f836c56bbd253dc8c28cfebbf1d9b', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '155fcf617235be4cbad36f07d4568c15', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '155fcf617235be4cbad36f07d4568c15', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '156a5fbcfb19a60af1927fa0cce6d50c', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '156a5fbcfb19a60af1927fa0cce6d50c', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '1576216adce8608f4ace3ce5cc863bf5', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '15a3fd518a428bd17f7c3c053d3f98e6', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '15edb2f0418604787b1890e5001a79ff', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '15edb2f0418604787b1890e5001a79ff', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '160ba498388b12e1b4eeac3dc42720db', 'l', 10, 5, '>ME<', 'à proximité', 'OR', '111'),
(1, '160f37df7553072d5f5c3848dff6beee', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '16fb69258074b7bb40f8ce282c7783bf', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '16fb69258074b7bb40f8ce282c7783bf', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '1706e8b6cad1e0bdd1ef48a65275ad62', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '179f1f2b97b414141459ce38c1052a90', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '17d7641fee55d80a4706990cc7474913', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '17d7641fee55d80a4706990cc7474913', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '180976a604b5c6db3417cf001a3fd979', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '180976a604b5c6db3417cf001a3fd979', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '18372d0dd705277c6ef856b12023016c', 'c', 3, 1, 'canada', 'canada', 'OR', '111'),
(1, '1866f429bd560f4e0ce7350eb8248dbc', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '18f4b430c1f20b3133ea2e2e60ef73d1', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '18fc7fb4174b0de62020aea06644fdf6', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '18fc7fb4174b0de62020aea06644fdf6', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '197e68ca29edb404c851fecf19fba871', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '197e68ca29edb404c851fecf19fba871', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '19f57565b7ed50d386d74d3650f20362', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '19f57565b7ed50d386d74d3650f20362', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '1a1df33b0934168821668840b61de845', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '1a1df33b0934168821668840b61de845', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '1b4b5e418a5d0d7a9cec5e426b18ae92', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '1b4b5e418a5d0d7a9cec5e426b18ae92', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '1b8666b62b8f3f235c5f8494e97bb272', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '1bc5b78afd0114ed54c58050262d667b', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '1c0a59ec12e4ac6d6fea524afc55e803', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '1c23b890e4012441605dd1a7d410d50a', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '1cb4011edf3a593a4857e405532c949a', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '1cb4011edf3a593a4857e405532c949a', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '1d0580b6c945b6c37d4335c755495e18', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '1e0f810131f91bf01ceb2b01e819a973', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '1e1b861ae986f91b55b0306b8316d150', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '1e2e4719a70659ec4925edc8f373f445', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '1e2e4719a70659ec4925edc8f373f445', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '1e328ad9c960988296618f3a1fede148', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '1e328ad9c960988296618f3a1fede148', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '1f70a92660a6c0946acf0268d1ab75af', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '1f70a92660a6c0946acf0268d1ab75af', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '1fb48c90b730d336e74bc0ba356e50ce', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '1fb48c90b730d336e74bc0ba356e50ce', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '2046aa099043081cef012733b51d6aa0', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '2046aa099043081cef012733b51d6aa0', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '208f3d1d24649deb7f6ddadd660335f5', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '20d1279ec49fbf189eec983cfb3dffdf', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '210773f4cc1ba498bb463cfb0683185c', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '217663771c7c3040a46674457b89a9d9', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '21abbb6164fddbf912780cfb7c8ed511', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '21b15c5b52af11d8925c24335d307c51', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '21b15c5b52af11d8925c24335d307c51', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '220ecebc51e849d1431e04dd40bc1dd2', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '22456caf3d60530355247615fa2f901f', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '228b64be987e3e251e284ee4f31f02a4', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '228b64be987e3e251e284ee4f31f02a4', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '23a75ffa6908bfc6978abb00f79cd433', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '24298b3561362ec2c0c8d6f3d434530f', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '24e0dac262249ac1eb4011d986d0e73f', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '255f12899645afd385d6a043e82b8cc5', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '25db85f9dff41266afeea86b3102ab2a', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '25db85f9dff41266afeea86b3102ab2a', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '25f825608419a8302ee422a96dfb4143', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '26521531e825135c28bc1d60e14262a5', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '2723c32722b04500c663f26f2a5ee0fc', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '2723c32722b04500c663f26f2a5ee0fc', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '272e7ad4572ef7267e557db6d2bbc9a9', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '2733f0c0d241f567203324b9604dff90', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '2768a609f5cc5509b213bbb42bf389dc', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '2768a609f5cc5509b213bbb42bf389dc', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '27ab6782fcb72498f341c9c670c66f69', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '27ab6782fcb72498f341c9c670c66f69', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '28002db64c09d44341c4ab2c4f823eae', 'c', 3, 1, '', '', 'OR', '111'),
(1, '281adb87caefb55c1d5c9e97017b39d8', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '281adb87caefb55c1d5c9e97017b39d8', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '281cbe23c2092355444c4eda7ccc9ad9', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '281cbe23c2092355444c4eda7ccc9ad9', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '2886231edc04af708c4ccd5a76f9ebdc', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '28e0bbe04f1a2b32132ed66ea7d90993', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '28e0bbe04f1a2b32132ed66ea7d90993', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '2935acaa807d0ddc184440f8dbe1006f', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '2945e3b95a55fd56bda0eb4c7c2c1bcd', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '29622a9b2ae2b5b3a8306102d8ccdeaa', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '2aba6f1fe0cb850ec4fe769ca7c83919', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '2c0e8af22ae99b663d3be79ecc7d1b4f', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '2c0e8af22ae99b663d3be79ecc7d1b4f', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '2c724c888cf3e1e08b5dc74994c58efd', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '2c73ffe77a56248e19b4d4ab462c16e9', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '2d03109fb1664fddf0216c15a8d635c3', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '2d253d6280928698b65768ab2127171a', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '2d5826f8ecc3d96e31677d15ce843482', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '2d5826f8ecc3d96e31677d15ce843482', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '2dc21a9e115f8678c851d073f16a04b9', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '2e29fb53486f5e1519fe0dcf75435ab1', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '2ed093702247ae932c894b9587132bb9', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '2ef09f2c536320b1b89e0171c521dc51', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '2f0770af50140073ba13ef25cd6044d2', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '2f3efc1450e3cac85ad5abf0b23f2783', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '2f52a7acded569344972f6ea8fdcb8ec', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '2f9f663acfb1aad6012629cc98f0c9ac', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '3032a00b5d06b1cdce81123c26f64f78', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '3032a00b5d06b1cdce81123c26f64f78', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '304e9e8b2f4b9374a8630c53cb464114', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '3147d7636419b84d18aadd7955def4e5', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '31d9008e9f38b5465a204bf879a2fe4e', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '31e605306b8073291e7ef40eaa9fb4bd', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '320f74f02b5010f7c1bd958a77c24ef0', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '320f74f02b5010f7c1bd958a77c24ef0', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '32226b9be40f00855c5143aa0ecf4e93', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '325c4f8ed891a9f67e598fd5d1f1d9fe', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '32c9d61146e1b440b277662c7ebf69e5', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '32c9d61146e1b440b277662c7ebf69e5', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '3340597157e4877cbf3f5da6799522fb', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '3353c0cdee4246d1293cabc90a44dda7', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '34445272920414f1f8920f0e6eb5a822', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '34445272920414f1f8920f0e6eb5a822', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '3474d4fad5c3b1533f8684292b62347e', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '34d9350ee17307fdc1f25cdfe6f0562e', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '34f8a78244d82b5a17977404eb6f7a82', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '356712387b92765bc43bfccf600c5816', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '356712387b92765bc43bfccf600c5816', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '358493edd70f7783071024bf623bc83b', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '358493edd70f7783071024bf623bc83b', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '35b9f758c221177dc98dd8717088e7ec', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '35b9f758c221177dc98dd8717088e7ec', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '35cc00de08e454b3a3aa83a0ae3f0f8f', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '362ed13ca368d87c437004b251510b98', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '362ed13ca368d87c437004b251510b98', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '3640152cf49519bbed2f68f4fb6ec325', 'c', 3, 1, '', '', 'OR', '111'),
(1, '368b2042cf62c3dcc99c2157464da6fa', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '36918740527665cd9c2893846449479b', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '36918740527665cd9c2893846449479b', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '36f4d84dc7d8bf36d1c31d2733de6392', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '372113319e73dbfedfa523bb71335152', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '3724d0028d21df522edc453a54e3edb2', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '37300f611c410c54d4e9da210867e1a4', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '37ce8c57dae7ef74228bb29c6f8f4944', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '3815cb35374d6ca19b42c02921e976e8', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '381f60c5781328270406e06df801a671', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '381f60c5781328270406e06df801a671', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '385aefea2c047783cfc7294d0aa206b2', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '385cf051ab183243439af737b7c5c9e3', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '38c078af9f432cec0472a9e231714908', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '39570aa8f440a253a8bdf953d2e49928', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '398160cab406654e18359d4069cbc1a1', 'p', 10, 5, 'ME>', 'mes pistes/mes pistés', 'OR', '111'),
(1, '39d502ed0a99ff7aa33cb0b7a4fa6b65', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '3a0ce02a39a177579e469c6d3380c477', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '3a0ce02a39a177579e469c6d3380c477', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '3ac7fcdf840adc39ae5c1a8db31fc770', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '3aefd7158f1c397ec50a016df802c819', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '3af6ee3befd51fc00fa062f55327284d', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '3af6ee3befd51fc00fa062f55327284d', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '3b0ff7e68e18d0d272fe7412e6a8e5b3', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '3b2ff9b98cac5f325aaa0d115634fb0b', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '3bbc6d78d9d12df5e58906d2a96c4d81', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '3bbc6d78d9d12df5e58906d2a96c4d81', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '3bc889843fa55062e993740200327aee', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '3ce76d94fab59493577841533dee2eaa', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '3cf44a2e0c81f7e701322a82a56c8b63', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '3d6b01fddabf00b07bf865065fc42708', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '3e8f8efd6766aaf756b6fbf8f22f2613', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '3e8f8efd6766aaf756b6fbf8f22f2613', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '3e948993059f71b104fc78abd1c66231', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '3e9b7cba9d7871b96d89d5289b04d154', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '3e9b7cba9d7871b96d89d5289b04d154', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '3ebb5715d8b6fcaa233f27f0d7062b28', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '3ebb5715d8b6fcaa233f27f0d7062b28', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '3ec3dc62825934531a110e6e7dae326e', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '3ef250b126ed008eb2e88c53bd654dd6', 'c', 3, 1, '', '', 'OR', '111'),
(1, '3f287792dc383ecf15f644a1f7875206', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '3f287792dc383ecf15f644a1f7875206', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '3f3f1c38ca6e56d6b48e9daa2a71768b', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '3f60615e4283f3cc4bfce81da18cdb0e', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '3ff5285ea1c4e8ca6d0ed68c213bbdef', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '3ff5285ea1c4e8ca6d0ed68c213bbdef', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '400bc169b7b8409ad9a792279f204fd1', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '40c12f46329741bbe2dd969f9c80c163', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '40c12f46329741bbe2dd969f9c80c163', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '40dcdf946347b0fabe54c67b2546a16e', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '418bce2bebda75538d60708458b0c557', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '418bce2bebda75538d60708458b0c557', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '418f55677f9566069f223c9f766c24e5', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '422130206f62afd410a8069a43062edd', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '422130206f62afd410a8069a43062edd', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '427f41a498bad5de050147aadd8f0afc', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '42d44f34c6dd79a23697508c621a547e', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '42d44f34c6dd79a23697508c621a547e', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '42e834635af220f84dc86a90369faf9f', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '4327a0de96c70129899d11b0cdc8b79d', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '43b46d185fe61464ee454b0594ce7f75', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '443e62c5a6b37e1a0883c645726c41b6', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '453ead5b88f3bb3d7d4860318f62a131', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '4549d120d0b2597919c53fdbe9048d78', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '4549d120d0b2597919c53fdbe9048d78', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '45959234f553b6b48b9dd5b7b72df178', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '46629a4380ce8b9526eb63046e3ece1f', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '46a4a72c684bb61ee8573bccbe7eef1e', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '46fd1a3ac80a9691893b670b02fbed27', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '473f539252195dd4bc1be8df4b73a894', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '474d17f928d443f3a56e6d328a3b6fbf', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '479d54e3b1b128865e35c7b3e3512679', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '47a36d9f7fb6e135e37f1f678c0b68bf', 'c', 3, 1, '', '', 'OR', '111'),
(1, '47b6fe9aa1d94d3710be4b14280bce5e', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '47b6fe9aa1d94d3710be4b14280bce5e', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '47f9446de662f1460654119300963107', 'l', 10, 5, '>ME<', 'à proximité', 'OR', '111'),
(1, '48a0dd4a0e7b20aeeac098d1cd577949', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '49779af2a3a5da4d3ff1be793c460fec', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '4a059814fbabd9a7c8d661316c60c1a2', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '4a059814fbabd9a7c8d661316c60c1a2', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '4a084c251384222888a3b35c040d06e5', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '4a13e9dcbfdcd935f86912463a40cc59', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '4a13e9dcbfdcd935f86912463a40cc59', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '4ac1620a3eedbec88f0607e22f3ab79c', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '4b44d27e4eff00a5129ed948c8112e6b', 'p', 10, 5, '178cd2f3df2d88613b46bb6e96a77f3a!+!79b1b9dc1b338006650c78d3b4919b04', 'Sara. Nottelmann!+!Hakim. Pousse', 'OR', '111'),
(1, '4b61157e4b95635a5d40d0569fe88d09', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '4c3dc8e57f31e03121021833b89d4d9d', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '4c460cd58c1efbc5e08a4fec64ad6c4d', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '4c4870ead0440ca15b5eb659450ce7cb', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '4cca243eb0e89866acd3c6526e0f6596', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '4cdd25127cb8147e688c4e4859a84b72', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '4cdd25127cb8147e688c4e4859a84b72', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '4ce253ecf4f52f7980375fd6b9566c01', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '4d4b7e4886e2cef55a96cbe2f443e7ef', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '4d4b7e4886e2cef55a96cbe2f443e7ef', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '4e47a8b5a9a1eb334ed266b821b84fab', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '4e6b8fa2c7105aeec637c9f6e82d1311', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '4eb4cb706ed9e71563c6281580a33cc7', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '4eb4cb706ed9e71563c6281580a33cc7', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '4f57cce47821f8af67428921a3a2103c', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '500218837add9145f83652301995545f', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '500218837add9145f83652301995545f', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '511d5066a019be7949b6e1b15d799edc', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '5136411eae668d14a81b1c0d749331aa', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '514a4786818053f05e34c9374ea5854e', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '516d47b29f199687707cda7e89c08366', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '51b31628621ef42197a5d23dd6c80fe8', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '51e3ed2a8f9e89e09caef8c18e9a7634', 'c', 3, 1, '', '', 'OR', '111'),
(1, '52448e8284a1772a39d6475830b37a36', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '5247854ece1cd4e988843732a2eb5290', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '526ac80ff966ccaf64c8e5a8e60e5575', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '526ac80ff966ccaf64c8e5a8e60e5575', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '526b687e97b3c9700b6eeb9178626eed', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '526b687e97b3c9700b6eeb9178626eed', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '529102ef0eef5e8e13a6186cb08d280a', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '529102ef0eef5e8e13a6186cb08d280a', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '52a3cab6f9205b2c6fee274ba6c4b09a', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '52ac6f1871023dc59269870dd5c7856b', 'c', 3, 1, '', '', 'OR', '111'),
(1, '532cb751fc002b5c2df3a32c8d1f6c25', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '53733a64d7373079b6570c4308046c23', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '556aca82160a00853becebc4c3c314da', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '5586459081d96920c2b9310c7dde3cc4', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '5587005ccf9a09b8f55bc655b5f8ad65', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '5587005ccf9a09b8f55bc655b5f8ad65', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '55978f710516a080fa9a075c14ec7919', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '55978f710516a080fa9a075c14ec7919', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '55c0a34e841570cbdd4f89d7184b8a48', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '56990126f58071ced6aa2e4cb941c7db', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '56e8efdccfdb03c70ac43f19c18eed6c', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '57eb85f4d4e2762eb017b8fa928d785f', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '57eb85f4d4e2762eb017b8fa928d785f', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '58b3b5cd01eef99f0cfc180662ca6834', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '58c3d0f69144cfc4b96c8c00b3543b06', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '595064a4bb0d1cb6c34db737be2c6454', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '59d2a6e49cbd338f2791e7527ff52530', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '59d2a6e49cbd338f2791e7527ff52530', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '5a64111651e7ec37c2c9691367ee4cae', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '5acaef34698a47b143b29ab99aa6d923', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '5aeb51840beb5034f8071a2152cf91a9', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '5b66c2b57108b887e0103299311fa904', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '5b66c2b57108b887e0103299311fa904', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '5b7b8b0b0d2734b6165eaedb6d42c687', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '5bcce2b040aacda960d18a8569ef384c', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '5c89af1cc9eed739bf7c5c19fc7d5682', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '5c89af1cc9eed739bf7c5c19fc7d5682', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '5d5adb8d3f3aaf5d7e74dcb9a220503b', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '5d5adb8d3f3aaf5d7e74dcb9a220503b', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '5d7947a60dae156817d4eea50be34281', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '5d7947a60dae156817d4eea50be34281', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '5f207245a2e495af4d34576447aab8f1', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '5f4771702944b0f9913790afafcaae19', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '5f5bc4b86c62b74b22da8870013b8b1e', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '5ff1ed6639594e5e46efa982ba2103c6', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '5ff1ed6639594e5e46efa982ba2103c6', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '602158aad8818c6dc7758e69845a9758', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '6048f9a7f13bf5dd22c07a1c4967d7ee', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '60c98d09de5fd1db3c04d0ffaf09acce', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '60c98d09de5fd1db3c04d0ffaf09acce', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '610d59b415150783066568ea4f426141', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '611101db2ca7d554ebb65a4150b06d45', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '611101db2ca7d554ebb65a4150b06d45', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '61908f9b844a793fbe385772b3696f76', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '61bd53abcc601c409178f4d612f21ec0', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '61d804eca36fae07334ef9b5c008d272', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '61d804eca36fae07334ef9b5c008d272', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '61fd6cd6a63daeb3b0c7f869a52bdfd1', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '626ed64f5456b08b202f3a6fad998a9f', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '63437674ad7640710cb3f0e4cc5eba08', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '63449fd4d0f9a2c708109851cbb2f8d7', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '63449fd4d0f9a2c708109851cbb2f8d7', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '63488371c11e62a12ea2d5219365e610', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '6348c7455aa9c2595ae80e89d9631fb4', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '639c26a8f78490e14285be5295f7dfa0', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '63c3bc69ce8f94e38bfd93cc5507fe2a', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '64eb2c88aed354b2277eae0987c9eddb', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '64eb2c88aed354b2277eae0987c9eddb', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '650c3c58cf0e1437a8c51813b22cb124', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '6565f96296b08d00ef4e042772944be9', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '65dd672e1883baf79570de36f302d83a', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '66177934406d693cf86134d50910bcd5', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '66177934406d693cf86134d50910bcd5', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '667bdd55beb347b5e8456ac1bfe33c72', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '66a26bf9f186c492f73c15bcc27aacc2', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '66a26bf9f186c492f73c15bcc27aacc2', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '6763d326d6947a8e17502eeb4628ee55', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '6763d326d6947a8e17502eeb4628ee55', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '680f164b3703a261cefb9355be064bca', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '680f164b3703a261cefb9355be064bca', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '681ec888647de25167424b788a84c4ac', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '681ec888647de25167424b788a84c4ac', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '6843e7ecaffa4934a04a60b51e83b81a', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '6843e7ecaffa4934a04a60b51e83b81a', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '684d062a234e84f277abcfeabc1e411b', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '68769be6a9aaa2fd47617d029eb92018', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '68c2e876107b471f04c2fc6cb8ff2cb5', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '68c2e876107b471f04c2fc6cb8ff2cb5', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '69024fe51faddb6b06616aac4101cd6f', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '69219695dad46b7fa4931f23e45385f1', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '6945394d8f171a83788759fa03dd180b', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '6967d89a621070cf23cdf5aa7077cba4', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '6975ab75526aa95552dcef5bc1414b7c', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '69a37f07b6b7a0347f96d81184c6d8fc', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '6a0200194e68931474c5b50bd92047f9', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '6a0200194e68931474c5b50bd92047f9', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '6a54e5916e1a7a3694d90b2911041336', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '6a931dd4f82608254bae131c778cfcb9', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '6ae1235837dc451869c13dca60d54bb3', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '6b66321ff96514714a55ba467463c1b8', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '6b66321ff96514714a55ba467463c1b8', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '6b9b4bcb8f7f2bf4d4394b8d19b76b5c', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '6b9b56d8f7b054f04e217fffdc125077', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '6ba79079783aa3645e83f379a91e20c6', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '6c4b97b4156a7538f8b702e8881f661d', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '6c6cb9ae66e318c0755f458f7e25a3c7', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '6c6fc14d981690f2a0d1e1ca54a29812', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '6c9f8b07c65c537d36aab67af07f9cb6', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '6c9f8b07c65c537d36aab67af07f9cb6', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '6cbabe25f830e8938fcd7ed027c6b2bc', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '6db72ed129badafe89aee73adc7e28c9', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '6dee1c12e392f82d9be52f1aebc5bcea', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '6eb1fa2f345abf1e9be9bba70e7e4720', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '6eb289835051daf8bb3fb8d5d3e29326', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '6eb289835051daf8bb3fb8d5d3e29326', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '6ebd9e26d7ab8b659a2568a6bacecc90', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '6edcab1d2f279f12731efa02e52ac888', 'l', 10, 5, '>ME<', 'à proximité', 'OR', '111'),
(1, '6eea7c15408bb802781075e9e4221fe0', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '6eea7c15408bb802781075e9e4221fe0', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '6f35b17083ce02382754864547c6ea13', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '6f43bbbe056bdc12ab956095a44183da', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '6f43bbbe056bdc12ab956095a44183da', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '6fd460216d954eacab72a3093eee190e', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '6fd460216d954eacab72a3093eee190e', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '6ffda29bf0a256302002bb6689f85edf', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '701cdc5bc5d83d7c36ea29c4d129b6ac', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '701cdc5bc5d83d7c36ea29c4d129b6ac', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '70367541aaf4a2bd3e1d5dbeaf0e4ce9', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '705b20050919df9696841bc8984c92ce', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '70c2c72a5cd97a23136cfffa27449324', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '70d62a4150b5c676fe53d72575f59177', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '710e80a4d0ec649de4eba1aa0a86e77d', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '710e80a4d0ec649de4eba1aa0a86e77d', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '7160e9a4733aaa3375ae155409f71f06', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '71afedefd8d6e60864b8c0a83bc43f3a', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '71d473e9be3e3829fa27c75c0ed34f8c', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '71d5ac99b53a29a2c8dd8d748d5b7a81', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '720c3dd2b48a698c9a232aa8d126ff41', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '72de38e5da1e30d976f9ba55411db047', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '72de38e5da1e30d976f9ba55411db047', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '737e42c2b7108444c242ae1c08fa154d', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '745df018213ca3d582d40472a654c94b', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '74971e95bf7abf30d817d8df78ed8f40', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '74c49e002aea40c1cb476d8a34619071', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '75549ef2e8d8c4bc2775da373c935639', 'c', 3, 1, '', '', 'OR', '111'),
(1, '75d46c0439e84d7c7179805a1915b6b1', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '76774abe883068d7ca4e2cc782757713', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '76ad7e0864f1936360835d7656fe0d00', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '772808139d1a6ff50646a07ecc655203', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '77310b1f56d08b4bf24ba145b82a1e35', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '773e74260013d9ca4f8e57e9a1490755', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '77988ca16367ede8f788da9f1c10e88f', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '77988ca16367ede8f788da9f1c10e88f', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '77df336ec46ae6c59a491355f9f3e4b3', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '784cba8d6e73a560448270a8ec59f793', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '79355c1d3c32df425bc55b9148809b62', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '79355c1d3c32df425bc55b9148809b62', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '7a310c7ee9abed33a12d3cc7f8191520', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '7a3b0c03748dbfaa7ed10e04d83d7140', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '7a9701428afc51d6dec7319ddcc1ef67', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '7b81fa3b6c9780b368c51742b0e376f2', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '7b81fa3b6c9780b368c51742b0e376f2', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '7d666f7115fbdcd180c492aaca81d2ed', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '7e8747af8deee28847bee4e89e6c5505', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '7e8747af8deee28847bee4e89e6c5505', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '7f14ab06707c80efba5879e1cf5b90a6', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '7f33ab52f81561d11ba17813117c3cc5', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '7fdf1f84b4cb67eb2a1e5b277dcf3702', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '8004464d06256ef723d56dc549fa9300', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '8004464d06256ef723d56dc549fa9300', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '8034079ee2e42eb083a25dde7d5b7eaa', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '8034079ee2e42eb083a25dde7d5b7eaa', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '80d0435308032904f08df14e8a2baee6', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '818d36baa958c67fbf1ef7cb612b213f', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '81d68a7cd2c2443036fb8d2c940dbd91', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '81d68a7cd2c2443036fb8d2c940dbd91', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '81f82b9918b9025dfa0bfe5dccc7154e', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '82294358de89001ba4b35552a1cfb065', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '82ce2541b08816776eb065b4cefb307e', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '82ce2541b08816776eb065b4cefb307e', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '82d4e335678ec63c62d0a787eee0fa71', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '82d4e335678ec63c62d0a787eee0fa71', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '837526157953e840652cc514bbf46ae2', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '837bebcd24d1ebc39b8e4c3079377741', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '83823e1d25aae3d294dbf6a6295c4cf0', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '83d7380525f42823389e1ab1389a1ddc', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '8423a0f697c0142837b6308974074ff5', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '8441da9d9aeb7f3e2bfaa9753c8af6a8', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '8476560b20bbeb19fb14be59e1152fb8', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '8479a8ac75cc555d831dc6d77b49fb02', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '85753750d61bd0c5bd6f80d12b0c33ba', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '857c115d73563d63ec1b7ad5cc8565fe', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '86e59d5c4f063834cd7957f43b9e25fb', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '873e23e7bd30774c19d9319c33ab2b61', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '87cf73ec166f8fd627805ea88b19aec4', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '87cf73ec166f8fd627805ea88b19aec4', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '87f5544ac7d209e40c60d127e4a7a794', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '882d5e433b0bcf59c361e004fd0e154d', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '883d3a1e927fab21d47bcdd0e949f2c3', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '883d3a1e927fab21d47bcdd0e949f2c3', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '891f541472f02be35d0033b7c8300e69', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '891f541472f02be35d0033b7c8300e69', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '8961ff695a843f419d4bbf4fb9eb71ad', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '897bbf9c1073eb3e316be6bce5b3e04c', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '89ea6f713b957ebfb4251fad7edf7fe1', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '89ea6f713b957ebfb4251fad7edf7fe1', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '8a16ea8c941dfbb2af676d49ad76c368', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '8adce741f7f8f3258fa186bd6b3de087', 'l', 5, 7, '14083cf69ecad60e1e2cb90f64dcd56d', 'Tottenham (GB)', 'OR', '111'),
(1, '8b0c1028331b22b3eeef2a59c7567b9e', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '8b20aecf2cfadb0f4c77d80e428ed767', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '8b20aecf2cfadb0f4c77d80e428ed767', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '8b27d2138890e0e8b097f286f4e22995', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '8b27d2138890e0e8b097f286f4e22995', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '8b47b784551bda7597fcce86e98381f0', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '8b47b784551bda7597fcce86e98381f0', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '8be0bf8e3e560a9be297fedbac424a36', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '8cbd48721e8dbbd0261d91630299c2d0', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '8cc8d5cd548ed91868d51829a7e4401d', 'c', 3, 1, '', '', 'OR', '111'),
(1, '8ce9c8d41136b47f152d34a51007ac80', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '8cf77fb0a3b30814fcde31f41dab55fe', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '8cf77fb0a3b30814fcde31f41dab55fe', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '8d2bc3f0974298cf790a0cb17ee74f67', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '8d5532f207105e5ff3f416ce804ed380', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '8e25b409e7d70df513bf8975800b3f21', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '8ec032c6445d544f4898155704bcc899', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '8ec032c6445d544f4898155704bcc899', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '8ec4fa3b6b4fb77eb63945e0e90fe600', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '8efc5e04011e067744b8bc8c0199b879', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '8f3a9b955c0a24e11f14d3fd01abdf8b', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '8f55ae116fedaae514fc9d8c18dfd4a8', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '8f69aa06b280130d38a18b42e8cd8fce', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '8fa15bf1cbe646d2b3cee9579fbf98bc', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '9017bc51e27227da82810d8fdb0335f9', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, '903f1c26cccadd98fcdd22a45e73cd87', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '908b225f7d02c6a72c673baf2ab2684b', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '90da4680bdf46f0a1f3b5148cdb29b24', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '90da4680bdf46f0a1f3b5148cdb29b24', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '9119f11139b3dc522974f6e62940e2d6', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '9119f11139b3dc522974f6e62940e2d6', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '91824644190561b50171a3b6019716cf', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '91824644190561b50171a3b6019716cf', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '91d4787057b4e5e7e390f88dac3547e7', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '92639a588ac9a0f7deec2da3a8ea2df2', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '9284966acbe3d39a6936b4dcb13f8e74', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '92c1334363bacdfe127dff02a22855bb', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '9313f1fce026ae76006319507f06f385', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111');
INSERT INTO `filter` (`id_fil`, `id_filsma_fil`, `id_fildef_fil`, `id_op_fil`, `id_in_fil`, `value_fil`, `label_fil`, `attach_fil`, `type_fil`) VALUES
(1, '93dce32b20c980efb90093af3ee62bf1', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '94a222927d6c2bf2e2f23665e93d60c6', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '9505d487c848c28338cd02eba33aca6c', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '951bbf2c96febc2c0ccecfff47503de4', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '95b6fbb0bfc619c969f1054900c73af0', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '95be738a74271210354640dc6819937e', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '95be738a74271210354640dc6819937e', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '95d78b9b38e833e1775a4d6a79a49c50', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '95d78b9b38e833e1775a4d6a79a49c50', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '968cbb04cb26ee4859acab3af20a7ad6', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '96b4079017bd844012d559172eea27c0', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '96d8e129f5f0675eabfd0b9ac03ad850', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '96f5ad52c81c00a60726d50c3b103cc0', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '96fb5b6a4201474b51eadcedf827bb26', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '97691d4994e011622fda2763bd09f006', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, '97691d4994e011622fda2763bd09f006', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, '97af53b95678e4fef152c983117bd0b1', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '97b71bcc7980f91946309057f1eee13a', 'p', 10, 5, 'ME>', 'mes pistes/mes pistés', 'OR', '111'),
(1, '97c9dead3ff77703b2ffb131b0dac1ca', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '97c9dead3ff77703b2ffb131b0dac1ca', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '9819b1adbf5969244782aad943bae177', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, '9819b1adbf5969244782aad943bae177', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, '982db73e6fa1da12dd7d2d787b8fdcb5', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '988d1a9e6f5c9cf21555b915fb2c4d29', 'l', 5, 7, '14083cf69ecad60e1e2cb90f64dcd56d', 'Tottenham (GB)', 'OR', '111'),
(1, '99c1f527903d053a964d4e175fecb40d', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '99db605e52b6e4b0709a52cd2f2ed39b', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '9a6f90c286d5f2b6c0e4a29054637489', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '9acb4ced693f3c52fbfda01ba2f26e80', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '9afd661de4c675814bfe176e645c3005', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '9b03c74441eaa7c9bdbf6c28bdfdc070', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '9b73bb01f0cdaa1b67618df7e8912f86', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '9bba652d0064d42bec14c617339eaeb3', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '9bba652d0064d42bec14c617339eaeb3', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '9bd01d9b45660a3188fcfb7429a69b30', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, '9c1c1e62a9349a8b3c2a2d44d49c0420', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '9c949263cb039ef810bca3a16d50e1c9', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '9cf0995decd59d9b4e0d18c81c4cb2e8', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, '9cf0995decd59d9b4e0d18c81c4cb2e8', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, '9d906ff27447aaadde9dbb40c1000a8b', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, '9dadd79d201efdc1bf08a44f0f487d06', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '9ded485172a8ef16a1f001a3f94989e8', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '9e6bda982157f8a953af72466447ddc8', 'c', 3, 1, '', '', 'OR', '111'),
(1, '9ecbef388f5cad5cdb9ac80433c83d6d', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, '9ef502fd254a381a899d7e466f1b7a73', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, '9f36c082c528281fd596459436d18af1', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, '9ff60286b4d28e30299805d09155bbb5', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'a00b77fe59c8fb98bc956872d8ede87f', 't', 3, 6, 'toto', 'toto', 'OR', '111'),
(1, 'a0a3a4e53f18d4bb705126dcffe5e271', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'a17170dad11c9d28e9ebc1ffc64894a6', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'a1a424ba8c77d5c741ce4ecaf6581f7e', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'a1a424ba8c77d5c741ce4ecaf6581f7e', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'a1d072629025a0048abe033f9f363628', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'a1d072629025a0048abe033f9f363628', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'a24c4f3c60575d772eea7754ecc5f04f', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'a24c4f3c60575d772eea7754ecc5f04f', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'a2c6c78195ec69c5cb4dd0fd92d36c19', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, 'a2dc11468049b30224e6e6a962caf57f', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'a2dc11468049b30224e6e6a962caf57f', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'a2eb8abc3438a2d85a688d10e366dc14', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'a39f48e0f84aa216f90549a72218e12f', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'a41e7845efa234e6dd7300def5642c7a', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'a41e7845efa234e6dd7300def5642c7a', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'a4928c4297deeb4166357cf80695d96e', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, 'a517d48ade2cb211f7483cf9f8ae87e5', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'a517d48ade2cb211f7483cf9f8ae87e5', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'a51ed186ea5c2bb7d1dc5d0268e5d05c', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, 'a51fac5cc5e72ac3076eaae391ab2445', 'c', 3, 1, '', '', 'OR', '111'),
(1, 'a5d0fb21dec7cf9404ff752cf291b2d1', 'p', 10, 5, 'ME>', 'mes pistes/mes pistés', 'OR', '111'),
(1, 'a659b555da0ae60ef5d5a8a317f41f2c', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, 'a6a62b03ee12fafcc9acf92a029a0058', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'a85b1e5fa64a7946a8ee7d884b491620', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'a85b1e5fa64a7946a8ee7d884b491620', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'a89af16a67cd2d24ab849ab487739021', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, 'a8b4924c00e61ba76a947af33f15062d', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'a8b4924c00e61ba76a947af33f15062d', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'a8e39b2a0d3d62bed7de638686d516d0', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'a8e39b2a0d3d62bed7de638686d516d0', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'a9166fe8c34e5a575573a8708aafbac1', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, 'a980437e719f97ec8ab634451e5d73f2', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'a980437e719f97ec8ab634451e5d73f2', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'a98b9fd5f8f240db275e4b1478518bae', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, 'a9c5eeafa2051096fcb0d1096f24f038', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'a9c5eeafa2051096fcb0d1096f24f038', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'AA', 'p', 10, 5, 'ME', 'moi', 'OR', '111'),
(1, 'aa99e275d794c3175464846a550011c3', 'c', 3, 1, '', '', 'OR', '111'),
(1, 'aaca172644547010ffa80b7ed58fb6bf', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'ab021622a67de1590ec7e6198a8c23a0', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, 'ab5a3beb40a18f75b22519640b0ca195', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, 'ab92e8a102ba7a66901ca370916a76d8', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, 'ac504b965bede9a8b255056495231c8b', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, 'ad8475f6291e8c0b02242d522a852cac', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, 'adac6265e9fe6641ecc7eac0d00baa91', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, 'ade632514d948f427a6c6e7bd58cdd8a', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, 'afb2ca0ef256bea33d6791620bc74e59', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'afb2ca0ef256bea33d6791620bc74e59', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'affb4075b143714be3a59c69e967a0d6', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'affb4075b143714be3a59c69e967a0d6', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'b07045d860777ecf7780afd8af856dd1', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'b07045d860777ecf7780afd8af856dd1', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'b07c6eaaa880163cbdf3dcb94279a76e', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'b07c6eaaa880163cbdf3dcb94279a76e', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'b0b75187c897ac29723927e75967c2a9', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'b0b75187c897ac29723927e75967c2a9', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'b21f4db42227a059d2d054e85bdd1dfa', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'b21f4db42227a059d2d054e85bdd1dfa', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'b2452c6153a126a73e071cdedbbf63be', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'b2452c6153a126a73e071cdedbbf63be', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'b2592d1aee1034b8cffe59e14329ee54', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, 'b286d1f90ad460e2194d5ce693dd52ec', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'b286d1f90ad460e2194d5ce693dd52ec', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'b2a2c7b81f167889640799f539e40156', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'b3053b3f08413b48a9ceeda90ea549be', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'b3053b3f08413b48a9ceeda90ea549be', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'b33e74554fa37e493d4b8945283235a1', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'b402f9f61500f0d162091756440b134e', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'b402f9f61500f0d162091756440b134e', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'b40e8a570605afaaa0e3b267e0ffbddd', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, 'b423b744b7192ba1cecc4b40bfeccfd1', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, 'b459de3ebc6093714d6d3f64cb5f7ea1', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'b459de3ebc6093714d6d3f64cb5f7ea1', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'b48dab5e20d51d5e27275d9f2eafebcc', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'b48dab5e20d51d5e27275d9f2eafebcc', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'b4a38dc95cc71f9aef79064620995a8d', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, 'b4a875506eabef3c23a666184219dda5', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'b4a875506eabef3c23a666184219dda5', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'b56a1d6612e73d696f050b87ef837412', 'p', 10, 5, 'ME>', 'mes pistes/mes pistés', 'OR', '111'),
(1, 'b5db79d5047c9666d481ed7cd8b26683', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'b5db79d5047c9666d481ed7cd8b26683', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'b5f804e476ab0c1eacde307a55e98655', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, 'b64ad00c2b59011288e6bd63b8409131', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'b64ad00c2b59011288e6bd63b8409131', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'b670b3d8dd1fa26f1292cf2e0ea02dda', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'b6aa9fa2e24e37ebddbf2390cc9c6966', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'b6b09d4485da304d01760ce2e730615e', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'b6f9dc6bffde7059346f71f8f3f6bcfb', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'b6f9dc6bffde7059346f71f8f3f6bcfb', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'b7037634d3514a1761b8768c0f64511e', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, 'b71719bd1437000048ef208f38abf3cb', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, 'b7337184017200be48f9770bc206aa0b', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, 'b73e85d5ded04c72806220dab373aa53', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, 'b87085ee9a27c4b39c6b1f2a0b286eb9', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, 'b97388ed7ce9378c0f030c28fc550be7', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'b97388ed7ce9378c0f030c28fc550be7', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'b9d817e3837f03c0210b4e4c1439429b', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, 'b9f7e2fc58284ab08a3fcb9058ddad47', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'b9f7e2fc58284ab08a3fcb9058ddad47', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'bab2bc35f4342bcbdd196f703a4d0e5e', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'bab2bc35f4342bcbdd196f703a4d0e5e', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'bab391f1c9c8696c343e19a97eb40d99', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, 'bb82e541d7f31ddefe89aba2d99a7a45', 'l', 5, 7, 'ec058c2f364b88af54daa4212cc66439', 'ZÃ¼rich (CH)', 'OR', '111'),
(1, 'bbbc59e2d785682707d95fcf577380e2', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, 'bbcdcdce9669ed380ecddd49ab3e0220', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'bbcdcdce9669ed380ecddd49ab3e0220', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'bbefd7483ae49c4cc40c4e6510ebc0f4', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'bcbd6bdfb9479d7b1197bf414de417a9', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, 'bd1892156e9a7f979e6df77190f9d90e', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, 'bd7f63a95d05cd6e4e79bc8013930417', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, 'bda5ab66ed7e4fdce1435be694504611', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, 'be4676c6f70c1ced8aed0db75433c56d', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, 'be4b777a631906e982786fb12df74e62', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, 'be874c913de20ff3955109ab8f7c2ac5', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'bed6862ad00535b0d664e3a101b774fb', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'bed6862ad00535b0d664e3a101b774fb', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'bf68e178873a7792ac4845f9ad73a8e6', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, 'c00df1d27a897dcfe8c53828f9414e86', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'c00f51881cd9bfb460617936223b1308', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'c00f51881cd9bfb460617936223b1308', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'c094a3d0ae36c2524a9150f5efff05d3', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'c094a3d0ae36c2524a9150f5efff05d3', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'c11b9fb058ef7baede6462933d9518ae', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'c11b9fb058ef7baede6462933d9518ae', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'c12d980aa1e75f50ba6d50cc38509cb1', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'c132cd2c7de4d7bd33c4b7fcf0b0db53', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, 'c173c7900029d86fd8a95c55faa77a33', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'c173c7900029d86fd8a95c55faa77a33', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'c1e96777190fb928442d8b7554a07e71', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'c1e96777190fb928442d8b7554a07e71', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'c214b87591a97e6c9a373b9d8769f2eb', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, 'c230cd6a0ca8a31e3a8305d9fc850765', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, 'c278963332bdb0af64ba54b1bb6210b2', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'c2e21749c7b980e8af3b74fd96dd5a90', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, 'c2ea34eff4c4c7cae839355fe88173a0', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'c2ea34eff4c4c7cae839355fe88173a0', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'c36b859dcefec9dfcb8be475439d560a', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, 'c38c05358363ffc9f82e851e10ba8112', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, 'c4746580ac5bde93cd1f2cf427f889da', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, 'c503a9ca25eeafe65a5fba5da13f6e60', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, 'c5059800b31d650831d45ca1815643fd', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, 'c550d79025a1c882f5811003c6962868', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'c550d79025a1c882f5811003c6962868', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'c588e91670c65fe296fcb52392118da5', 'l', 10, 5, '>ME<', 'à proximité', 'OR', '111'),
(1, 'c59d28e215a1459912ad56ffc8584313', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'c5fbce62fe52efb6c848ef510aa53859', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'c63a94f1dacfef891909e330134a8cbe', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'c6512ef748a1984b06832e8510a255e0', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, 'c6559c6f38fa2abf2f0ab965e9670915', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'c6559c6f38fa2abf2f0ab965e9670915', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'c681fc1f94bafb92c56ffda6864136e6', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'c681fc1f94bafb92c56ffda6864136e6', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'c6b1a731779a4daee4b89f0009a084aa', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, 'c750f56b6892234f81c0610099245bc1', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'c750f56b6892234f81c0610099245bc1', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'c78660c3dacf94a96dea60bc88fc854c', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, 'c83ae0f9e44ecc99525d4cefe976a25d', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'c83ae0f9e44ecc99525d4cefe976a25d', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'c873a06ed6257587308d17d2637db5ff', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, 'c95f7cc8c6c99bcfc2b8967d6beefd98', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'c9bdf368221f9cef98c25aacb7bdf889', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'c9e288b5139303d03c0c2ca9b66f1a2a', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, 'c9e5e93be43075c656ac325995f7fe24', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, 'ca21f8edc7fc5c94c31814f5ed3f93cf', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'ca9022cf0fb0ee682f0521e5e93bfbf1', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, 'caa44dde88e7b998032ae3454d6aad2f', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'cb370daf4bb8116f34d9954af6a845ab', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'CC', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, 'ccc2ad574a4633428b23ce0cbe33f8e0', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'ccc2ad574a4633428b23ce0cbe33f8e0', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'cd90d46af1239876717366b345157845', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'cd90d46af1239876717366b345157845', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'cdcbbd9f7612d8b3bf557216ea58f89b', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, 'ce3e9360561af57fed84a9192ff021d8', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, 'ce5f69fcd17668b78ed07526005d8afc', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'ce5f69fcd17668b78ed07526005d8afc', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'cea1c52e1f9c7001883d4f5148272175', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'cea1c52e1f9c7001883d4f5148272175', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'cf092ab862ab58538e0a5d46ab60f830', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'cf092ab862ab58538e0a5d46ab60f830', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'cf8677f18b50847e80df2d8ae1c1cd04', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'cf8677f18b50847e80df2d8ae1c1cd04', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'd007034565a839ea315a08edef42a1ee', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'd007034565a839ea315a08edef42a1ee', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'd01fd39dc4538d483c3e3fcca649c0f2', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, 'd0b54e4c99b646b5ef45c6735f017982', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'd0b54e4c99b646b5ef45c6735f017982', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'd0f9650f7c06af38a92b2da5c0505b9f', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, 'd123627aa6b7a6efc7af3e7d036e3c00', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, 'd18da5257a4e67101bbf0efe871fe84b', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'd1ba8899bb98786db062d9e07c2f70f7', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'd1ba8899bb98786db062d9e07c2f70f7', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'd267eab354b3c9d646b86b18a8b40e6f', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'd267eab354b3c9d646b86b18a8b40e6f', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'd2bf0f80e76cbba773b47e1884ae0c01', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'd3697e022393adc28b8a381f221bc4b3', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'd41cfed1685ec667619d18a9ad245e20', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, 'd46276a7579716d9f77284de97fb87db', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'd46276a7579716d9f77284de97fb87db', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'd48d75b513a13f8a1f32847cb00625de', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, 'd4e335878e03536d72c8f911c1145177', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, 'd591a1c2cd41aacd9512760a7f4456b4', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'd617627ab47d25221658cf4c10bfbec4', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'd6502a41d3651cc95de43c1e5dc2f87a', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'd6502a41d3651cc95de43c1e5dc2f87a', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'd6cb044fc6f45aaa1ec7d79f2b6846f4', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, 'd73558698a9f9b06c2b5dd5164a21f9f', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, 'd7624ec8c2d82eed8c65a6f93ff28c64', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'd7b951dd26c732354f0a4278b28559f8', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'd7b951dd26c732354f0a4278b28559f8', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'd7b9b784d65ccf2138a3f00197e14151', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'd7b9b784d65ccf2138a3f00197e14151', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'd812cc11b1c5f3a7b829c43999b037b2', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'd812cc11b1c5f3a7b829c43999b037b2', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'd82bfa274fd89eb9220dfe6219eb77af', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, 'd8bdd0a8136bfeaf4d9eaa56ed210f5e', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, 'd8ca30b7f2b928b97e0855ab3b3b8387', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, 'd90307b1336d87a525121e1121cc59f8', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, 'd97e77b2dc836fb534a99b968bc690ed', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'd97e77b2dc836fb534a99b968bc690ed', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'da743f66d381dcb543cf5d3e36b53fd8', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'da79f56fefe9e649368a3dbb712137bb', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'da79f56fefe9e649368a3dbb712137bb', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'da954a5ae3dfd5feb21f2e9a8d595a83', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, 'dabd007466743459ec406f7e3a0e55b7', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'dad072578421cdb8f0254f6bd5da4ab9', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'dad072578421cdb8f0254f6bd5da4ab9', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'daeec0abdd971bd4c036ef9277c4798a', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, 'db3b4fe097f22e87f0a5e96d0dc21b2c', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, 'dbdece88cdad2e674370738c344401e0', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'dc0cab5fc291d88dd2b5f0d4ad7c13dc', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, 'dc4b77f008a313abae6d583d5321b095', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'dc4b77f008a313abae6d583d5321b095', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'dc88e4588948bee1f45fa0174420108c', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'dc88e4588948bee1f45fa0174420108c', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'dccf15fa5398ef8dd5adba22f00b3d41', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, 'dd256d5b5f064c044f76d55ec8992698', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, 'dd4f232481bbb6959f0707a4fdfc758b', 'c', 3, 1, '', '', 'OR', '111'),
(1, 'dd9202919bf1e62a76816903053e6ecd', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, 'ddc3fa6715177a6828c0630cdcc92fb2', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, 'de8942a0e640d18c873bf5f7d106b03f', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'de932c9cb9fe69a1b0ec03ff20c4f759', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'deab1a25c3e0f2d9e91baa1843a5fb30', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'ded7ff6464f26cdb7478c650abbd9e49', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'dedaa2273370aaa3119572a6e392b0e9', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'dedaa2273370aaa3119572a6e392b0e9', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'df6dc00d0ed5ba590e7d26e19ce5cb5d', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, 'dfb1dcc60bff4e6699f940fe1f736326', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, 'e092dd0b0a9b17ddc1136616731ab26e', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, 'e0ea3f9419d27daa1e1846bf8424cfc6', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'e1595db8bc73722157aca40fc03edd91', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, 'e16215e8de28451c9b6740353c5ea6e6', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, 'e21589ff8495118dc8fa337fe3e6d65f', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, 'e233bb26fb2af558586f6e4b4d466cfd', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'e233bb26fb2af558586f6e4b4d466cfd', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'e27eb9de7e9918acabd22660dd4bb485', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'e27eb9de7e9918acabd22660dd4bb485', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'e32ce9ff1cca7039ab9941ecd152df39', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, 'e3a110cb22a2f88e8b02c90a22c0d813', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'e40057b51073b9d3a8d2e0951b40ec1c', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, 'e47eb5dc8e765725e7c85a1d0c6ca9ea', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'e47eb5dc8e765725e7c85a1d0c6ca9ea', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'e4ba283f6642a9c34691b61e0d865189', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, 'e528801c2cdc9a89f9fa1cc7daeb43fc', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'e528801c2cdc9a89f9fa1cc7daeb43fc', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'e5472062245cf016660b354ccc1500bd', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'e5472062245cf016660b354ccc1500bd', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'e5c36ccda0051ca897c1ad77289b799c', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'e5cd55e06f7cfb05b6afc5472693b6c0', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'e6f746df2552d53426a15150b38e4722', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'e6fa0dbddff24d83fd57d3454c1a5dbe', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'e6fa0dbddff24d83fd57d3454c1a5dbe', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'e76bfb68a8e6e99d1706ae9a2e590982', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, 'e780394ac4591880199706c860cc8256', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'e780394ac4591880199706c860cc8256', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'e7c5e295bf37fad26da6d978a1bde54b', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'e7c5e295bf37fad26da6d978a1bde54b', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'e829eea619ca8f139c114f2e8bd14280', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'e829eea619ca8f139c114f2e8bd14280', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'e84983bbce8c7494049fd0c560695494', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'e84983bbce8c7494049fd0c560695494', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'e89496b6dd92a97d19a38327dc370144', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'e8d4362995a3fab1ca4058240efbb62c', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'e8eea0abae1c2d62b8de8946caffc027', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'e96fdb71b9df94daebd5316a27688941', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'e96fdb71b9df94daebd5316a27688941', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'e9e765dd90be26623a5f2171d506d8f5', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'e9e765dd90be26623a5f2171d506d8f5', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'e9ff58a45e5401387861dfcf33a26765', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, 'ea47aa0c999a0cd08936030f79f6ed52', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, 'ea64aec12d56504e38e4717d5c6ea963', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, 'eaccd2c1a121792d1ad92097ed87b6ee', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, 'eaeea647dd7ce1e19a3cf15bfc37b5de', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, 'eb92af0d5c01e4d83bd4586e713ba99b', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'eb92af0d5c01e4d83bd4586e713ba99b', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'ec8dd1f6dfc9b7296d0d478650672a2b', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'ec8dd1f6dfc9b7296d0d478650672a2b', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'ed3b6dc3a1f5a30700b7191299aaa8e8', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'ed3b6dc3a1f5a30700b7191299aaa8e8', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'ed4824a2c507889eb3d52a14e7dd744d', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'ed4824a2c507889eb3d52a14e7dd744d', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'ed6e23b27f2a59c1eff1c2e56ad0367e', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'edd486ed665c69d232fd4b870d0d53b7', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'edd486ed665c69d232fd4b870d0d53b7', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'ede002be62c56b1ebed619633e5cf541', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'ede002be62c56b1ebed619633e5cf541', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'eeddec19b1e17e5ba1c04bc942e574ef', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'eeddec19b1e17e5ba1c04bc942e574ef', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'ef055636b2fec5bc6e11254d0d4e0810', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'ef055636b2fec5bc6e11254d0d4e0810', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'ef6fe2e08cce24eef93a907f7a7878eb', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'effe7ce0845d528f8581f41d96fd44e5', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'f069ab8e4fec742d54d4937f6dfb2fd7', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, 'f094ebe9810036a46f80f6a1841a6609', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'f094ebe9810036a46f80f6a1841a6609', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'f0f171b02ef72ccc6f584099cfc5ddd2', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'f0f171b02ef72ccc6f584099cfc5ddd2', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'f12ce28eac49247114aa7157c8c89b05', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'f12ce28eac49247114aa7157c8c89b05', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'f19d845635923d334eb6d5e8682bc87c', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, 'f1b8a9a9c9cc729f7073c6bf9f1a9c92', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'f1ded7c14ff26602a3c10cd9f0c76ec8', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'f1ded7c14ff26602a3c10cd9f0c76ec8', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'f20a7664ca319b6f8583f7a73af7c885', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'f20a7664ca319b6f8583f7a73af7c885', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'f35193614db802126d4ba3f697e48240', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, 'f3a9c97decda46b9462d30c43ad5d904', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, 'f3ffa02cf9d07ac6e77774dac7fa8823', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'f3ffa02cf9d07ac6e77774dac7fa8823', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'f47596f7a9fbd6cd71dacf6bd11561f6', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'f47596f7a9fbd6cd71dacf6bd11561f6', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'f481082c34105696b974a466f993b9ae', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, 'f49ba75f9c44769efbd694ef16dfd35e', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, 'f511600bb2ec8e8a040954052d502e1c', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, 'f5595e9c570e0f2074e9f03c2e0b3e1a', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, 'f564e6485c63618ac45e3910b3c576a9', 'p', 10, 5, 'ME>', 'mes pistes/mes pistÃ©s', 'OR', '111'),
(1, 'f5656bea0b59df690ad83ae14a526386', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'f5cb6c31a33fa658d6b3573d0f18732e', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'f5cb6c31a33fa658d6b3573d0f18732e', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'f6afe53339847b70c2efc4861c7df0f5', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, 'f716b47b992dbd0484f8fa7969ab5c66', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'f716b47b992dbd0484f8fa7969ab5c66', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'f79f97b9d409e0cde4f5c050c2503615', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'f79f97b9d409e0cde4f5c050c2503615', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'f803702bddd0a545985e2dbd92f3caa8', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, 'f810c14f4e3a01256b0771d61040e2d3', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'f810c14f4e3a01256b0771d61040e2d3', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'f8b69276a7e0db362e24dbe9a98580df', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'f8b69276a7e0db362e24dbe9a98580df', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'f8d1840dac182dd2a84a3dffbda2a5b1', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'f8e72e42debafb102b220c45c1149860', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'f8e72e42debafb102b220c45c1149860', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'f92fb852c616f48580b207f86457273a', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'f969fa5852718e04edf9074415da6004', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'f9fdce3f832cae6aab63171d8bc5eec6', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'fa4f5ce5014cf0cf26edb1d841078c58', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, 'fa537c899f784e843c17b8e632fed65f', 'c', 3, 1, '', '', 'OR', '111'),
(1, 'faedeb6488e550c0878780fa6919716a', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'faedeb6488e550c0878780fa6919716a', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'fb2e2aee404936cb844a5193c5aed9a0', 'p', 10, 5, 'ME', 'mes posts', 'OR', '111'),
(1, 'fb5cc2b99419a581c18d27b072534eae', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'fb5cc2b99419a581c18d27b072534eae', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'fb9a1bde184ad5c5d7b0fc17c15e0fde', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'fbb8443dcfaa9d6350551e4c9fb034a3', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'fbc7b65dfee68031d5a9ec96fedb6299', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'fbc7b65dfee68031d5a9ec96fedb6299', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'fbdcbe0afc27e7f72feaef9eb02bca50', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'fc4886dc6f0113a25d70b6829eb7c542', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'fc4886dc6f0113a25d70b6829eb7c542', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'fc73a09fe71eedab40de348ecbb3988b', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '011'),
(1, 'fc73a09fe71eedab40de348ecbb3988b', 'p', 10, 5, 'PRO', 'provider seul', 'OR', '100'),
(1, 'fc7a6f14fb1be90f21484285912ca18e', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'fcce3e9047d16d8de2be500ce7a933a2', 'l', 10, 5, '>ME<', 'Ã  proximitÃ©', 'OR', '111'),
(1, 'fd2119475caeb3e6eec630c3d6cb4e8f', 'p', 10, 5, '>ME', 'mes suiveurs', 'OR', '111'),
(1, 'fd4109346b46f965be7baf6e9a7fa41a', 't', 10, 5, 'MYS', 'mes services', 'OR', '001'),
(1, 'fd4109346b46f965be7baf6e9a7fa41a', 'p', 10, 5, 'MYS', 'mes services', 'OR', '110'),
(1, 'fdbaefad44ffd370fee04fc8c48bf840', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, 'fe42e5a618d32aedc4027343c349a1c1', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, 'fe5167be7afebf36ad46b57165f564d2', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'fe5167be7afebf36ad46b57165f564d2', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'ff0c1333dd60a704330dcce5949c8f4e', 'p', 10, 5, 'LIS', 'listening only', 'OR', '111'),
(1, 'ff113097c9a313e6a50a2edcbae1b223', 'p', 10, 5, 'ME>>', 'en collaboration', 'OR', '111'),
(1, 'ff2eb57eb4fb7a6fafec4e900be2e474', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'ff2eb57eb4fb7a6fafec4e900be2e474', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(1, 'ffa5ef58dd6626dd984fb15b8e7c58b1', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '011'),
(1, 'ffa5ef58dd6626dd984fb15b8e7c58b1', 'p', 10, 5, 'ASK', 'asker seul', 'OR', '100'),
(2, '4b44d27e4eff00a5129ed948c8112e6b', 'l', 5, 7, 'cc5e06b8c15ff0eb65fba33198f510f5', 'Paris (FR)', 'OR', '111');

-- --------------------------------------------------------

--
-- Table structure for table `filter_act`
--

CREATE TABLE `filter_act` (
  `id_filsma_filact` varchar(32) NOT NULL,
  `id_act_filact` varchar(32) NOT NULL,
  PRIMARY KEY (`id_filsma_filact`,`id_act_filact`),
  KEY `id_filsma_filact_1` (`id_filsma_filact`) USING BTREE,
  KEY `filter_act_ibfk_2` (`id_act_filact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filter_act`
--

INSERT INTO `filter_act` (`id_filsma_filact`, `id_act_filact`) VALUES
('0fb539e117382e00c5b83820cc3e4063', '41bacfe201c96a64d00980b29c2851ea'),
('0fb539e117382e00c5b83820cc3e4063', '65b33c7e7111728fa77533f1f74e0b18'),
('0fb539e117382e00c5b83820cc3e4063', '82f86c3ac00dba7f1982bbfd72374b0b'),
('0fb539e117382e00c5b83820cc3e4063', 'ed54c93c2d6cc83b0f7f092c15a2291a'),
('9e6bda982157f8a953af72466447ddc8', 'ee91b06daf243a32ade42abff1e289b1'),
('a51fac5cc5e72ac3076eaae391ab2445', 'e29997b7bdf894d341c05d1b6e0eed2a'),
('bb82e541d7f31ddefe89aba2d99a7a45', 'cf7091ba40f9506c73147d286492c410'),
('bb82e541d7f31ddefe89aba2d99a7a45', 'eb03307675a20dd75816ae10b803b190'),
('dd4f232481bbb6959f0707a4fdfc758b', 'b842a75c0218f60ff6d790f4a39ab7a5');

-- --------------------------------------------------------

--
-- Table structure for table `filter_def`
--

CREATE TABLE `filter_def` (
  `id_fildef` varchar(11) NOT NULL,
  `op_fildef` int(4) NOT NULL,
  `in_fildef` int(4) NOT NULL,
  `type_fildef` enum('ACT','USR') DEFAULT NULL,
  PRIMARY KEY (`in_fildef`,`op_fildef`,`id_fildef`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filter_def`
--

INSERT INTO `filter_def` (`id_fildef`, `op_fildef`, `in_fildef`, `type_fildef`) VALUES
('c', 3, 1, NULL),
('c', 4, 1, NULL),
('d', 6, 3, NULL),
('d', 7, 3, NULL),
('d', 8, 4, NULL),
('p', 10, 5, NULL),
('p', 11, 5, NULL),
('t', 3, 6, NULL),
('t', 4, 6, NULL),
('l', 5, 7, NULL),
('l', 8, 7, NULL),
('s', 3, 9, NULL),
('s', 4, 9, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `filter_smart`
--

CREATE TABLE `filter_smart` (
  `id_filsma` varchar(32) NOT NULL DEFAULT '',
  `type_filsma` char(3) NOT NULL DEFAULT '011' COMMENT '''USR'',''ACT'',''ASK''',
  `id_user_filsma` varchar(32) NOT NULL DEFAULT '',
  `alias_filsma` varchar(50) NOT NULL,
  `sequence_filsma` varchar(200) NOT NULL,
  `style_filsma` varchar(200) NOT NULL,
  `access_filsma` int(1) NOT NULL DEFAULT '0',
  `active_filsma` int(1) NOT NULL DEFAULT '0',
  `order_filsma` int(11) NOT NULL,
  PRIMARY KEY (`id_filsma`,`id_user_filsma`,`type_filsma`),
  KEY `id_user_filsma` (`id_user_filsma`),
  KEY `type_fil` (`type_filsma`),
  KEY `order_filsma` (`order_filsma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filter_smart`
--

INSERT INTO `filter_smart` (`id_filsma`, `type_filsma`, `id_user_filsma`, `alias_filsma`, `sequence_filsma`, `style_filsma`, `access_filsma`, `active_filsma`, `order_filsma`) VALUES
('0149e6da273464fc163020f107620a33', '111', '41f48906262cfad9b4c41613ffcc6cb0', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('01a64c073dac1393f8d779b82be861a5', '111', '687c9e9af6d058338b2af10b93a4e596', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('01dce4f5fad528d1bed7bb92cc2f4c5b', '111', 'c4526b59464e976ddadd71a78e13453e', 'AL=ALL', '', '', -3, 0, 4),
('027f6e00fb2b4b206b654d0cfef0b65b', '111', '3acb3e030860b5ac415d226b9907d0e7', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('02c34672915e2417bfd6a4b8402ee1a3', '111', 'a3cefde48284f70b2098d7015e987148', 'SRV=MY_SERVICES', '#1', '', -2, 0, 2),
('02ca235cbebe9a251dd2c4f285c360a9', '111', '7d6653aaa16976e12b6cf7c774f83c1f', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('034405bff40a911ee90f0a6155ea16bd', '111', 'db63cb36f363ff16141f9893a0590683', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('0382595b313131bfcafc626587cc21dd', '111', 'a6b43a385c41704ec881291e7ac5d889', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('03e84c5f819d999a34d7ab4b94498af8', '', '7d6653aaa16976e12b6cf7c774f83c1f', 'titi', '#1', '', 0, 0, 0),
('0412a8ebc296397a7335dad51e2643c9', 'USR', '7d6653aaa16976e12b6cf7c774f83c1f', 'titi', '#1', '', 0, 0, 0),
('04330f7242fce65e7d8d66774a3e9951', '111', 'ffc2fbe41eb237d7e9dd25d974185119', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('0433b51b2cbeb8a8d720d5b85084e802', '111', 'db63cb36f363ff16141f9893a0590683', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('043445b86abbdf47e3d850d3dacf34f1', '111', 'fb9683c61faae7377daa18a3a30ffe1d', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('04b916f14ff6fae2d090c2bb9ec88291', '111', '00c28b25326d55eeb28a5ced60a51925', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('050a73e2213b06963f80bf9a63dab31e', '111', '2116684d8de4ecf5cf21d4c6ad668f98', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('050c55cbaf2debb3b57f2995f1be73cf', '111', 'a3cefde48284f70b2098d7015e987148', 'AL=ALL', '', '', -3, 0, 4),
('0531bb6e47d8ffd761bb75b5cbf08f94', '111', '63e6f927fffd663cf6c29323c39ceffd', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('057c2cad40f02e7a0812966758f3a55e', '111', '40a43df941ecc410777728437cd60fe3', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('058da87894eba8e48ceaf6d87c1d9a79', '111', 'e1cf51966342cda9d6d505dff4e2a50a', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('06068ad0bbe2ce0ac40fe5ff2e6c7f27', '111', 'bdb232ba42790154368b26cd87123485', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('064b0026e2a662dac1a964487f21bb3b', '111', '0fbef09a987b7a2f6f5aad18a31a5c43', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('06cefa94478ecd34a60235618d1ae08c', '111', '73e31667472c841d31b679f9683dab6f', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('06e460424329bd192eaa817cd8d3aa0c', '111', '5fb94b57d704fa3bb4bbe279634c757c', 'AL=ALL', '', '', -3, 0, 4),
('076bc85591a27dd8fdf3519b29a1c01a', '111', 'a0e2839bbd082ad194f217d364e5a4df', 'AL=ALL', '', '', -3, 0, 4),
('07b593bfc1da998d9751b6f95e8ffbb6', '111', '053e1c1062668611cc02ab393ad000fd', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('07cf27a29dedb5ddb333c2fa843e7060', '111', '66283ee137504a410c2c40a3426770e5', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('082573e20d78f29737470c087da83ca8', '111', 'a3cefde48284f70b2098d7015e987148', 'CC=MY_COLLS', '#1', '', -1, 0, 4),
('08ad3dc033023f63d506a65ab5f0f32a', '111', '37814d93e823ef15861dce164db4cb7d', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('08b34a9a6c74b01d6935462ee2542e04', '111', 'f5ec6bf1ccac85ed3fdd7ba5874f46e3', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('0919411db3ea2ff1bc1eae0660c43e67', '111', '9dc4cd2d6c07049b21ccb1b21bfadbf8', 'AL=ALL', '', '', -3, 0, 4),
('09b8879bb164945e9009a7808c2b3d83', '111', '00c28b25326d55eeb28a5ced60a51925', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('0a6ad6b5f342c8ca5c6600d27f99b565', '111', 'a0e2839bbd082ad194f217d364e5a4df', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('0a72b10b0e3f2958e428c5cc72a47bc2', '111', 'e04541f717da39b450f4155282287e77', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('0aadc747a5517e3ae42a2eaf8b729413', '111', '871aafc5183b46241b988e1ae13f3501', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 3),
('0ae678a427de5b6c36db714c7d6f1a69', '111', 'c4526b59464e976ddadd71a78e13453e', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('0af330bbd7b8734e332cbfe2d4d01397', '111', 'f5ec6bf1ccac85ed3fdd7ba5874f46e3', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('0c41358fa1335f978d40df0cb49454ca', '111', '178cd2f3df2d88613b46bb6e96a77f3a', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 3),
('0d51fe5782799b66d2a089aeb4a2acfe', '111', 'e1cf51966342cda9d6d505dff4e2a50a', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('0d891a641390d88cccda90baa304adad', '111', 'c3471df50ab74b88119f5c7d5327131d', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('0db283151508f927ad2596e47864238f', '111', '586671f519ce766cc5bfaffe8c4c0963', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('0dcbdf3b38adce34f189df1d20e70c0e', '111', '9db5b63f3418f6e2a3092b8dea45b530', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('0e407dac4367665662004c803a341f83', '111', '97b2c140029b110a0b9dc00a7bd4481a', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('0e46b9b91c83b9e42920edabeb4e7d09', '111', 'ed951d57987e6b7c195ce0ba7d4729d6', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('0e774985f6ff6073b00248aee30df175', '111', '09cdd8739a3bc234ad974818e3a67c31', 'AL=ALL', '', '', -3, 0, 4),
('0eaf5cc7858913a44fac4d462ebef1ce', '111', '63e6f927fffd663cf6c29323c39ceffd', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('0f2096ada30a8b3948e8fb6427553d18', '111', '0cb6a9fe5ecbce4fdd89aa56e1fe5ac5', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('0f388e22d5f5e1a469e917e25ef4706f', '111', '871aafc5183b46241b988e1ae13f3501', 'LIS=LISTENING', '#1', '', -2, 0, 5),
('0f3f59e0b85c2f28b08808851f527fa1', '111', '5a6097a8f128c86769da4e977927a78d', 'SRV=MY_SERVICES', '#1', '', -2, 0, 2),
('0f5519aafc0058d45b56b42f862c63ea', '111', '03df626059c3430fb7316bcca108beb3', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('0f6bff4a79d876b197c813477308b471', '111', 'a3cefde48284f70b2098d7015e987148', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('0f6d8f1d45ae51133df4e29986035ea4', '111', '1b5d5518c800d0929e8d072ff556638b', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('0f8f57f5d2cd739f9b358bd951edca84', '111', 'fb9683c61faae7377daa18a3a30ffe1d', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('0f9d16407688482dc68f6fe5136791e8', '111', 'db63cb36f363ff16141f9893a0590683', 'AL=ALL', '', '', -3, 0, 4),
('0fac92e94335bd15c4dd9118c684ca55', '111', '1dd06812b3511f17e047e96d61f66106', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('0fb539e117382e00c5b83820cc3e4063', '.1.', '7d6653aaa16976e12b6cf7c774f83c1f', 'toto', '#1', '', 0, 0, 0),
('101491963e00ff10c0339d20219645c1', '111', 'a6b43a385c41704ec881291e7ac5d889', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('1033092492d39baeff5ea3f06436cb11', '111', '1d7ce9781d74c05bc3782f4c06eabdcd', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('10e33b16a003d7f8ac5705cb7caac1e2', '111', '63e6f927fffd663cf6c29323c39ceffd', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('1342288b03fd288fa53490fa40529a25', '111', 'bdb232ba42790154368b26cd87123485', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('13ed5dd7fde4a41e33ad26d90c4b31db', '111', '3af1b9d33a52f996f4542d3eb2c9c4a6', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('141262a9486cfc00e4faf7d05c172809', '111', '33fba81e5307a519b225c97c018ebb80', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('141fd71349ecdfac06e2408ad7b18c94', '111', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('155f836c56bbd253dc8c28cfebbf1d9b', '111', '73e31667472c841d31b679f9683dab6f', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('155fcf617235be4cbad36f07d4568c15', '111', '86703a439447287a739e3600a3669d29', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('156a5fbcfb19a60af1927fa0cce6d50c', '111', 'a3ab9fc930381fe666d8a1a7cf1035de', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('1576216adce8608f4ace3ce5cc863bf5', '111', '7c36b9595f48cba88c52edeeee42af8d', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('15a3fd518a428bd17f7c3c053d3f98e6', '111', 'fb9683c61faae7377daa18a3a30ffe1d', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('15edb2f0418604787b1890e5001a79ff', '111', '5a6097a8f128c86769da4e977927a78d', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('160ba498388b12e1b4eeac3dc42720db', '111', 'a530b55030587b46519449c39181d1b8', 'XXX=NEARBY', '#1', '', -2, 1, 1),
('160f37df7553072d5f5c3848dff6beee', '111', 'a6b43a385c41704ec881291e7ac5d889', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('16fb69258074b7bb40f8ce282c7783bf', '111', 'ce8e22375753b799f049231ed83562a1', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('1706e8b6cad1e0bdd1ef48a65275ad62', '111', '3acb3e030860b5ac415d226b9907d0e7', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('17d7641fee55d80a4706990cc7474913', '111', 'da6eb119a5946651373257deb33848c7', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('180976a604b5c6db3417cf001a3fd979', '111', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'SRV=MY_SERVICES', '#1', '', -2, 0, 2),
('1866f429bd560f4e0ce7350eb8248dbc', '111', '37814d93e823ef15861dce164db4cb7d', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('18f4b430c1f20b3133ea2e2e60ef73d1', '111', 'd4b41947b67949fed02d6456c341e98d', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('18fc7fb4174b0de62020aea06644fdf6', '111', '1df9e06e56cdc06289a2068cf52cd611', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('1901720362eaeda88cc6c4ca3f96452d', '111', 'e04541f717da39b450f4155282287e77', 'AL=ALL', '', '', -3, 0, 4),
('197e68ca29edb404c851fecf19fba871', '111', '756a38308099191deffe566cc572d1ea', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('19edf639c69c4455d9c6f59398b10d55', '111', 'bf9e70e37e759e2a53a7e8b7191b3c8b', 'AL=ALL', '', '', -3, 0, 4),
('19f57565b7ed50d386d74d3650f20362', '111', 'e1cf51966342cda9d6d505dff4e2a50a', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('1a03bf9781a9df7cdd56ebe3c6d60e27', '111', '6c3c85ad3057f142d3aa7f34bbe7bbb1', 'AL=ALL', '', '', -3, 0, 4),
('1a1df33b0934168821668840b61de845', '111', '6c3c85ad3057f142d3aa7f34bbe7bbb1', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('1b4b5e418a5d0d7a9cec5e426b18ae92', '111', '178cd2f3df2d88613b46bb6e96a77f3a', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('1b8666b62b8f3f235c5f8494e97bb272', '111', 'd6c71a2943a2a206a8397c7d2756bac7', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('1c23b890e4012441605dd1a7d410d50a', '111', 'd1f254057a12848c8ac453d752a4a51b', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('1cb4011edf3a593a4857e405532c949a', '111', 'ae510ee1e62c1fd7f0235bc13ae89cf1', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('1d0580b6c945b6c37d4335c755495e18', '111', '894b122ddbc96e7048df42f5a4e7e807', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('1e0f810131f91bf01ceb2b01e819a973', '111', '941af2c99f4f7895b481ab9c3261e4ee', 'CC=MY_COLLS', '#1', '', -1, 0, 4),
('1e1b861ae986f91b55b0306b8316d150', '111', 'e1aa4f724cf384a08db7674e2d834495', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('1e2e4719a70659ec4925edc8f373f445', '111', '601ad00ff3fd3fbe976ec083282f6785', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('1e328ad9c960988296618f3a1fede148', '111', '03df626059c3430fb7316bcca108beb3', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('1f70a92660a6c0946acf0268d1ab75af', '111', '9db5b63f3418f6e2a3092b8dea45b530', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('1fb48c90b730d336e74bc0ba356e50ce', '111', 'd0d086686399ca9e71b9e941f672e0c7', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('20276d6cd98d7142f6deb0d293f2aa9f', '111', 'f5ec6bf1ccac85ed3fdd7ba5874f46e3', 'AL=ALL', '', '', -3, 0, 4),
('2046aa099043081cef012733b51d6aa0', '111', 'a3ab9fc930381fe666d8a1a7cf1035de', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('208f3d1d24649deb7f6ddadd660335f5', '111', '2116684d8de4ecf5cf21d4c6ad668f98', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('20aabce5fc98d468da8319d485640e5b', '111', 'fb9683c61faae7377daa18a3a30ffe1d', 'AL=ALL', '', '', -3, 0, 4),
('20d1279ec49fbf189eec983cfb3dffdf', '111', 'b039e473e2ddc2af6a2e045dde934913', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('210773f4cc1ba498bb463cfb0683185c', '111', '894b122ddbc96e7048df42f5a4e7e807', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('217663771c7c3040a46674457b89a9d9', '111', '97b2c140029b110a0b9dc00a7bd4481a', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('21b15c5b52af11d8925c24335d307c51', '111', 'd090b2fecfda936d0c6bb16eade51d8f', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('220ecebc51e849d1431e04dd40bc1dd2', '111', 'e8f894a87f4ee15835cfd6eede3119c6', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('22456caf3d60530355247615fa2f901f', '111', '586671f519ce766cc5bfaffe8c4c0963', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('228b64be987e3e251e284ee4f31f02a4', '111', '1b5d5518c800d0929e8d072ff556638b', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('23a75ffa6908bfc6978abb00f79cd433', '111', '1b5d5518c800d0929e8d072ff556638b', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('24298b3561362ec2c0c8d6f3d434530f', '111', 'e1aa4f724cf384a08db7674e2d834495', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('24e0dac262249ac1eb4011d986d0e73f', '111', '941af2c99f4f7895b481ab9c3261e4ee', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 3),
('255f12899645afd385d6a043e82b8cc5', '111', 'd1f254057a12848c8ac453d752a4a51b', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('25a8f0df03986e69faf7cd64ca24c918', '111', '00', 'AL=ALL', '', '', -3, 0, 4),
('25db85f9dff41266afeea86b3102ab2a', '111', 'b039e473e2ddc2af6a2e045dde934913', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('25f825608419a8302ee422a96dfb4143', '111', 'd5499164a40b3cd4bdbcdc3de63f5dd7', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('26521531e825135c28bc1d60e14262a5', '111', 'd45e4bc08f17fb3d692394c277e60281', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('2723c32722b04500c663f26f2a5ee0fc', '111', 'c4526b59464e976ddadd71a78e13453e', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('272e7ad4572ef7267e557db6d2bbc9a9', '111', 'd45e4bc08f17fb3d692394c277e60281', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('2768a609f5cc5509b213bbb42bf389dc', '111', 'c4526b59464e976ddadd71a78e13453e', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('27ab6782fcb72498f341c9c670c66f69', '111', 'a3ab9fc930381fe666d8a1a7cf1035de', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('281adb87caefb55c1d5c9e97017b39d8', '111', '0bbb73aee8d860d39c05663c10e55bc8', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('281cbe23c2092355444c4eda7ccc9ad9', '111', '7d6653aaa16976e12b6cf7c774f83c1f', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('2886231edc04af708c4ccd5a76f9ebdc', '111', '7c7840226f4667662ed0c0ffac20474a', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('28e0bbe04f1a2b32132ed66ea7d90993', '111', '09cdd8739a3bc234ad974818e3a67c31', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('2935acaa807d0ddc184440f8dbe1006f', '111', '687c9e9af6d058338b2af10b93a4e596', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('2945e3b95a55fd56bda0eb4c7c2c1bcd', '111', 'd5499164a40b3cd4bdbcdc3de63f5dd7', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('29622a9b2ae2b5b3a8306102d8ccdeaa', '111', '03df626059c3430fb7316bcca108beb3', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('2aba6f1fe0cb850ec4fe769ca7c83919', '111', 'da6eb119a5946651373257deb33848c7', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('2b0c9ab36f46fff3ebafccce85003090', '111', '3318afc1fce28f4e567658e60fec9da2', 'AL=ALL', '', '', -3, 0, 4),
('2c0e8af22ae99b663d3be79ecc7d1b4f', '111', '9db5b63f3418f6e2a3092b8dea45b530', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('2c724c888cf3e1e08b5dc74994c58efd', '111', '1dd06812b3511f17e047e96d61f66106', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('2c73ffe77a56248e19b4d4ab462c16e9', '111', 'e8f894a87f4ee15835cfd6eede3119c6', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('2d03109fb1664fddf0216c15a8d635c3', '111', '37814d93e823ef15861dce164db4cb7d', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('2d253d6280928698b65768ab2127171a', '111', '1df9e06e56cdc06289a2068cf52cd611', 'CC=MY_COLLS', '#1', '', -1, 1, 4),
('2d5826f8ecc3d96e31677d15ce843482', '111', '7c7840226f4667662ed0c0ffac20474a', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('2dc21a9e115f8678c851d073f16a04b9', '111', 'd45e4bc08f17fb3d692394c277e60281', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('2e29fb53486f5e1519fe0dcf75435ab1', '111', '5fb94b57d704fa3bb4bbe279634c757c', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('2ed093702247ae932c894b9587132bb9', '111', '41f48906262cfad9b4c41613ffcc6cb0', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('2ef09f2c536320b1b89e0171c521dc51', '111', '687c9e9af6d058338b2af10b93a4e596', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('2f0770af50140073ba13ef25cd6044d2', '111', 'd090b2fecfda936d0c6bb16eade51d8f', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('2f3efc1450e3cac85ad5abf0b23f2783', '111', '841ef8a50591e500450e46b20f0071cd', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('2f52a7acded569344972f6ea8fdcb8ec', '111', '41f48906262cfad9b4c41613ffcc6cb0', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('3032a00b5d06b1cdce81123c26f64f78', '111', '5fb94b57d704fa3bb4bbe279634c757c', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('304e9e8b2f4b9374a8630c53cb464114', '111', '3318afc1fce28f4e567658e60fec9da2', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('3069b81f1f5000a80f8eb357fd192af9', '111', 'd6c71a2943a2a206a8397c7d2756bac7', 'AL=ALL', '', '', -3, 0, 4),
('3173ae055b364c4e23ecbf71c28744e8', '111', '11b25d42972af71f6b9c3c3466b81100', 'AL=ALL', '', '', -3, 0, 4),
('31d9008e9f38b5465a204bf879a2fe4e', '111', 'fb9683c61faae7377daa18a3a30ffe1d', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('31e605306b8073291e7ef40eaa9fb4bd', '111', '0bbb73aee8d860d39c05663c10e55bc8', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('320f74f02b5010f7c1bd958a77c24ef0', '111', '5fb94b57d704fa3bb4bbe279634c757c', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('32226b9be40f00855c5143aa0ecf4e93', '111', '9dc4cd2d6c07049b21ccb1b21bfadbf8', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('32c9d61146e1b440b277662c7ebf69e5', '111', 'bf9e70e37e759e2a53a7e8b7191b3c8b', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('3340597157e4877cbf3f5da6799522fb', '111', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'FF=MY_PISTS', '#1', '', -1, 0, 2),
('34445272920414f1f8920f0e6eb5a822', '111', '5a6097a8f128c86769da4e977927a78d', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('3474d4fad5c3b1533f8684292b62347e', '111', '3af1b9d33a52f996f4542d3eb2c9c4a6', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('34d9350ee17307fdc1f25cdfe6f0562e', '111', 'ae510ee1e62c1fd7f0235bc13ae89cf1', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('34f8a78244d82b5a17977404eb6f7a82', '111', 'b039e473e2ddc2af6a2e045dde934913', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('356712387b92765bc43bfccf600c5816', '111', '616389b89c369c591118fd7e3014fd69', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('358493edd70f7783071024bf623bc83b', '111', 'fb9683c61faae7377daa18a3a30ffe1d', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('35b9f758c221177dc98dd8717088e7ec', '111', 'e1aa4f724cf384a08db7674e2d834495', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('35cc00de08e454b3a3aa83a0ae3f0f8f', '111', '37814d93e823ef15861dce164db4cb7d', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('362ed13ca368d87c437004b251510b98', '111', '86703a439447287a739e3600a3669d29', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('3640152cf49519bbed2f68f4fb6ec325', 'USR', '7d6653aaa16976e12b6cf7c774f83c1f', 'erewr', '#1', '', 0, 0, 0),
('368b2042cf62c3dcc99c2157464da6fa', '111', '0fbef09a987b7a2f6f5aad18a31a5c43', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 3),
('36918740527665cd9c2893846449479b', '111', '0cb6a9fe5ecbce4fdd89aa56e1fe5ac5', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('36f4d84dc7d8bf36d1c31d2733de6392', '111', '053e1c1062668611cc02ab393ad000fd', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('372113319e73dbfedfa523bb71335152', '111', 'a530b55030587b46519449c39181d1b8', 'LIS=LISTENING', '#1', '', -2, 0, 5),
('3724d0028d21df522edc453a54e3edb2', '111', '97b2c140029b110a0b9dc00a7bd4481a', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('3729519c8ff0930c3dca390523a82cf5', '111', '586671f519ce766cc5bfaffe8c4c0963', 'AL=ALL', '', '', -3, 0, 4),
('37300f611c410c54d4e9da210867e1a4', '111', '41f48906262cfad9b4c41613ffcc6cb0', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('37ce8c57dae7ef74228bb29c6f8f4944', '111', 'd1f254057a12848c8ac453d752a4a51b', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('3815cb35374d6ca19b42c02921e976e8', '111', '73e31667472c841d31b679f9683dab6f', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('381f60c5781328270406e06df801a671', '111', 'bd555337d5de7f75b9dba538f5e6d2b2', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('385aefea2c047783cfc7294d0aa206b2', '111', 'bdb232ba42790154368b26cd87123485', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('385cf051ab183243439af737b7c5c9e3', '111', '33fba81e5307a519b225c97c018ebb80', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('38c078af9f432cec0472a9e231714908', '111', '66283ee137504a410c2c40a3426770e5', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('39570aa8f440a253a8bdf953d2e49928', '111', 'e225f8ac45bc47c938af4e683320b1f9', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('398160cab406654e18359d4069cbc1a1', '111', 'a530b55030587b46519449c39181d1b8', 'FF=MY_PISTS', '#1', '', -1, 0, 2),
('39d502ed0a99ff7aa33cb0b7a4fa6b65', '111', '79b1b9dc1b338006650c78d3b4919b04', 'FF=MY_PISTS', '#1', '', -1, 0, 2),
('3a0ce02a39a177579e469c6d3380c477', '111', '2116684d8de4ecf5cf21d4c6ad668f98', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('3aefd7158f1c397ec50a016df802c819', '111', '11b25d42972af71f6b9c3c3466b81100', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('3af6ee3befd51fc00fa062f55327284d', '111', '687c9e9af6d058338b2af10b93a4e596', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('3b0ff7e68e18d0d272fe7412e6a8e5b3', '111', 'c4526b59464e976ddadd71a78e13453e', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('3b2ff9b98cac5f325aaa0d115634fb0b', '111', '3318afc1fce28f4e567658e60fec9da2', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('3bbc6d78d9d12df5e58906d2a96c4d81', '111', '5fb94b57d704fa3bb4bbe279634c757c', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('3bbd643833fb6a73d7bf1929e66e1a36', '111', '601ad00ff3fd3fbe976ec083282f6785', 'AL=ALL', '', '', -3, 0, 4),
('3bc889843fa55062e993740200327aee', '111', '756a38308099191deffe566cc572d1ea', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('3cf44a2e0c81f7e701322a82a56c8b63', '111', 'db63cb36f363ff16141f9893a0590683', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('3d6b01fddabf00b07bf865065fc42708', '111', 'ce8e22375753b799f049231ed83562a1', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('3d7c782f83977cde0cfa0b32319d2912', '111', '1dd06812b3511f17e047e96d61f66106', 'AL=ALL', '', '', -3, 0, 4),
('3e8f8efd6766aaf756b6fbf8f22f2613', '111', '894b122ddbc96e7048df42f5a4e7e807', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('3e948993059f71b104fc78abd1c66231', '111', '616389b89c369c591118fd7e3014fd69', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('3e9b7cba9d7871b96d89d5289b04d154', '111', '7d6653aaa16976e12b6cf7c774f83c1f', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('3ebb5715d8b6fcaa233f27f0d7062b28', '111', 'db63cb36f363ff16141f9893a0590683', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('3ec3dc62825934531a110e6e7dae326e', '111', '0fbef09a987b7a2f6f5aad18a31a5c43', 'CC=MY_COLLS', '#1', '', -1, 1, 4),
('3ef250b126ed008eb2e88c53bd654dd6', '', '7d6653aaa16976e12b6cf7c774f83c1f', 'toto', '#1', '', 0, 0, 0),
('3f287792dc383ecf15f644a1f7875206', '111', '33fba81e5307a519b225c97c018ebb80', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('3f60615e4283f3cc4bfce81da18cdb0e', '111', '1d7ce9781d74c05bc3782f4c06eabdcd', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('3fc8ccf1c31940d438bec2d00ba748c8', '111', 'd090b2fecfda936d0c6bb16eade51d8f', 'AL=ALL', '', '', -3, 0, 4),
('3ff5285ea1c4e8ca6d0ed68c213bbdef', '111', '133a86ce8a41daeff7bf37f618ef770d', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('400bc169b7b8409ad9a792279f204fd1', '111', '3acb3e030860b5ac415d226b9907d0e7', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('40c12f46329741bbe2dd969f9c80c163', '111', '7c36b9595f48cba88c52edeeee42af8d', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('40dcdf946347b0fabe54c67b2546a16e', '111', 'd4b41947b67949fed02d6456c341e98d', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('418bce2bebda75538d60708458b0c557', '111', '11b25d42972af71f6b9c3c3466b81100', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('418f55677f9566069f223c9f766c24e5', '111', 'bd555337d5de7f75b9dba538f5e6d2b2', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('41f0e43aa82b271ab7eef3e8f0342316', '111', '79b1b9dc1b338006650c78d3b4919b04', 'AL=ALL', '', '', -3, 0, 4),
('422130206f62afd410a8069a43062edd', '111', 'e1cf51966342cda9d6d505dff4e2a50a', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('427f41a498bad5de050147aadd8f0afc', '111', '756a38308099191deffe566cc572d1ea', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('42d44f34c6dd79a23697508c621a547e', '111', '3af1b9d33a52f996f4542d3eb2c9c4a6', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('42e834635af220f84dc86a90369faf9f', '111', '601ad00ff3fd3fbe976ec083282f6785', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('4327a0de96c70129899d11b0cdc8b79d', '111', 'd45e4bc08f17fb3d692394c277e60281', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('43b46d185fe61464ee454b0594ce7f75', '111', '6c3c85ad3057f142d3aa7f34bbe7bbb1', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('443e62c5a6b37e1a0883c645726c41b6', '111', 'ffc2fbe41eb237d7e9dd25d974185119', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('4549d120d0b2597919c53fdbe9048d78', '111', '00', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('45959234f553b6b48b9dd5b7b72df178', '111', 'a6b43a385c41704ec881291e7ac5d889', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('46a4a72c684bb61ee8573bccbe7eef1e', '111', 'ce8e22375753b799f049231ed83562a1', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('4719c4c82677f6a4b6b1c91afdd8b2e5', '111', 'c002af25af2ff1c0466f8c70f549b0af', 'AL=ALL', '', '', -3, 0, 4),
('473f539252195dd4bc1be8df4b73a894', '111', 'bd555337d5de7f75b9dba538f5e6d2b2', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('474d17f928d443f3a56e6d328a3b6fbf', '111', 'c4526b59464e976ddadd71a78e13453e', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('47b6fe9aa1d94d3710be4b14280bce5e', '111', '0bbb73aee8d860d39c05663c10e55bc8', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('47f9446de662f1460654119300963107', '111', '871aafc5183b46241b988e1ae13f3501', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('48a0dd4a0e7b20aeeac098d1cd577949', '111', 'e04541f717da39b450f4155282287e77', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('4a059814fbabd9a7c8d661316c60c1a2', '111', '86703a439447287a739e3600a3669d29', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('4a13e9dcbfdcd935f86912463a40cc59', '111', '3acb3e030860b5ac415d226b9907d0e7', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('4ac1620a3eedbec88f0607e22f3ab79c', '111', '09cdd8739a3bc234ad974818e3a67c31', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('4c3dc8e57f31e03121021833b89d4d9d', '111', '0cb6a9fe5ecbce4fdd89aa56e1fe5ac5', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('4c460cd58c1efbc5e08a4fec64ad6c4d', '111', 'c002af25af2ff1c0466f8c70f549b0af', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('4c4870ead0440ca15b5eb659450ce7cb', '111', 'a3ab9fc930381fe666d8a1a7cf1035de', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('4cca243eb0e89866acd3c6526e0f6596', '111', '3318afc1fce28f4e567658e60fec9da2', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('4cdd25127cb8147e688c4e4859a84b72', '111', 'd090b2fecfda936d0c6bb16eade51d8f', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('4ce253ecf4f52f7980375fd6b9566c01', '111', 'bf9e70e37e759e2a53a7e8b7191b3c8b', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('4d4b7e4886e2cef55a96cbe2f443e7ef', '111', '00', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('4df32c0e060d9a7aeefae27488f73626', '111', '0cb6a9fe5ecbce4fdd89aa56e1fe5ac5', 'AL=ALL', '', '', -3, 0, 4),
('4e47a8b5a9a1eb334ed266b821b84fab', '111', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'XXX=NEARBY', '#1', '', -2, 1, 1),
('4e6b8fa2c7105aeec637c9f6e82d1311', '111', '33fba81e5307a519b225c97c018ebb80', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('4eb4cb706ed9e71563c6281580a33cc7', '111', '6b2e63b1fd55069fb7cb35fb60f61ed7', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('4f57cce47821f8af67428921a3a2103c', '111', 'ae510ee1e62c1fd7f0235bc13ae89cf1', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('500218837add9145f83652301995545f', '111', 'a530b55030587b46519449c39181d1b8', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('511d5066a019be7949b6e1b15d799edc', '111', '756a38308099191deffe566cc572d1ea', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('5136411eae668d14a81b1c0d749331aa', '111', '687c9e9af6d058338b2af10b93a4e596', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('514a4786818053f05e34c9374ea5854e', '111', '9db5b63f3418f6e2a3092b8dea45b530', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('516d47b29f199687707cda7e89c08366', '111', 'a530b55030587b46519449c39181d1b8', 'CC=MY_COLLS', '#1', '', -1, 0, 4),
('51b31628621ef42197a5d23dd6c80fe8', '111', '86703a439447287a739e3600a3669d29', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('51e3ed2a8f9e89e09caef8c18e9a7634', 'USR', '7d6653aaa16976e12b6cf7c774f83c1f', 'toto', '#1', '', 0, 0, 0),
('52448e8284a1772a39d6475830b37a36', '111', '00', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('526ac80ff966ccaf64c8e5a8e60e5575', '111', '9dc4cd2d6c07049b21ccb1b21bfadbf8', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('526b687e97b3c9700b6eeb9178626eed', '111', '33fba81e5307a519b225c97c018ebb80', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('529102ef0eef5e8e13a6186cb08d280a', '111', '73e31667472c841d31b679f9683dab6f', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('52a3cab6f9205b2c6fee274ba6c4b09a', '111', '5a6097a8f128c86769da4e977927a78d', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('52ac6f1871023dc59269870dd5c7856b', '1..', 'a3cefde48284f70b2098d7015e987148', 'ztizoi', '#1', '', 0, 0, 0),
('532cb751fc002b5c2df3a32c8d1f6c25', '111', 'd0d086686399ca9e71b9e941f672e0c7', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('53733a64d7373079b6570c4308046c23', '111', '133a86ce8a41daeff7bf37f618ef770d', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('556aca82160a00853becebc4c3c314da', '111', 'e225f8ac45bc47c938af4e683320b1f9', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('5586459081d96920c2b9310c7dde3cc4', '111', 'a6b43a385c41704ec881291e7ac5d889', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('5587005ccf9a09b8f55bc655b5f8ad65', '111', 'bd555337d5de7f75b9dba538f5e6d2b2', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('55978f710516a080fa9a075c14ec7919', '111', '871aafc5183b46241b988e1ae13f3501', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('55f79ba76f2b20721c541ca71a0529e7', '111', 'bdb232ba42790154368b26cd87123485', 'AL=ALL', '', '', -3, 0, 4),
('56990126f58071ced6aa2e4cb941c7db', '111', 'ed951d57987e6b7c195ce0ba7d4729d6', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('56e8efdccfdb03c70ac43f19c18eed6c', '111', 'ffc2fbe41eb237d7e9dd25d974185119', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('57eb85f4d4e2762eb017b8fa928d785f', '111', '946c758dc32eef257aed87d879fe41d1', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('58b3b5cd01eef99f0cfc180662ca6834', '111', 'b039e473e2ddc2af6a2e045dde934913', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('58c3d0f69144cfc4b96c8c00b3543b06', '111', 'd6c71a2943a2a206a8397c7d2756bac7', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('595064a4bb0d1cb6c34db737be2c6454', '111', 'a0e2839bbd082ad194f217d364e5a4df', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('5991a9f7969536cf58ad694f71f8f68f', '111', '894b122ddbc96e7048df42f5a4e7e807', 'AL=ALL', '', '', -3, 0, 4),
('59d2a6e49cbd338f2791e7527ff52530', '111', 'd5499164a40b3cd4bdbcdc3de63f5dd7', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('5aeb51840beb5034f8071a2152cf91a9', '111', '00c28b25326d55eeb28a5ced60a51925', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('5b05b61e9e59fabfd687dc8aa97ed89b', '111', 'bd555337d5de7f75b9dba538f5e6d2b2', 'AL=ALL', '', '', -3, 0, 4),
('5b66c2b57108b887e0103299311fa904', '111', '00c28b25326d55eeb28a5ced60a51925', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('5b7b8b0b0d2734b6165eaedb6d42c687', '111', '6b2e63b1fd55069fb7cb35fb60f61ed7', 'CC=MY_COLLS', '#1', '', -1, 0, 4),
('5c89af1cc9eed739bf7c5c19fc7d5682', '111', 'c002af25af2ff1c0466f8c70f549b0af', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('5ce1a11f7bf45d3275156ca5e2d17c63', '111', '687c9e9af6d058338b2af10b93a4e596', 'AL=ALL', '', '', -3, 0, 4),
('5d5adb8d3f3aaf5d7e74dcb9a220503b', '111', '9db5b63f3418f6e2a3092b8dea45b530', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('5d7947a60dae156817d4eea50be34281', '111', '3318afc1fce28f4e567658e60fec9da2', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('5dacb93cf8f69b91d8162ab29d666544', '111', '7c36b9595f48cba88c52edeeee42af8d', 'AL=ALL', '', '', -3, 0, 4),
('5f207245a2e495af4d34576447aab8f1', '111', '0bbb73aee8d860d39c05663c10e55bc8', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('5f4771702944b0f9913790afafcaae19', '111', 'a3cefde48284f70b2098d7015e987148', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 3),
('5f5bc4b86c62b74b22da8870013b8b1e', '111', 'f5ec6bf1ccac85ed3fdd7ba5874f46e3', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('5ff1ed6639594e5e46efa982ba2103c6', '111', '1b5d5518c800d0929e8d072ff556638b', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('602158aad8818c6dc7758e69845a9758', '111', 'd090b2fecfda936d0c6bb16eade51d8f', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('6048f9a7f13bf5dd22c07a1c4967d7ee', '111', 'a3ab9fc930381fe666d8a1a7cf1035de', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('609f0ce20d24abea7181036f832e176b', '111', '33fba81e5307a519b225c97c018ebb80', 'AL=ALL', '', '', -3, 0, 4),
('60c98d09de5fd1db3c04d0ffaf09acce', '111', '1d7ce9781d74c05bc3782f4c06eabdcd', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('610d59b415150783066568ea4f426141', '111', '7d6653aaa16976e12b6cf7c774f83c1f', 'CC=MY_COLLS', '#1', '', -1, 1, 4),
('611101db2ca7d554ebb65a4150b06d45', '111', '601ad00ff3fd3fbe976ec083282f6785', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('61908f9b844a793fbe385772b3696f76', '111', 'ae510ee1e62c1fd7f0235bc13ae89cf1', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('61d804eca36fae07334ef9b5c008d272', '111', 'bf9e70e37e759e2a53a7e8b7191b3c8b', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('61fd6cd6a63daeb3b0c7f869a52bdfd1', '111', '178cd2f3df2d88613b46bb6e96a77f3a', 'LIS=LISTENING', '#1', '', -2, 0, 5),
('626ed64f5456b08b202f3a6fad998a9f', '111', '40a43df941ecc410777728437cd60fe3', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('63437674ad7640710cb3f0e4cc5eba08', '111', 'c3471df50ab74b88119f5c7d5327131d', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('63449fd4d0f9a2c708109851cbb2f8d7', '111', '0cb6a9fe5ecbce4fdd89aa56e1fe5ac5', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('63488371c11e62a12ea2d5219365e610', '111', '7c7840226f4667662ed0c0ffac20474a', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('6348c7455aa9c2595ae80e89d9631fb4', '111', '7c36b9595f48cba88c52edeeee42af8d', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('639c26a8f78490e14285be5295f7dfa0', '111', 'd4b41947b67949fed02d6456c341e98d', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('64994f1d9217c2d5574c0b3d7e69b9d8', '111', 'da6eb119a5946651373257deb33848c7', 'AL=ALL', '', '', -3, 0, 4),
('64eb2c88aed354b2277eae0987c9eddb', '111', 'e225f8ac45bc47c938af4e683320b1f9', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('6565f96296b08d00ef4e042772944be9', '111', '66283ee137504a410c2c40a3426770e5', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('65dd672e1883baf79570de36f302d83a', '111', '946c758dc32eef257aed87d879fe41d1', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('66177934406d693cf86134d50910bcd5', '111', 'b039e473e2ddc2af6a2e045dde934913', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('667bdd55beb347b5e8456ac1bfe33c72', '111', 'da6eb119a5946651373257deb33848c7', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('66a26bf9f186c492f73c15bcc27aacc2', '111', '053e1c1062668611cc02ab393ad000fd', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('6763d326d6947a8e17502eeb4628ee55', '111', '1dd06812b3511f17e047e96d61f66106', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('680f164b3703a261cefb9355be064bca', '111', '3af1b9d33a52f996f4542d3eb2c9c4a6', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('681ec888647de25167424b788a84c4ac', '111', '586671f519ce766cc5bfaffe8c4c0963', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('6843e7ecaffa4934a04a60b51e83b81a', '111', '73e31667472c841d31b679f9683dab6f', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('684d062a234e84f277abcfeabc1e411b', '111', '09cdd8739a3bc234ad974818e3a67c31', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('68769be6a9aaa2fd47617d029eb92018', '111', 'bf9e70e37e759e2a53a7e8b7191b3c8b', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('68c2e876107b471f04c2fc6cb8ff2cb5', '111', 'd5499164a40b3cd4bdbcdc3de63f5dd7', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('69024fe51faddb6b06616aac4101cd6f', '111', 'e1cf51966342cda9d6d505dff4e2a50a', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('6906f51431b46b1bbc1592d61b7316eb', '111', '03df626059c3430fb7316bcca108beb3', 'AL=ALL', '', '', -3, 0, 4),
('6945394d8f171a83788759fa03dd180b', '111', 'd6c71a2943a2a206a8397c7d2756bac7', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('6967d89a621070cf23cdf5aa7077cba4', '111', 'ce8e22375753b799f049231ed83562a1', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('6975ab75526aa95552dcef5bc1414b7c', '111', 'c002af25af2ff1c0466f8c70f549b0af', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('69ed52a76bb1ab3a54c2f00286ddb8c6', '111', 'e225f8ac45bc47c938af4e683320b1f9', 'AL=ALL', '', '', -3, 0, 4),
('6a0200194e68931474c5b50bd92047f9', '111', '79b1b9dc1b338006650c78d3b4919b04', 'SRV=MY_SERVICES', '#1', '', -2, 0, 2),
('6a54e5916e1a7a3694d90b2911041336', '111', 'ce8e22375753b799f049231ed83562a1', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('6a8f046702b3cb67c459a0b972c86c06', '111', '3acb3e030860b5ac415d226b9907d0e7', 'AL=ALL', '', '', -3, 0, 4),
('6ad026b22cc62822a9b531de7fac0a6c', '111', 'e1cf51966342cda9d6d505dff4e2a50a', 'AL=ALL', '', '', -3, 0, 4),
('6ae1235837dc451869c13dca60d54bb3', '111', 'ed951d57987e6b7c195ce0ba7d4729d6', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('6b66321ff96514714a55ba467463c1b8', '111', 'c4526b59464e976ddadd71a78e13453e', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('6b9b4bcb8f7f2bf4d4394b8d19b76b5c', '111', '601ad00ff3fd3fbe976ec083282f6785', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('6b9b56d8f7b054f04e217fffdc125077', '111', 'e1cf51966342cda9d6d505dff4e2a50a', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('6ba79079783aa3645e83f379a91e20c6', '111', 'e8f894a87f4ee15835cfd6eede3119c6', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('6c4b97b4156a7538f8b702e8881f661d', '111', '1b5d5518c800d0929e8d072ff556638b', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('6c6fc14d981690f2a0d1e1ca54a29812', '111', '1d7ce9781d74c05bc3782f4c06eabdcd', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('6c9f8b07c65c537d36aab67af07f9cb6', '111', 'bf9e70e37e759e2a53a7e8b7191b3c8b', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('6cbabe25f830e8938fcd7ed027c6b2bc', '111', '9dc4cd2d6c07049b21ccb1b21bfadbf8', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('6db72ed129badafe89aee73adc7e28c9', '111', '946c758dc32eef257aed87d879fe41d1', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('6dee1c12e392f82d9be52f1aebc5bcea', '111', '66283ee137504a410c2c40a3426770e5', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('6e38aa1ce02b9317414744df364b9764', '111', '0fbef09a987b7a2f6f5aad18a31a5c43', 'AL=ALL', '', '', -3, 0, 4),
('6eb1fa2f345abf1e9be9bba70e7e4720', '111', 'bdb232ba42790154368b26cd87123485', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('6eb289835051daf8bb3fb8d5d3e29326', '111', 'f5ec6bf1ccac85ed3fdd7ba5874f46e3', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('6ebd9e26d7ab8b659a2568a6bacecc90', '111', 'd4b41947b67949fed02d6456c341e98d', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('6edcab1d2f279f12731efa02e52ac888', '111', '178cd2f3df2d88613b46bb6e96a77f3a', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('6eea7c15408bb802781075e9e4221fe0', '111', '053e1c1062668611cc02ab393ad000fd', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('6f35b17083ce02382754864547c6ea13', '111', '86703a439447287a739e3600a3669d29', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('6f43bbbe056bdc12ab956095a44183da', '111', '1df9e06e56cdc06289a2068cf52cd611', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('6fc818d124842dc408852cc343a515cc', '111', '1df9e06e56cdc06289a2068cf52cd611', 'AL=ALL', '', '', -3, 0, 4),
('6fd460216d954eacab72a3093eee190e', '111', '894b122ddbc96e7048df42f5a4e7e807', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('6ffda29bf0a256302002bb6689f85edf', '111', 'd4b41947b67949fed02d6456c341e98d', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('701cdc5bc5d83d7c36ea29c4d129b6ac', '111', '7c7840226f4667662ed0c0ffac20474a', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('70367541aaf4a2bd3e1d5dbeaf0e4ce9', '111', 'd0d086686399ca9e71b9e941f672e0c7', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('705b20050919df9696841bc8984c92ce', '111', '03df626059c3430fb7316bcca108beb3', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('70c2c72a5cd97a23136cfffa27449324', '111', '946c758dc32eef257aed87d879fe41d1', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('70d62a4150b5c676fe53d72575f59177', '111', '9db5b63f3418f6e2a3092b8dea45b530', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('710e80a4d0ec649de4eba1aa0a86e77d', '111', 'd4b41947b67949fed02d6456c341e98d', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('7160e9a4733aaa3375ae155409f71f06', '111', '616389b89c369c591118fd7e3014fd69', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('71afedefd8d6e60864b8c0a83bc43f3a', '111', 'bd555337d5de7f75b9dba538f5e6d2b2', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('71d473e9be3e3829fa27c75c0ed34f8c', '111', '09cdd8739a3bc234ad974818e3a67c31', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('720c3dd2b48a698c9a232aa8d126ff41', '111', '9db5b63f3418f6e2a3092b8dea45b530', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('727322fb92f9019ffa417d1f1a580fc7', '111', '616389b89c369c591118fd7e3014fd69', 'AL=ALL', '', '', -3, 0, 4),
('72de38e5da1e30d976f9ba55411db047', '111', 'a6b43a385c41704ec881291e7ac5d889', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('737e42c2b7108444c242ae1c08fa154d', '111', '178cd2f3df2d88613b46bb6e96a77f3a', 'CC=MY_COLLS', '#1', '', -1, 0, 4),
('745df018213ca3d582d40472a654c94b', '111', 'b039e473e2ddc2af6a2e045dde934913', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('74971e95bf7abf30d817d8df78ed8f40', '111', '6c3c85ad3057f142d3aa7f34bbe7bbb1', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('74a4d2b33f4744ac00a2135cca5160b0', '111', 'd45e4bc08f17fb3d692394c277e60281', 'AL=ALL', '', '', -3, 0, 4),
('74c49e002aea40c1cb476d8a34619071', '111', 'd090b2fecfda936d0c6bb16eade51d8f', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('75549ef2e8d8c4bc2775da373c935639', 'USR', '7d6653aaa16976e12b6cf7c774f83c1f', 'toto', '#1', '', 0, 0, 0),
('75d46c0439e84d7c7179805a1915b6b1', '111', '0bbb73aee8d860d39c05663c10e55bc8', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('7641060b7d0116abaf98fb633b4047c0', '111', '9db5b63f3418f6e2a3092b8dea45b530', 'AL=ALL', '', '', -3, 0, 4),
('76774abe883068d7ca4e2cc782757713', '111', '73e31667472c841d31b679f9683dab6f', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('76ad7e0864f1936360835d7656fe0d00', '111', '1d7ce9781d74c05bc3782f4c06eabdcd', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('773e74260013d9ca4f8e57e9a1490755', '111', 'd0d086686399ca9e71b9e941f672e0c7', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('77988ca16367ede8f788da9f1c10e88f', '111', '0fbef09a987b7a2f6f5aad18a31a5c43', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('77df336ec46ae6c59a491355f9f3e4b3', '111', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'CC=MY_COLLS', '#1', '', -1, 1, 4),
('79355c1d3c32df425bc55b9148809b62', '111', 'a6b43a385c41704ec881291e7ac5d889', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('7a310c7ee9abed33a12d3cc7f8191520', '111', '053e1c1062668611cc02ab393ad000fd', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('7a9701428afc51d6dec7319ddcc1ef67', '111', '841ef8a50591e500450e46b20f0071cd', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('7b81fa3b6c9780b368c51742b0e376f2', '111', 'b039e473e2ddc2af6a2e045dde934913', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('7d666f7115fbdcd180c492aaca81d2ed', '111', 'c4526b59464e976ddadd71a78e13453e', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('7e8747af8deee28847bee4e89e6c5505', '111', 'c002af25af2ff1c0466f8c70f549b0af', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('7f14ab06707c80efba5879e1cf5b90a6', '111', 'd0d086686399ca9e71b9e941f672e0c7', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('7f33ab52f81561d11ba17813117c3cc5', '111', 'd1f254057a12848c8ac453d752a4a51b', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('8004464d06256ef723d56dc549fa9300', '111', 'ffc2fbe41eb237d7e9dd25d974185119', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('8033c9b680b2678ad3c17ed24aa0bebf', '111', 'a530b55030587b46519449c39181d1b8', 'AL=ALL', '', '', -1, 0, 1),
('8034079ee2e42eb083a25dde7d5b7eaa', '111', 'e225f8ac45bc47c938af4e683320b1f9', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('80d0435308032904f08df14e8a2baee6', '111', '7c36b9595f48cba88c52edeeee42af8d', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('818d36baa958c67fbf1ef7cb612b213f', '111', '133a86ce8a41daeff7bf37f618ef770d', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('81d68a7cd2c2443036fb8d2c940dbd91', '111', '586671f519ce766cc5bfaffe8c4c0963', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('81f82b9918b9025dfa0bfe5dccc7154e', '111', '5fb94b57d704fa3bb4bbe279634c757c', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('82294358de89001ba4b35552a1cfb065', '111', '871aafc5183b46241b988e1ae13f3501', 'CC=MY_COLLS', '#1', '', -1, 0, 4),
('82ce2541b08816776eb065b4cefb307e', '111', '97b2c140029b110a0b9dc00a7bd4481a', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('82d4e335678ec63c62d0a787eee0fa71', '111', '7c36b9595f48cba88c52edeeee42af8d', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('830e8b7bc221edc802407d064a9b7dc1', '111', '841ef8a50591e500450e46b20f0071cd', 'AL=ALL', '', '', -3, 0, 4),
('837526157953e840652cc514bbf46ae2', '111', '894b122ddbc96e7048df42f5a4e7e807', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('837bebcd24d1ebc39b8e4c3079377741', '111', '00', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('83823e1d25aae3d294dbf6a6295c4cf0', '111', '00c28b25326d55eeb28a5ced60a51925', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('83d7380525f42823389e1ab1389a1ddc', '111', '0fbef09a987b7a2f6f5aad18a31a5c43', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('8423a0f697c0142837b6308974074ff5', '111', '37814d93e823ef15861dce164db4cb7d', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('8453da4464271c25ea80b8168fdea0fd', '111', 'ed951d57987e6b7c195ce0ba7d4729d6', 'AL=ALL', '', '', -3, 0, 4),
('8460665055df1850766f61dc45593e67', '111', '178cd2f3df2d88613b46bb6e96a77f3a', 'AL=ALL', '', '', -1, 1, 1),
('8476560b20bbeb19fb14be59e1152fb8', '111', 'e04541f717da39b450f4155282287e77', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('85753750d61bd0c5bd6f80d12b0c33ba', '111', '1b5d5518c800d0929e8d072ff556638b', 'CC=MY_COLLS', '#1', '', -1, 1, 4),
('857c115d73563d63ec1b7ad5cc8565fe', '111', '133a86ce8a41daeff7bf37f618ef770d', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('8591bf48d6d6a6bb035638c33e43caf4', '111', 'e8f894a87f4ee15835cfd6eede3119c6', 'AL=ALL', '', '', -3, 0, 4),
('873e23e7bd30774c19d9319c33ab2b61', '111', 'db63cb36f363ff16141f9893a0590683', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('87cf73ec166f8fd627805ea88b19aec4', '111', 'd6c71a2943a2a206a8397c7d2756bac7', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('87f5544ac7d209e40c60d127e4a7a794', '111', 'a530b55030587b46519449c39181d1b8', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 3),
('883d3a1e927fab21d47bcdd0e949f2c3', '111', '178cd2f3df2d88613b46bb6e96a77f3a', 'SRV=MY_SERVICES', '#1', '', -2, 0, 2),
('891f541472f02be35d0033b7c8300e69', '111', '756a38308099191deffe566cc572d1ea', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('8961ff695a843f419d4bbf4fb9eb71ad', '111', '3acb3e030860b5ac415d226b9907d0e7', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('89ea6f713b957ebfb4251fad7edf7fe1', '111', 'e8f894a87f4ee15835cfd6eede3119c6', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('8a16ea8c941dfbb2af676d49ad76c368', '111', 'bdb232ba42790154368b26cd87123485', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('8a759c2653f5ca41e8fc4b0731bc49a2', '111', 'ae510ee1e62c1fd7f0235bc13ae89cf1', 'AL=ALL', '', '', -3, 0, 4),
('8b0c1028331b22b3eeef2a59c7567b9e', '111', 'ffc2fbe41eb237d7e9dd25d974185119', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('8b20aecf2cfadb0f4c77d80e428ed767', '111', 'db63cb36f363ff16141f9893a0590683', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('8b27d2138890e0e8b097f286f4e22995', '111', '841ef8a50591e500450e46b20f0071cd', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('8b47b784551bda7597fcce86e98381f0', '111', 'f5ec6bf1ccac85ed3fdd7ba5874f46e3', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('8be0bf8e3e560a9be297fedbac424a36', '111', '37814d93e823ef15861dce164db4cb7d', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('8cbd48721e8dbbd0261d91630299c2d0', '111', 'a3ab9fc930381fe666d8a1a7cf1035de', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('8cc8d5cd548ed91868d51829a7e4401d', '1..', '7d6653aaa16976e12b6cf7c774f83c1f', 'toto', '#1', '', 0, 0, 0),
('8ce9c8d41136b47f152d34a51007ac80', '111', 'e1aa4f724cf384a08db7674e2d834495', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('8cf77fb0a3b30814fcde31f41dab55fe', '111', 'a6b43a385c41704ec881291e7ac5d889', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('8d5532f207105e5ff3f416ce804ed380', '111', '1b5d5518c800d0929e8d072ff556638b', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 3),
('8e25b409e7d70df513bf8975800b3f21', '111', '33fba81e5307a519b225c97c018ebb80', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('8ec032c6445d544f4898155704bcc899', '111', '37814d93e823ef15861dce164db4cb7d', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('8ec4fa3b6b4fb77eb63945e0e90fe600', '111', '66283ee137504a410c2c40a3426770e5', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('8efc5e04011e067744b8bc8c0199b879', '111', 'bf9e70e37e759e2a53a7e8b7191b3c8b', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('8f55ae116fedaae514fc9d8c18dfd4a8', '111', '7c7840226f4667662ed0c0ffac20474a', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('8f69aa06b280130d38a18b42e8cd8fce', '111', 'fb9683c61faae7377daa18a3a30ffe1d', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('8f6aa989fc45e09f46f1e20150a0e382', '111', 'd4b41947b67949fed02d6456c341e98d', 'AL=ALL', '', '', -3, 0, 4),
('8fa15bf1cbe646d2b3cee9579fbf98bc', '111', '756a38308099191deffe566cc572d1ea', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('9017bc51e27227da82810d8fdb0335f9', '111', '3af1b9d33a52f996f4542d3eb2c9c4a6', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('903f1c26cccadd98fcdd22a45e73cd87', '111', '41f48906262cfad9b4c41613ffcc6cb0', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('90da4680bdf46f0a1f3b5148cdb29b24', '111', '871aafc5183b46241b988e1ae13f3501', 'SRV=MY_SERVICES', '#1', '', -2, 0, 2),
('90f12f0b55da49d5b0dbe1230cece53a', '111', 'ffc2fbe41eb237d7e9dd25d974185119', 'AL=ALL', '', '', -3, 0, 4),
('9119f11139b3dc522974f6e62940e2d6', '111', '2116684d8de4ecf5cf21d4c6ad668f98', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('91824644190561b50171a3b6019716cf', '111', '053e1c1062668611cc02ab393ad000fd', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('91d4787057b4e5e7e390f88dac3547e7', '111', '09cdd8739a3bc234ad974818e3a67c31', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('92639a588ac9a0f7deec2da3a8ea2df2', '111', 'a0e2839bbd082ad194f217d364e5a4df', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('9284966acbe3d39a6936b4dcb13f8e74', '111', '40a43df941ecc410777728437cd60fe3', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('92c1334363bacdfe127dff02a22855bb', '111', 'c3471df50ab74b88119f5c7d5327131d', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('9313f1fce026ae76006319507f06f385', '111', '09cdd8739a3bc234ad974818e3a67c31', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('93dce32b20c980efb90093af3ee62bf1', '111', '616389b89c369c591118fd7e3014fd69', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('943e9e3278c3c78242d72c40642b9cc8', '111', 'c3471df50ab74b88119f5c7d5327131d', 'AL=ALL', '', '', -3, 0, 4),
('94a222927d6c2bf2e2f23665e93d60c6', '111', '1df9e06e56cdc06289a2068cf52cd611', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('9505d487c848c28338cd02eba33aca6c', '111', '3acb3e030860b5ac415d226b9907d0e7', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('951bbf2c96febc2c0ccecfff47503de4', '111', '7c7840226f4667662ed0c0ffac20474a', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('95b323a0f72eb007c3a960d425ffd13d', '111', '053e1c1062668611cc02ab393ad000fd', 'AL=ALL', '', '', -3, 0, 4),
('95b6fbb0bfc619c969f1054900c73af0', '111', 'da6eb119a5946651373257deb33848c7', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('95be738a74271210354640dc6819937e', '111', '2116684d8de4ecf5cf21d4c6ad668f98', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('95d78b9b38e833e1775a4d6a79a49c50', '111', 'd45e4bc08f17fb3d692394c277e60281', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('968cbb04cb26ee4859acab3af20a7ad6', '111', 'e04541f717da39b450f4155282287e77', 'XXX=NEARBY', '#1', '', -2, 0, 1);
INSERT INTO `filter_smart` (`id_filsma`, `type_filsma`, `id_user_filsma`, `alias_filsma`, `sequence_filsma`, `style_filsma`, `access_filsma`, `active_filsma`, `order_filsma`) VALUES
('96bdfad1f4725d8fed0d8f6a2a71f967', '111', '3af1b9d33a52f996f4542d3eb2c9c4a6', 'AL=ALL', '', '', -3, 0, 4),
('96d8e129f5f0675eabfd0b9ac03ad850', '111', '7d6653aaa16976e12b6cf7c774f83c1f', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('96f5ad52c81c00a60726d50c3b103cc0', '111', 'd090b2fecfda936d0c6bb16eade51d8f', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('96fb5b6a4201474b51eadcedf827bb26', '111', 'b039e473e2ddc2af6a2e045dde934913', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('9731de10e5ad6622b6ccfc30e3a0887c', '111', '1d7ce9781d74c05bc3782f4c06eabdcd', 'AL=ALL', '', '', -3, 0, 4),
('97691d4994e011622fda2763bd09f006', '111', 'c3471df50ab74b88119f5c7d5327131d', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('97af53b95678e4fef152c983117bd0b1', '111', '0cb6a9fe5ecbce4fdd89aa56e1fe5ac5', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('97b71bcc7980f91946309057f1eee13a', '111', '871aafc5183b46241b988e1ae13f3501', 'FF=MY_PISTS', '#1', '', -1, 0, 2),
('97c9dead3ff77703b2ffb131b0dac1ca', '111', '6b2e63b1fd55069fb7cb35fb60f61ed7', 'SRV=MY_SERVICES', '#1', '', -2, 0, 2),
('9819b1adbf5969244782aad943bae177', '111', '3acb3e030860b5ac415d226b9907d0e7', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('982db73e6fa1da12dd7d2d787b8fdcb5', '111', 'bdb232ba42790154368b26cd87123485', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('9acb4ced693f3c52fbfda01ba2f26e80', '111', 'e1cf51966342cda9d6d505dff4e2a50a', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('9afd661de4c675814bfe176e645c3005', '111', '00c28b25326d55eeb28a5ced60a51925', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('9b03c74441eaa7c9bdbf6c28bdfdc070', '111', 'bd555337d5de7f75b9dba538f5e6d2b2', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('9b73bb01f0cdaa1b67618df7e8912f86', '111', '9dc4cd2d6c07049b21ccb1b21bfadbf8', 'CC=MY_COLLS', '#1', '', -1, 1, 4),
('9bba652d0064d42bec14c617339eaeb3', '111', '871aafc5183b46241b988e1ae13f3501', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('9bd01d9b45660a3188fcfb7429a69b30', '111', '6b2e63b1fd55069fb7cb35fb60f61ed7', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('9cf0995decd59d9b4e0d18c81c4cb2e8', '111', '601ad00ff3fd3fbe976ec083282f6785', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('9d906ff27447aaadde9dbb40c1000a8b', '111', '1df9e06e56cdc06289a2068cf52cd611', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('9dadd79d201efdc1bf08a44f0f487d06', '111', '894b122ddbc96e7048df42f5a4e7e807', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('9e269805c606b4ff11d6cdadebe15a0d', '111', '2116684d8de4ecf5cf21d4c6ad668f98', 'AL=ALL', '', '', -3, 0, 4),
('9e6bda982157f8a953af72466447ddc8', '..1', 'a3cefde48284f70b2098d7015e987148', 'sdfsdf fsd dsfsd dsfdfsd ', '#1', '', 0, 0, 0),
('9ecbef388f5cad5cdb9ac80433c83d6d', '111', '1dd06812b3511f17e047e96d61f66106', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('9ef502fd254a381a899d7e466f1b7a73', '111', '3af1b9d33a52f996f4542d3eb2c9c4a6', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('9ff60286b4d28e30299805d09155bbb5', '111', 'a3ab9fc930381fe666d8a1a7cf1035de', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('a0a3a4e53f18d4bb705126dcffe5e271', '111', '00', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('a17170dad11c9d28e9ebc1ffc64894a6', '111', 'da6eb119a5946651373257deb33848c7', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('a1a424ba8c77d5c741ce4ecaf6581f7e', '111', '1dd06812b3511f17e047e96d61f66106', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('a1d072629025a0048abe033f9f363628', '111', '40a43df941ecc410777728437cd60fe3', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('a24c4f3c60575d772eea7754ecc5f04f', '111', 'c3471df50ab74b88119f5c7d5327131d', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('a2c6c78195ec69c5cb4dd0fd92d36c19', '111', '2116684d8de4ecf5cf21d4c6ad668f98', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('a2dc11468049b30224e6e6a962caf57f', '111', 'da6eb119a5946651373257deb33848c7', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('a2eb8abc3438a2d85a688d10e366dc14', '111', '1d7ce9781d74c05bc3782f4c06eabdcd', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('a39f48e0f84aa216f90549a72218e12f', '111', 'c3471df50ab74b88119f5c7d5327131d', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('a41e7845efa234e6dd7300def5642c7a', '111', '09cdd8739a3bc234ad974818e3a67c31', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('a4928c4297deeb4166357cf80695d96e', '111', 'fb9683c61faae7377daa18a3a30ffe1d', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('a517d48ade2cb211f7483cf9f8ae87e5', '111', '41f48906262cfad9b4c41613ffcc6cb0', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('a5d0fb21dec7cf9404ff752cf291b2d1', '111', '178cd2f3df2d88613b46bb6e96a77f3a', 'FF=MY_PISTS', '#1', '', -1, 0, 2),
('a6a62b03ee12fafcc9acf92a029a0058', '111', '6c3c85ad3057f142d3aa7f34bbe7bbb1', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('a760965abb781e0db6f413b8d6db4089', '111', '871aafc5183b46241b988e1ae13f3501', 'AL=ALL', '', '', -1, 1, 1),
('a85b1e5fa64a7946a8ee7d884b491620', '111', '3318afc1fce28f4e567658e60fec9da2', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('a8b4924c00e61ba76a947af33f15062d', '111', 'd4b41947b67949fed02d6456c341e98d', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('a8e39b2a0d3d62bed7de638686d516d0', '111', 'd1f254057a12848c8ac453d752a4a51b', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('a9166fe8c34e5a575573a8708aafbac1', '111', 'd6c71a2943a2a206a8397c7d2756bac7', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('a92b9f5a32f5daa61f64ea484b13abee', '111', '66283ee137504a410c2c40a3426770e5', 'AL=ALL', '', '', -3, 0, 4),
('a980437e719f97ec8ab634451e5d73f2', '111', '941af2c99f4f7895b481ab9c3261e4ee', 'SRV=MY_SERVICES', '#1', '', -2, 0, 2),
('a98b9fd5f8f240db275e4b1478518bae', '111', '133a86ce8a41daeff7bf37f618ef770d', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('a9c5eeafa2051096fcb0d1096f24f038', '111', 'a0e2839bbd082ad194f217d364e5a4df', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('aa99e275d794c3175464846a550011c3', 'ACT', '7d6653aaa16976e12b6cf7c774f83c1f', 'toto', '#1', '', 0, 0, 0),
('aaca172644547010ffa80b7ed58fb6bf', '111', 'bd555337d5de7f75b9dba538f5e6d2b2', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('ab021622a67de1590ec7e6198a8c23a0', '111', 'a3ab9fc930381fe666d8a1a7cf1035de', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('ab5a3beb40a18f75b22519640b0ca195', '111', '053e1c1062668611cc02ab393ad000fd', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('ab92e8a102ba7a66901ca370916a76d8', '111', 'ed951d57987e6b7c195ce0ba7d4729d6', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('ad8475f6291e8c0b02242d522a852cac', '111', '9dc4cd2d6c07049b21ccb1b21bfadbf8', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('adac6265e9fe6641ecc7eac0d00baa91', '111', '00', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('ade632514d948f427a6c6e7bd58cdd8a', '111', '66283ee137504a410c2c40a3426770e5', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('ae99c65ec2e9f3d27f46d6c5a421f721', '111', '86703a439447287a739e3600a3669d29', 'AL=ALL', '', '', -3, 0, 4),
('af0352b47c0dccb52ff19a79e9b9fdd5', '111', 'a6b43a385c41704ec881291e7ac5d889', 'AL=ALL', '', '', -3, 0, 4),
('afb2ca0ef256bea33d6791620bc74e59', '111', '178cd2f3df2d88613b46bb6e96a77f3a', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('affb4075b143714be3a59c69e967a0d6', '111', '97b2c140029b110a0b9dc00a7bd4481a', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('b0584cd973c1dff021b89433178074bd', '111', '00c28b25326d55eeb28a5ced60a51925', 'AL=ALL', '', '', -3, 0, 4),
('b07045d860777ecf7780afd8af856dd1', '111', 'a530b55030587b46519449c39181d1b8', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('b07c6eaaa880163cbdf3dcb94279a76e', '111', 'bd555337d5de7f75b9dba538f5e6d2b2', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('b0b75187c897ac29723927e75967c2a9', '111', '1d7ce9781d74c05bc3782f4c06eabdcd', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('b21f4db42227a059d2d054e85bdd1dfa', '111', 'ae510ee1e62c1fd7f0235bc13ae89cf1', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('b2452c6153a126a73e071cdedbbf63be', '111', 'e225f8ac45bc47c938af4e683320b1f9', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('b286d1f90ad460e2194d5ce693dd52ec', '111', '841ef8a50591e500450e46b20f0071cd', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('b2a2c7b81f167889640799f539e40156', '111', '7c36b9595f48cba88c52edeeee42af8d', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('b3053b3f08413b48a9ceeda90ea549be', '111', 'e04541f717da39b450f4155282287e77', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('b33e74554fa37e493d4b8945283235a1', '111', '5a6097a8f128c86769da4e977927a78d', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 3),
('b402f9f61500f0d162091756440b134e', '111', '133a86ce8a41daeff7bf37f618ef770d', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('b40e8a570605afaaa0e3b267e0ffbddd', '111', 'a0e2839bbd082ad194f217d364e5a4df', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('b42698e50e8930712027197fec243823', '111', 'd5499164a40b3cd4bdbcdc3de63f5dd7', 'AL=ALL', '', '', -3, 0, 4),
('b459de3ebc6093714d6d3f64cb5f7ea1', '111', '03df626059c3430fb7316bcca108beb3', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('b48dab5e20d51d5e27275d9f2eafebcc', '111', 'a0e2839bbd082ad194f217d364e5a4df', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('b4a38dc95cc71f9aef79064620995a8d', '111', 'd090b2fecfda936d0c6bb16eade51d8f', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('b4a875506eabef3c23a666184219dda5', '111', 'e04541f717da39b450f4155282287e77', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('b56a1d6612e73d696f050b87ef837412', '111', '941af2c99f4f7895b481ab9c3261e4ee', 'FF=MY_PISTS', '#1', '', -1, 0, 2),
('b5db79d5047c9666d481ed7cd8b26683', '111', 'ed951d57987e6b7c195ce0ba7d4729d6', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('b64ad00c2b59011288e6bd63b8409131', '111', 'c002af25af2ff1c0466f8c70f549b0af', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('b665aaf739244d5a0b4a4dd5e9d82f81', '111', '97b2c140029b110a0b9dc00a7bd4481a', 'AL=ALL', '', '', -3, 0, 4),
('b670b3d8dd1fa26f1292cf2e0ea02dda', '111', 'db63cb36f363ff16141f9893a0590683', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('b6aa9fa2e24e37ebddbf2390cc9c6966', '111', '7d6653aaa16976e12b6cf7c774f83c1f', 'LIS=LISTENING', '#1', '', -2, 0, 5),
('b6b09d4485da304d01760ce2e730615e', '111', '86703a439447287a739e3600a3669d29', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('b6f9dc6bffde7059346f71f8f3f6bcfb', '111', 'a3cefde48284f70b2098d7015e987148', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('b71719bd1437000048ef208f38abf3cb', '111', 'ae510ee1e62c1fd7f0235bc13ae89cf1', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('b7337184017200be48f9770bc206aa0b', '111', '11b25d42972af71f6b9c3c3466b81100', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('b73e85d5ded04c72806220dab373aa53', '111', '1dd06812b3511f17e047e96d61f66106', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('b87085ee9a27c4b39c6b1f2a0b286eb9', '111', '687c9e9af6d058338b2af10b93a4e596', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('b97388ed7ce9378c0f030c28fc550be7', '111', '3318afc1fce28f4e567658e60fec9da2', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('b9f7e2fc58284ab08a3fcb9058ddad47', '111', 'd0d086686399ca9e71b9e941f672e0c7', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('bab2bc35f4342bcbdd196f703a4d0e5e', '111', 'd0d086686399ca9e71b9e941f672e0c7', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('bae60f77f16f55d83509dbd97535c05f', '111', '756a38308099191deffe566cc572d1ea', 'AL=ALL', '', '', -3, 0, 4),
('bbbc59e2d785682707d95fcf577380e2', '111', '40a43df941ecc410777728437cd60fe3', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('bbcdcdce9669ed380ecddd49ab3e0220', '111', 'c3471df50ab74b88119f5c7d5327131d', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('bbefd7483ae49c4cc40c4e6510ebc0f4', '111', '586671f519ce766cc5bfaffe8c4c0963', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('bcbd6bdfb9479d7b1197bf414de417a9', '111', 'c4526b59464e976ddadd71a78e13453e', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('bd1892156e9a7f979e6df77190f9d90e', '111', '86703a439447287a739e3600a3669d29', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('bd7f63a95d05cd6e4e79bc8013930417', '111', '946c758dc32eef257aed87d879fe41d1', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('bda5ab66ed7e4fdce1435be694504611', '111', '73e31667472c841d31b679f9683dab6f', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('be3af280476933930722fe033aaac2bb', '111', '1b5d5518c800d0929e8d072ff556638b', 'AL=ALL', '', '', -3, 0, 4),
('be4676c6f70c1ced8aed0db75433c56d', '111', '9db5b63f3418f6e2a3092b8dea45b530', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('be874c913de20ff3955109ab8f7c2ac5', '111', 'c002af25af2ff1c0466f8c70f549b0af', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('bed6862ad00535b0d664e3a101b774fb', '111', '616389b89c369c591118fd7e3014fd69', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('c00df1d27a897dcfe8c53828f9414e86', '111', 'ed951d57987e6b7c195ce0ba7d4729d6', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('c00f51881cd9bfb460617936223b1308', '111', '756a38308099191deffe566cc572d1ea', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('c094a3d0ae36c2524a9150f5efff05d3', '111', 'd45e4bc08f17fb3d692394c277e60281', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('c11b9fb058ef7baede6462933d9518ae', '111', 'd45e4bc08f17fb3d692394c277e60281', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('c12d980aa1e75f50ba6d50cc38509cb1', '111', '2116684d8de4ecf5cf21d4c6ad668f98', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('c132cd2c7de4d7bd33c4b7fcf0b0db53', '111', 'e225f8ac45bc47c938af4e683320b1f9', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('c173c7900029d86fd8a95c55faa77a33', '111', '11b25d42972af71f6b9c3c3466b81100', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('c1e96777190fb928442d8b7554a07e71', '111', '9dc4cd2d6c07049b21ccb1b21bfadbf8', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('c214b87591a97e6c9a373b9d8769f2eb', '111', '5a6097a8f128c86769da4e977927a78d', 'FF=MY_PISTS', '#1', '', -1, 0, 2),
('c230cd6a0ca8a31e3a8305d9fc850765', '111', 'e8f894a87f4ee15835cfd6eede3119c6', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('c278963332bdb0af64ba54b1bb6210b2', '111', '63e6f927fffd663cf6c29323c39ceffd', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('c2e21749c7b980e8af3b74fd96dd5a90', '111', 'ae510ee1e62c1fd7f0235bc13ae89cf1', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('c2ea34eff4c4c7cae839355fe88173a0', '111', '66283ee137504a410c2c40a3426770e5', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('c36b859dcefec9dfcb8be475439d560a', '111', 'f5ec6bf1ccac85ed3fdd7ba5874f46e3', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('c38c05358363ffc9f82e851e10ba8112', '111', '03df626059c3430fb7316bcca108beb3', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('c3b4f119536956525602592246993222', '111', '946c758dc32eef257aed87d879fe41d1', 'AL=ALL', '', '', -3, 0, 4),
('c4746580ac5bde93cd1f2cf427f889da', '111', '03df626059c3430fb7316bcca108beb3', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('c503a9ca25eeafe65a5fba5da13f6e60', '111', 'd5499164a40b3cd4bdbcdc3de63f5dd7', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('c550d79025a1c882f5811003c6962868', '111', 'd5499164a40b3cd4bdbcdc3de63f5dd7', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('c588e91670c65fe296fcb52392118da5', '111', '941af2c99f4f7895b481ab9c3261e4ee', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('c59d28e215a1459912ad56ffc8584313', '111', 'f5ec6bf1ccac85ed3fdd7ba5874f46e3', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('c5dbc537469cbf39551c53926b5a60d5', '111', '37814d93e823ef15861dce164db4cb7d', 'AL=ALL', '', '', -3, 0, 4),
('c5fbce62fe52efb6c848ef510aa53859', '111', '0bbb73aee8d860d39c05663c10e55bc8', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('c63a94f1dacfef891909e330134a8cbe', '111', 'a3cefde48284f70b2098d7015e987148', 'LIS=LISTENING', '#1', '', -2, 0, 5),
('c6559c6f38fa2abf2f0ab965e9670915', '111', '3acb3e030860b5ac415d226b9907d0e7', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('c681fc1f94bafb92c56ffda6864136e6', '111', '37814d93e823ef15861dce164db4cb7d', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('c6b1a731779a4daee4b89f0009a084aa', '111', '63e6f927fffd663cf6c29323c39ceffd', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('c750f56b6892234f81c0610099245bc1', '111', 'a530b55030587b46519449c39181d1b8', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('c78660c3dacf94a96dea60bc88fc854c', '111', 'ed951d57987e6b7c195ce0ba7d4729d6', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('c83ae0f9e44ecc99525d4cefe976a25d', '111', '687c9e9af6d058338b2af10b93a4e596', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('c95f7cc8c6c99bcfc2b8967d6beefd98', '111', '1df9e06e56cdc06289a2068cf52cd611', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 3),
('c9bdf368221f9cef98c25aacb7bdf889', '111', 'ce8e22375753b799f049231ed83562a1', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('c9e288b5139303d03c0c2ca9b66f1a2a', '111', 'ffc2fbe41eb237d7e9dd25d974185119', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('c9e5e93be43075c656ac325995f7fe24', '111', '97b2c140029b110a0b9dc00a7bd4481a', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('ca21f8edc7fc5c94c31814f5ed3f93cf', '111', '33fba81e5307a519b225c97c018ebb80', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('ca9022cf0fb0ee682f0521e5e93bfbf1', '111', 'ffc2fbe41eb237d7e9dd25d974185119', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('caa44dde88e7b998032ae3454d6aad2f', '111', '053e1c1062668611cc02ab393ad000fd', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('cb370daf4bb8116f34d9954af6a845ab', '111', '6b2e63b1fd55069fb7cb35fb60f61ed7', 'LIS=LISTENING', '#1', '', -2, 0, 5),
('ccc2ad574a4633428b23ce0cbe33f8e0', '111', '841ef8a50591e500450e46b20f0071cd', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('cd90d46af1239876717366b345157845', '111', '946c758dc32eef257aed87d879fe41d1', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('cdcbbd9f7612d8b3bf557216ea58f89b', '111', '5fb94b57d704fa3bb4bbe279634c757c', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('ce3e9360561af57fed84a9192ff021d8', '111', '894b122ddbc96e7048df42f5a4e7e807', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('ce5f69fcd17668b78ed07526005d8afc', '111', '00c28b25326d55eeb28a5ced60a51925', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('cea1c52e1f9c7001883d4f5148272175', '111', 'a0e2839bbd082ad194f217d364e5a4df', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('cf092ab862ab58538e0a5d46ab60f830', '111', 'ce8e22375753b799f049231ed83562a1', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('cf8677f18b50847e80df2d8ae1c1cd04', '111', '7d6653aaa16976e12b6cf7c774f83c1f', 'SRV=MY_SERVICES', '#1', '', -2, 0, 2),
('d007034565a839ea315a08edef42a1ee', '111', 'ce8e22375753b799f049231ed83562a1', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('d01fd39dc4538d483c3e3fcca649c0f2', '111', '0cb6a9fe5ecbce4fdd89aa56e1fe5ac5', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('d0b54e4c99b646b5ef45c6735f017982', '111', '6c3c85ad3057f142d3aa7f34bbe7bbb1', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('d0f9650f7c06af38a92b2da5c0505b9f', '111', '841ef8a50591e500450e46b20f0071cd', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('d18da5257a4e67101bbf0efe871fe84b', '111', '0cb6a9fe5ecbce4fdd89aa56e1fe5ac5', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('d1a3574bfc7147a3d7fb603f41403983', '111', 'e1aa4f724cf384a08db7674e2d834495', 'AL=ALL', '', '', -3, 0, 4),
('d1ba8899bb98786db062d9e07c2f70f7', '111', 'd6c71a2943a2a206a8397c7d2756bac7', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('d267eab354b3c9d646b86b18a8b40e6f', '111', 'd4b41947b67949fed02d6456c341e98d', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('d2bf0f80e76cbba773b47e1884ae0c01', '111', '946c758dc32eef257aed87d879fe41d1', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('d32d0dd1b743231d138fa0fb7b6f6f82', '111', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'AL=ALL', '', '', -3, 0, 4),
('d3697e022393adc28b8a381f221bc4b3', '111', 'c002af25af2ff1c0466f8c70f549b0af', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('d41cfed1685ec667619d18a9ad245e20', '111', '586671f519ce766cc5bfaffe8c4c0963', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('d46276a7579716d9f77284de97fb87db', '111', '40a43df941ecc410777728437cd60fe3', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('d48d75b513a13f8a1f32847cb00625de', '111', 'e225f8ac45bc47c938af4e683320b1f9', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('d4e335878e03536d72c8f911c1145177', '111', '0fbef09a987b7a2f6f5aad18a31a5c43', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('d591a1c2cd41aacd9512760a7f4456b4', '111', '3af1b9d33a52f996f4542d3eb2c9c4a6', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('d617627ab47d25221658cf4c10bfbec4', '111', '5a6097a8f128c86769da4e977927a78d', 'LIS=LISTENING', '#1', '', -2, 0, 5),
('d6502a41d3651cc95de43c1e5dc2f87a', '111', '1df9e06e56cdc06289a2068cf52cd611', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('d6cb044fc6f45aaa1ec7d79f2b6846f4', '111', '601ad00ff3fd3fbe976ec083282f6785', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('d73558698a9f9b06c2b5dd5164a21f9f', '111', '616389b89c369c591118fd7e3014fd69', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('d7624ec8c2d82eed8c65a6f93ff28c64', '111', '756a38308099191deffe566cc572d1ea', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('d7b951dd26c732354f0a4278b28559f8', '111', '00', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('d7b9b784d65ccf2138a3f00197e14151', '111', '11b25d42972af71f6b9c3c3466b81100', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('d812cc11b1c5f3a7b829c43999b037b2', '111', '586671f519ce766cc5bfaffe8c4c0963', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('d82bfa274fd89eb9220dfe6219eb77af', '111', 'f5ec6bf1ccac85ed3fdd7ba5874f46e3', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('d8bdd0a8136bfeaf4d9eaa56ed210f5e', '111', '00c28b25326d55eeb28a5ced60a51925', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('d8ca30b7f2b928b97e0855ab3b3b8387', '111', '79b1b9dc1b338006650c78d3b4919b04', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('d8d747af620bb380dbdc35a7455fc4e4', '111', '73e31667472c841d31b679f9683dab6f', 'AL=ALL', '', '', -3, 0, 4),
('d948c4cac1eb3661f8b1851fd7a53f14', '111', '941af2c99f4f7895b481ab9c3261e4ee', 'AL=ALL', '', '', -1, 1, 1),
('d97e77b2dc836fb534a99b968bc690ed', '111', '941af2c99f4f7895b481ab9c3261e4ee', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('da743f66d381dcb543cf5d3e36b53fd8', '111', '6b2e63b1fd55069fb7cb35fb60f61ed7', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 3),
('da79f56fefe9e649368a3dbb712137bb', '111', '3af1b9d33a52f996f4542d3eb2c9c4a6', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('da954a5ae3dfd5feb21f2e9a8d595a83', '111', '601ad00ff3fd3fbe976ec083282f6785', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('dabd007466743459ec406f7e3a0e55b7', '111', 'e1aa4f724cf384a08db7674e2d834495', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('dad072578421cdb8f0254f6bd5da4ab9', '111', '79b1b9dc1b338006650c78d3b4919b04', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('daeec0abdd971bd4c036ef9277c4798a', '111', '616389b89c369c591118fd7e3014fd69', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('db3b4fe097f22e87f0a5e96d0dc21b2c', '111', '841ef8a50591e500450e46b20f0071cd', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('dbdece88cdad2e674370738c344401e0', '111', 'd5499164a40b3cd4bdbcdc3de63f5dd7', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('dc4b77f008a313abae6d583d5321b095', '111', '09cdd8739a3bc234ad974818e3a67c31', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('dc88e4588948bee1f45fa0174420108c', '111', 'e1aa4f724cf384a08db7674e2d834495', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('dd256d5b5f064c044f76d55ec8992698', '111', 'bf9e70e37e759e2a53a7e8b7191b3c8b', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('dd4f232481bbb6959f0707a4fdfc758b', '..1', 'a3cefde48284f70b2098d7015e987148', 'sdsadas asdas a asdasd as asdas das', '#1', '', 0, 0, 0),
('dd75a6d486e53a9a6a9acb049dbc8a8a', '111', 'a3ab9fc930381fe666d8a1a7cf1035de', 'AL=ALL', '', '', -3, 0, 4),
('dd9202919bf1e62a76816903053e6ecd', '111', 'da6eb119a5946651373257deb33848c7', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('ddaded43073492126a37fd7469fbd8ad', '111', 'ce8e22375753b799f049231ed83562a1', 'AL=ALL', '', '', -3, 0, 4),
('de8942a0e640d18c873bf5f7d106b03f', '111', '40a43df941ecc410777728437cd60fe3', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('de932c9cb9fe69a1b0ec03ff20c4f759', '111', 'd6c71a2943a2a206a8397c7d2756bac7', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('deab1a25c3e0f2d9e91baa1843a5fb30', '111', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 3),
('ded7ff6464f26cdb7478c650abbd9e49', '111', '3318afc1fce28f4e567658e60fec9da2', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('dedaa2273370aaa3119572a6e392b0e9', '111', '7c7840226f4667662ed0c0ffac20474a', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('df6dc00d0ed5ba590e7d26e19ce5cb5d', '111', 'a3cefde48284f70b2098d7015e987148', 'FF=MY_PISTS', '#1', '', -1, 0, 2),
('e092dd0b0a9b17ddc1136616731ab26e', '111', '3318afc1fce28f4e567658e60fec9da2', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('e0ea3f9419d27daa1e1846bf8424cfc6', '111', '7d6653aaa16976e12b6cf7c774f83c1f', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 3),
('e1595db8bc73722157aca40fc03edd91', '111', '97b2c140029b110a0b9dc00a7bd4481a', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('e16215e8de28451c9b6740353c5ea6e6', '111', '0bbb73aee8d860d39c05663c10e55bc8', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('e20eadf1e4455f3e370f5d9e4d4370f3', '111', '0bbb73aee8d860d39c05663c10e55bc8', 'AL=ALL', '', '', -3, 0, 4),
('e21589ff8495118dc8fa337fe3e6d65f', '111', '7c7840226f4667662ed0c0ffac20474a', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('e233bb26fb2af558586f6e4b4d466cfd', '111', 'ffc2fbe41eb237d7e9dd25d974185119', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('e27eb9de7e9918acabd22660dd4bb485', '111', '1b5d5518c800d0929e8d072ff556638b', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('e32ce9ff1cca7039ab9941ecd152df39', '111', '63e6f927fffd663cf6c29323c39ceffd', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('e3a110cb22a2f88e8b02c90a22c0d813', '111', '687c9e9af6d058338b2af10b93a4e596', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('e40057b51073b9d3a8d2e0951b40ec1c', '111', 'e1aa4f724cf384a08db7674e2d834495', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('e47eb5dc8e765725e7c85a1d0c6ca9ea', '111', '6b2e63b1fd55069fb7cb35fb60f61ed7', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('e4ba283f6642a9c34691b61e0d865189', '111', '601ad00ff3fd3fbe976ec083282f6785', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('e528801c2cdc9a89f9fa1cc7daeb43fc', '111', 'e8f894a87f4ee15835cfd6eede3119c6', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('e5472062245cf016660b354ccc1500bd', '111', '66283ee137504a410c2c40a3426770e5', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('e5c36ccda0051ca897c1ad77289b799c', '111', '5fb94b57d704fa3bb4bbe279634c757c', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('e5cd55e06f7cfb05b6afc5472693b6c0', '111', '79b1b9dc1b338006650c78d3b4919b04', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 3),
('e6f746df2552d53426a15150b38e4722', '111', '00', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('e6fa0dbddff24d83fd57d3454c1a5dbe', '111', 'd1f254057a12848c8ac453d752a4a51b', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('e76bfb68a8e6e99d1706ae9a2e590982', '111', '1dd06812b3511f17e047e96d61f66106', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('e780394ac4591880199706c860cc8256', '111', 'ae510ee1e62c1fd7f0235bc13ae89cf1', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('e7c5e295bf37fad26da6d978a1bde54b', '111', 'da6eb119a5946651373257deb33848c7', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('e829eea619ca8f139c114f2e8bd14280', '111', '73e31667472c841d31b679f9683dab6f', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('e84983bbce8c7494049fd0c560695494', '111', 'd090b2fecfda936d0c6bb16eade51d8f', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('e89496b6dd92a97d19a38327dc370144', '111', 'e04541f717da39b450f4155282287e77', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('e8d4362995a3fab1ca4058240efbb62c', '111', '11b25d42972af71f6b9c3c3466b81100', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('e8eea0abae1c2d62b8de8946caffc027', '111', 'e225f8ac45bc47c938af4e683320b1f9', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('e96fdb71b9df94daebd5316a27688941', '111', 'e1aa4f724cf384a08db7674e2d834495', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('e9e765dd90be26623a5f2171d506d8f5', '111', 'fb9683c61faae7377daa18a3a30ffe1d', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('ea47aa0c999a0cd08936030f79f6ed52', '111', '7c36b9595f48cba88c52edeeee42af8d', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('ea64aec12d56504e38e4717d5c6ea963', '111', '86703a439447287a739e3600a3669d29', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('eaeea647dd7ce1e19a3cf15bfc37b5de', '111', '6c3c85ad3057f142d3aa7f34bbe7bbb1', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('eb92af0d5c01e4d83bd4586e713ba99b', '111', 'bdb232ba42790154368b26cd87123485', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('ec8dd1f6dfc9b7296d0d478650672a2b', '111', '0fbef09a987b7a2f6f5aad18a31a5c43', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('ed3b6dc3a1f5a30700b7191299aaa8e8', '111', 'e8f894a87f4ee15835cfd6eede3119c6', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('ed4824a2c507889eb3d52a14e7dd744d', '111', '03df626059c3430fb7316bcca108beb3', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('ed6e23b27f2a59c1eff1c2e56ad0367e', '111', 'e8f894a87f4ee15835cfd6eede3119c6', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('edd486ed665c69d232fd4b870d0d53b7', '111', 'd6c71a2943a2a206a8397c7d2756bac7', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('ede002be62c56b1ebed619633e5cf541', '111', '133a86ce8a41daeff7bf37f618ef770d', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('eeddec19b1e17e5ba1c04bc942e574ef', '111', '1d7ce9781d74c05bc3782f4c06eabdcd', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('ef055636b2fec5bc6e11254d0d4e0810', '111', 'd1f254057a12848c8ac453d752a4a51b', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('ef6fe2e08cce24eef93a907f7a7878eb', '111', '133a86ce8a41daeff7bf37f618ef770d', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('efb753f42a0e29539ed66158d015dc74', '111', 'd0d086686399ca9e71b9e941f672e0c7', 'AL=ALL', '', '', -3, 0, 4),
('effe7ce0845d528f8581f41d96fd44e5', '111', 'a0e2839bbd082ad194f217d364e5a4df', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('f069ab8e4fec742d54d4937f6dfb2fd7', '111', '1df9e06e56cdc06289a2068cf52cd611', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('f070a83effece053da660eb3d6b71086', '111', '5a6097a8f128c86769da4e977927a78d', 'AL=ALL', '', '', -3, 0, 4),
('f094ebe9810036a46f80f6a1841a6609', '111', '33fba81e5307a519b225c97c018ebb80', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('f0f171b02ef72ccc6f584099cfc5ddd2', '111', '63e6f927fffd663cf6c29323c39ceffd', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('f12ce28eac49247114aa7157c8c89b05', '111', '9dc4cd2d6c07049b21ccb1b21bfadbf8', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('f19d845635923d334eb6d5e8682bc87c', '111', 'd5499164a40b3cd4bdbcdc3de63f5dd7', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('f1b8a9a9c9cc729f7073c6bf9f1a9c92', '111', '97b2c140029b110a0b9dc00a7bd4481a', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('f1ded7c14ff26602a3c10cd9f0c76ec8', '111', 'a3cefde48284f70b2098d7015e987148', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('f20a7664ca319b6f8583f7a73af7c885', '111', '6c3c85ad3057f142d3aa7f34bbe7bbb1', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('f2c1dea13f1ecda3117557bfd5401200', '111', '40a43df941ecc410777728437cd60fe3', 'AL=ALL', '', '', -3, 0, 4),
('f331fbf4d0ee38357e4279198913a49a', '111', '7d6653aaa16976e12b6cf7c774f83c1f', 'AL=ALL', '', '', -3, 0, 4),
('f35193614db802126d4ba3f697e48240', '111', 'd45e4bc08f17fb3d692394c277e60281', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('f3a9c97decda46b9462d30c43ad5d904', '111', '6b2e63b1fd55069fb7cb35fb60f61ed7', 'FF=MY_PISTS', '#1', '', -1, 0, 2),
('f3c9c6c9fe723b7c96e73a0c5c953d68', '111', 'b039e473e2ddc2af6a2e045dde934913', 'AL=ALL', '', '', -3, 0, 4),
('f3ffa02cf9d07ac6e77774dac7fa8823', '111', 'e04541f717da39b450f4155282287e77', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('f47596f7a9fbd6cd71dacf6bd11561f6', '111', '941af2c99f4f7895b481ab9c3261e4ee', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('f481082c34105696b974a466f993b9ae', '111', '2116684d8de4ecf5cf21d4c6ad668f98', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('f4ec3aa33988305f91970a7fbd6746a3', '111', 'd1f254057a12848c8ac453d752a4a51b', 'AL=ALL', '', '', -3, 0, 4),
('f511600bb2ec8e8a040954052d502e1c', '111', '586671f519ce766cc5bfaffe8c4c0963', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('f5595e9c570e0f2074e9f03c2e0b3e1a', '111', '0cb6a9fe5ecbce4fdd89aa56e1fe5ac5', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('f564e6485c63618ac45e3910b3c576a9', '111', '11b25d42972af71f6b9c3c3466b81100', 'FF=MY_PISTS', '#1', '', -1, 1, 2),
('f5656bea0b59df690ad83ae14a526386', '111', '0fbef09a987b7a2f6f5aad18a31a5c43', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('f5cb6c31a33fa658d6b3573d0f18732e', '111', '1dd06812b3511f17e047e96d61f66106', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('f6afe53339847b70c2efc4861c7df0f5', '111', 'c002af25af2ff1c0466f8c70f549b0af', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('f716b47b992dbd0484f8fa7969ab5c66', '111', 'bdb232ba42790154368b26cd87123485', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('f79f97b9d409e0cde4f5c050c2503615', '111', '616389b89c369c591118fd7e3014fd69', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('f810c14f4e3a01256b0771d61040e2d3', '111', '40a43df941ecc410777728437cd60fe3', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('f8b69276a7e0db362e24dbe9a98580df', '111', '79b1b9dc1b338006650c78d3b4919b04', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('f8d1840dac182dd2a84a3dffbda2a5b1', '111', 'd1f254057a12848c8ac453d752a4a51b', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('f8e35bb23307ef03841f405f8f8b1e01', '111', '6b2e63b1fd55069fb7cb35fb60f61ed7', 'AL=ALL', '', '', -3, 0, 4),
('f8e72e42debafb102b220c45c1149860', '111', 'ed951d57987e6b7c195ce0ba7d4729d6', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('f92fb852c616f48580b207f86457273a', '111', 'db63cb36f363ff16141f9893a0590683', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('f969fa5852718e04edf9074415da6004', '111', 'e1cf51966342cda9d6d505dff4e2a50a', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('f9fdce3f832cae6aab63171d8bc5eec6', '111', 'bf9e70e37e759e2a53a7e8b7191b3c8b', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('fa4f5ce5014cf0cf26edb1d841078c58', '111', 'c3471df50ab74b88119f5c7d5327131d', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('fa537c899f784e843c17b8e632fed65f', '1..', '7d6653aaa16976e12b6cf7c774f83c1f', 'titi', '#1', '', 0, 0, 0),
('faedeb6488e550c0878780fa6919716a', '111', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('fb5cc2b99419a581c18d27b072534eae', '111', '946c758dc32eef257aed87d879fe41d1', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('fb9a1bde184ad5c5d7b0fc17c15e0fde', '111', 'd0d086686399ca9e71b9e941f672e0c7', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('fbb8443dcfaa9d6350551e4c9fb034a3', '111', '79b1b9dc1b338006650c78d3b4919b04', 'LIS=LISTENING', '#1', '', -2, 0, 5),
('fbc7b65dfee68031d5a9ec96fedb6299', '111', '63e6f927fffd663cf6c29323c39ceffd', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('fbdcbe0afc27e7f72feaef9eb02bca50', '111', '841ef8a50591e500450e46b20f0071cd', 'LIS=LISTENING', '#1', '', -2, 1, 5),
('fc4886dc6f0113a25d70b6829eb7c542', '111', '7c36b9595f48cba88c52edeeee42af8d', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('fc73a09fe71eedab40de348ecbb3988b', '111', '41f48906262cfad9b4c41613ffcc6cb0', 'PRO=PROVIDERS', '#1', '', -2, 0, 3),
('fc7a6f14fb1be90f21484285912ca18e', '111', '9dc4cd2d6c07049b21ccb1b21bfadbf8', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 3),
('fcce3e9047d16d8de2be500ce7a933a2', '111', '5fb94b57d704fa3bb4bbe279634c757c', 'XXX=NEARBY', '#1', '', -2, 0, 1),
('fce70a72328c3a4bf1aeb993dd85e95d', '111', '133a86ce8a41daeff7bf37f618ef770d', 'AL=ALL', '', '', -3, 0, 4),
('fd2119475caeb3e6eec630c3d6cb4e8f', '111', '11b25d42972af71f6b9c3c3466b81100', 'SS=MY_SUIVEURS', '#1', '', -1, 0, 4),
('fd4109346b46f965be7baf6e9a7fa41a', '111', '0bbb73aee8d860d39c05663c10e55bc8', 'SRV=MY_SERVICES', '#1', '', -2, 1, 2),
('fd914d78cd123b8e8a8003b5e773689a', '111', '7c7840226f4667662ed0c0ffac20474a', 'AL=ALL', '', '', -3, 0, 4),
('fdbaefad44ffd370fee04fc8c48bf840', '111', '6c3c85ad3057f142d3aa7f34bbe7bbb1', 'CC=MY_COLLS', '#1', '', -1, 1, 3),
('fdeb3d3ea95970280958da5fcf22f398', '111', '41f48906262cfad9b4c41613ffcc6cb0', 'AL=ALL', '', '', -3, 0, 4),
('fe42e5a618d32aedc4027343c349a1c1', '111', '5a6097a8f128c86769da4e977927a78d', 'CC=MY_COLLS', '#1', '', -1, 0, 4),
('fe4eaf33b17517f81815d5fb4f413136', '111', '63e6f927fffd663cf6c29323c39ceffd', 'AL=ALL', '', '', -3, 0, 4),
('fe5167be7afebf36ad46b57165f564d2', '111', '894b122ddbc96e7048df42f5a4e7e807', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('ff0c1333dd60a704330dcce5949c8f4e', '111', '941af2c99f4f7895b481ab9c3261e4ee', 'LIS=LISTENING', '#1', '', -2, 0, 5),
('ff113097c9a313e6a50a2edcbae1b223', '111', '79b1b9dc1b338006650c78d3b4919b04', 'CC=MY_COLLS', '#1', '', -1, 0, 4),
('ff2eb57eb4fb7a6fafec4e900be2e474', '111', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'ASK=ASKERS', '#1', '', -2, 0, 4),
('ffa5ef58dd6626dd984fb15b8e7c58b1', '111', '41f48906262cfad9b4c41613ffcc6cb0', 'ASK=ASKERS', '#1', '', -2, 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `filter_usr`
--

CREATE TABLE `filter_usr` (
  `id_filsma_filusr` varchar(32) NOT NULL,
  `id_usr_filusr` varchar(32) NOT NULL,
  PRIMARY KEY (`id_filsma_filusr`,`id_usr_filusr`),
  KEY `id_filsma_filusr_1` (`id_filsma_filusr`) USING BTREE,
  KEY `filter_usr_ibfk_2` (`id_usr_filusr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filter_usr`
--

INSERT INTO `filter_usr` (`id_filsma_filusr`, `id_usr_filusr`) VALUES
('0cb029f015db4e25afc7951c75166ecf', '48ae9648a43e3633ae647c2583d84116'),
('52ac6f1871023dc59269870dd5c7856b', 'a3cefde48284f70b2098d7015e987148'),
('8cc8d5cd548ed91868d51829a7e4401d', 'd1e3e6d21ed317e2d0495f946c5c1019'),
('fa537c899f784e843c17b8e632fed65f', '48ae9648a43e3633ae647c2583d84116');

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Activity`
--

CREATE TABLE `GDN_Activity` (
  `ActivityID` int(11) NOT NULL AUTO_INCREMENT,
  `CommentActivityID` int(11) DEFAULT NULL,
  `ActivityTypeID` int(11) NOT NULL,
  `ActivityUserID` int(11) DEFAULT NULL,
  `RegardingUserID` int(11) DEFAULT NULL,
  `Story` text COLLATE utf8_unicode_ci,
  `Route` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CountComments` int(11) NOT NULL DEFAULT '0',
  `InsertUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Emailed` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ActivityID`),
  KEY `FK_Activity_CommentActivityID` (`CommentActivityID`),
  KEY `FK_Activity_ActivityUserID` (`ActivityUserID`),
  KEY `FK_Activity_RegardingUserID` (`RegardingUserID`),
  KEY `FK_Activity_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `GDN_Activity`
--

INSERT INTO `GDN_Activity` (`ActivityID`, `CommentActivityID`, `ActivityTypeID`, `ActivityUserID`, `RegardingUserID`, `Story`, `Route`, `CountComments`, `InsertUserID`, `DateInserted`, `InsertIPAddress`, `Emailed`) VALUES
(1, NULL, 2, 1, NULL, 'Welcome to Vanilla!', NULL, 0, NULL, '2012-10-28 14:20:43', '127.0.0.1', 0),
(2, NULL, 5, 1, 2, 'Welcome Aboard!', NULL, 0, 1, '2012-10-28 14:29:03', '127.0.0.1', 0),
(3, NULL, 15, 2, 1, NULL, '/messages/1#1', 0, 2, '2012-10-28 14:33:04', '127.0.0.1', 2),
(4, NULL, 14, 1, 2, 'bonjour shingo', '/profile/shingo', 0, 2, '2012-10-28 16:12:06', '127.0.0.1', 0),
(5, NULL, 7, 2, NULL, '@shingo hello', NULL, 0, 2, '2012-10-28 16:14:43', '127.0.0.1', 0),
(6, 4, 10, 1, NULL, 'wat''s this''', NULL, 0, 1, '2012-10-30 23:50:18', '127.0.0.1', 2),
(7, NULL, 8, 1, NULL, '<img src="http://vanilla.loc/uploads/userpics/914/n2MUO11RX75B1.png" alt="Thumbnail" />', NULL, 0, 1, '2012-10-30 23:54:00', '127.0.0.1', 0),
(8, NULL, 17, 1, NULL, '<a href="/forum/discussion/1/titre-toto">Titre toto</a>', NULL, 0, 1, '2012-11-02 13:33:54', '::1', 0),
(9, NULL, 17, 1, NULL, '<a href="/forum/discussion/2/titre-2">Titre 2</a>', NULL, 0, 1, '2012-11-02 13:40:39', '::1', 0),
(10, 4, 10, 8, NULL, 'dsfsfs', NULL, 0, 8, '2012-11-03 10:44:50', '::1', 2),
(11, NULL, 14, 2, 8, 'sadasdsdasd', '/profile/selim', 0, 8, '2012-11-03 10:46:31', '::1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `GDN_ActivityType`
--

CREATE TABLE `GDN_ActivityType` (
  `ActivityTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `AllowComments` tinyint(4) NOT NULL DEFAULT '0',
  `ShowIcon` tinyint(4) NOT NULL DEFAULT '0',
  `ProfileHeadline` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FullHeadline` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `RouteCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Notify` tinyint(4) NOT NULL DEFAULT '0',
  `Public` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ActivityTypeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=23 ;

--
-- Dumping data for table `GDN_ActivityType`
--

INSERT INTO `GDN_ActivityType` (`ActivityTypeID`, `Name`, `AllowComments`, `ShowIcon`, `ProfileHeadline`, `FullHeadline`, `RouteCode`, `Notify`, `Public`) VALUES
(1, 'SignIn', 0, 0, '%1$s signed in.', '%1$s signed in.', NULL, 0, 1),
(2, 'Join', 1, 0, '%1$s joined.', '%1$s joined.', NULL, 0, 1),
(3, 'JoinInvite', 1, 0, '%1$s accepted %4$s invitation for membership.', '%1$s accepted %4$s invitation for membership.', NULL, 0, 1),
(4, 'JoinApproved', 1, 0, '%1$s approved %4$s membership application.', '%1$s approved %4$s membership application.', NULL, 0, 1),
(5, 'JoinCreated', 1, 0, '%1$s created an account for %3$s.', '%1$s created an account for %3$s.', NULL, 0, 1),
(6, 'AboutUpdate', 1, 0, '%1$s updated %6$s profile.', '%1$s updated %6$s profile.', NULL, 0, 1),
(7, 'WallComment', 1, 1, '%1$s wrote:', '%1$s wrote on %4$s %5$s.', NULL, 0, 1),
(8, 'PictureChange', 1, 0, '%1$s changed %6$s profile picture.', '%1$s changed %6$s profile picture.', NULL, 0, 1),
(9, 'RoleChange', 1, 0, '%1$s changed %4$s permissions.', '%1$s changed %4$s permissions.', NULL, 1, 1),
(10, 'ActivityComment', 0, 1, '%1$s', '%1$s commented on %4$s %8$s.', 'activity', 1, 1),
(11, 'Import', 0, 0, '%1$s imported data.', '%1$s imported data.', NULL, 1, 0),
(12, 'Banned', 0, 0, '%1$s banned %3$s.', '%1$s banned %3$s.', NULL, 0, 1),
(13, 'Unbanned', 0, 0, '%1$s un-banned %3$s.', '%1$s un-banned %3$s.', NULL, 0, 1),
(14, 'WallPost', 1, 1, '%3$s wrote:', '%3$s wrote on %2$s %5$s.', NULL, 0, 1),
(15, 'ConversationMessage', 0, 0, '%1$s sent you a %8$s.', '%1$s sent you a %8$s.', 'message', 1, 0),
(16, 'AddedToConversation', 0, 0, '%1$s added %3$s to a %8$s.', '%1$s added %3$s to a %8$s.', 'conversation', 1, 0),
(17, 'NewDiscussion', 0, 0, '%1$s started a %8$s.', '%1$s started a %8$s.', 'discussion', 0, 0),
(18, 'NewComment', 0, 0, '%1$s commented on a discussion.', '%1$s commented on a discussion.', 'discussion', 0, 0),
(19, 'DiscussionComment', 0, 0, '%1$s commented on %4$s %8$s.', '%1$s commented on %4$s %8$s.', 'discussion', 1, 0),
(20, 'DiscussionMention', 0, 0, '%1$s mentioned %3$s in a %8$s.', '%1$s mentioned %3$s in a %8$s.', 'discussion', 1, 0),
(21, 'CommentMention', 0, 0, '%1$s mentioned %3$s in a %8$s.', '%1$s mentioned %3$s in a %8$s.', 'comment', 1, 0),
(22, 'BookmarkComment', 0, 0, '%1$s commented on your %8$s.', '%1$s commented on your %8$s.', 'bookmarked discussion', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `GDN_AnalyticsLocal`
--

CREATE TABLE `GDN_AnalyticsLocal` (
  `TimeSlot` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `Views` int(11) DEFAULT NULL,
  UNIQUE KEY `UX_AnalyticsLocal` (`TimeSlot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `GDN_AnalyticsLocal`
--

INSERT INTO `GDN_AnalyticsLocal` (`TimeSlot`, `Views`) VALUES
('20121125', 4),
('20121202', 3);

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Ban`
--

CREATE TABLE `GDN_Ban` (
  `BanID` int(11) NOT NULL AUTO_INCREMENT,
  `BanType` enum('IPAddress','Name','Email') COLLATE utf8_unicode_ci NOT NULL,
  `BanValue` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CountUsers` int(10) unsigned NOT NULL DEFAULT '0',
  `CountBlockedRegistrations` int(10) unsigned NOT NULL DEFAULT '0',
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  PRIMARY KEY (`BanID`),
  UNIQUE KEY `UX_Ban` (`BanType`,`BanValue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Category`
--

CREATE TABLE `GDN_Category` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `ParentCategoryID` int(11) DEFAULT NULL,
  `TreeLeft` int(11) DEFAULT NULL,
  `TreeRight` int(11) DEFAULT NULL,
  `Depth` int(11) DEFAULT NULL,
  `CountDiscussions` int(11) NOT NULL DEFAULT '0',
  `CountComments` int(11) NOT NULL DEFAULT '0',
  `DateMarkedRead` datetime DEFAULT NULL,
  `AllowDiscussions` tinyint(4) NOT NULL DEFAULT '1',
  `Archived` tinyint(4) NOT NULL DEFAULT '0',
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `UrlCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Sort` int(11) DEFAULT NULL,
  `PermissionCategoryID` int(11) NOT NULL DEFAULT '-1',
  `InsertUserID` int(11) NOT NULL,
  `UpdateUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `LastCommentID` int(11) DEFAULT NULL,
  `LastDiscussionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`),
  KEY `FK_Category_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `GDN_Category`
--

INSERT INTO `GDN_Category` (`CategoryID`, `ParentCategoryID`, `TreeLeft`, `TreeRight`, `Depth`, `CountDiscussions`, `CountComments`, `DateMarkedRead`, `AllowDiscussions`, `Archived`, `Name`, `UrlCode`, `Description`, `Sort`, `PermissionCategoryID`, `InsertUserID`, `UpdateUserID`, `DateInserted`, `DateUpdated`, `LastCommentID`, `LastDiscussionID`) VALUES
(-1, NULL, 1, 6, 0, 0, 0, NULL, 1, 0, 'Root', 'root', 'Root of category tree. Users should never see this.', 1, -1, 1, 1, '2012-10-28 14:20:43', '2012-10-28 14:20:43', NULL, NULL),
(1, -1, 4, 5, 1, 1, 1, NULL, 1, 0, 'General', 'general', 'General discussions', 4, -1, 1, 1, '2012-10-28 14:20:43', '2012-10-28 14:20:43', NULL, 1),
(2, -1, 2, 3, 1, 1, 2, NULL, 1, 0, 'Category 1', 'category-1', '', 2, -1, 1, 1, '2012-11-02 13:39:37', '2012-11-02 13:39:37', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Comment`
--

CREATE TABLE `GDN_Comment` (
  `CommentID` int(11) NOT NULL AUTO_INCREMENT,
  `DiscussionID` int(11) NOT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `UpdateUserID` int(11) DEFAULT NULL,
  `DeleteUserID` int(11) DEFAULT NULL,
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateInserted` datetime DEFAULT NULL,
  `DateDeleted` datetime DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `InsertIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UpdateIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Flag` tinyint(4) NOT NULL DEFAULT '0',
  `Score` float DEFAULT NULL,
  `Attributes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`CommentID`),
  KEY `FK_Comment_DiscussionID` (`DiscussionID`),
  KEY `FK_Comment_InsertUserID` (`InsertUserID`),
  KEY `FK_Comment_DateInserted` (`DateInserted`),
  FULLTEXT KEY `TX_Comment` (`Body`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Conversation`
--

CREATE TABLE `GDN_Conversation` (
  `ConversationID` int(11) NOT NULL AUTO_INCREMENT,
  `Subject` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Contributors` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FirstMessageID` int(11) DEFAULT NULL,
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime DEFAULT NULL,
  `InsertIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UpdateUserID` int(11) NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `UpdateIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CountMessages` int(11) NOT NULL DEFAULT '0',
  `LastMessageID` int(11) DEFAULT NULL,
  `RegardingID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ConversationID`),
  KEY `FK_Conversation_FirstMessageID` (`FirstMessageID`),
  KEY `FK_Conversation_InsertUserID` (`InsertUserID`),
  KEY `FK_Conversation_DateInserted` (`DateInserted`),
  KEY `FK_Conversation_UpdateUserID` (`UpdateUserID`),
  KEY `IX_Conversation_RegardingID` (`RegardingID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `GDN_Conversation`
--

INSERT INTO `GDN_Conversation` (`ConversationID`, `Subject`, `Contributors`, `FirstMessageID`, `InsertUserID`, `DateInserted`, `InsertIPAddress`, `UpdateUserID`, `DateUpdated`, `UpdateIPAddress`, `CountMessages`, `LastMessageID`, `RegardingID`) VALUES
(1, NULL, 'a:2:{i:0;s:1:"1";i:1;s:1:"2";}', 1, 2, '2012-10-28 14:33:04', '127.0.0.1', 2, '2012-10-28 14:33:04', '127.0.0.1', 1, 1, NULL),
(2, NULL, 'a:1:{i:0;s:1:"1";}', 2, 1, '2012-10-31 00:01:10', '127.0.0.1', 1, '2012-10-31 00:01:32', '127.0.0.1', 2, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `GDN_ConversationMessage`
--

CREATE TABLE `GDN_ConversationMessage` (
  `MessageID` int(11) NOT NULL AUTO_INCREMENT,
  `ConversationID` int(11) NOT NULL,
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MessageID`),
  KEY `FK_ConversationMessage_ConversationID` (`ConversationID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `GDN_ConversationMessage`
--

INSERT INTO `GDN_ConversationMessage` (`MessageID`, `ConversationID`, `Body`, `Format`, `InsertUserID`, `DateInserted`, `InsertIPAddress`) VALUES
(1, 1, 'hi shingo', 'Html', 2, '2012-10-28 14:33:04', '127.0.0.1'),
(2, 2, 'rererte', 'Html', 1, '2012-10-31 00:01:10', '127.0.0.1'),
(3, 2, 'bnjour', 'Html', 1, '2012-10-31 00:01:32', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Discussion`
--

CREATE TABLE `GDN_Discussion` (
  `DiscussionID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ForeignID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CategoryID` int(11) NOT NULL,
  `InsertUserID` int(11) NOT NULL,
  `UpdateUserID` int(11) NOT NULL,
  `LastCommentID` int(11) DEFAULT NULL,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CountComments` int(11) NOT NULL DEFAULT '1',
  `CountBookmarks` int(11) DEFAULT NULL,
  `CountViews` int(11) NOT NULL DEFAULT '1',
  `Closed` tinyint(4) NOT NULL DEFAULT '0',
  `Announce` tinyint(4) NOT NULL DEFAULT '0',
  `Sink` tinyint(4) NOT NULL DEFAULT '0',
  `DateInserted` datetime DEFAULT NULL,
  `DateUpdated` datetime NOT NULL,
  `InsertIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UpdateIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateLastComment` datetime DEFAULT NULL,
  `LastCommentUserID` int(11) DEFAULT NULL,
  `Score` float DEFAULT NULL,
  `Attributes` text COLLATE utf8_unicode_ci,
  `RegardingID` int(11) DEFAULT NULL,
  PRIMARY KEY (`DiscussionID`),
  KEY `IX_Discussion_Type` (`Type`),
  KEY `IX_Discussion_ForeignID` (`ForeignID`),
  KEY `FK_Discussion_CategoryID` (`CategoryID`),
  KEY `FK_Discussion_InsertUserID` (`InsertUserID`),
  KEY `IX_Discussion_DateLastComment` (`DateLastComment`),
  KEY `IX_Discussion_RegardingID` (`RegardingID`),
  FULLTEXT KEY `TX_Discussion` (`Name`,`Body`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `GDN_Discussion`
--

INSERT INTO `GDN_Discussion` (`DiscussionID`, `Type`, `ForeignID`, `CategoryID`, `InsertUserID`, `UpdateUserID`, `LastCommentID`, `Name`, `Body`, `Format`, `Tags`, `CountComments`, `CountBookmarks`, `CountViews`, `Closed`, `Announce`, `Sink`, `DateInserted`, `DateUpdated`, `InsertIPAddress`, `UpdateIPAddress`, `DateLastComment`, `LastCommentUserID`, `Score`, `Attributes`, `RegardingID`) VALUES
(1, NULL, NULL, 1, 1, 1, NULL, 'Titre toto', 'Category 1', 'Html', NULL, 1, NULL, 1, 0, 0, 0, '2012-11-02 13:33:54', '2012-11-02 13:33:54', '::1', '::1', '2012-11-02 13:33:54', NULL, NULL, NULL, NULL),
(2, NULL, NULL, 2, 1, 1, NULL, 'Titre 2', 'dsf dsfdsfhds dsfgsdf dsfsdfdsf', 'Html', NULL, 1, NULL, 1, 0, 0, 0, '2012-11-02 13:40:39', '2012-11-02 13:40:39', '::1', '::1', '2012-11-02 13:41:20', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Draft`
--

CREATE TABLE `GDN_Draft` (
  `DraftID` int(11) NOT NULL AUTO_INCREMENT,
  `DiscussionID` int(11) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `InsertUserID` int(11) NOT NULL,
  `UpdateUserID` int(11) NOT NULL,
  `Name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Closed` tinyint(4) NOT NULL DEFAULT '0',
  `Announce` tinyint(4) NOT NULL DEFAULT '0',
  `Sink` tinyint(4) NOT NULL DEFAULT '0',
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`DraftID`),
  KEY `FK_Draft_DiscussionID` (`DiscussionID`),
  KEY `FK_Draft_CategoryID` (`CategoryID`),
  KEY `FK_Draft_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Flag`
--

CREATE TABLE `GDN_Flag` (
  `DiscussionID` int(11) DEFAULT NULL,
  `InsertUserID` int(11) NOT NULL,
  `InsertName` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `AuthorID` int(11) NOT NULL,
  `AuthorName` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `ForeignURL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ForeignID` int(11) NOT NULL,
  `ForeignType` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `Comment` text COLLATE utf8_unicode_ci NOT NULL,
  `DateInserted` datetime NOT NULL,
  KEY `FK_Flag_InsertUserID` (`InsertUserID`),
  KEY `FK_Flag_ForeignURL` (`ForeignURL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Invitation`
--

CREATE TABLE `GDN_Invitation` (
  `InvitationID` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `Code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `AcceptedUserID` int(11) DEFAULT NULL,
  PRIMARY KEY (`InvitationID`),
  KEY `FK_Invitation_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Log`
--

CREATE TABLE `GDN_Log` (
  `LogID` int(11) NOT NULL AUTO_INCREMENT,
  `Operation` enum('Delete','Edit','Spam','Moderate','Error') COLLATE utf8_unicode_ci NOT NULL,
  `RecordType` enum('Discussion','Comment','User','Registration','Activity') COLLATE utf8_unicode_ci NOT NULL,
  `RecordID` int(11) DEFAULT NULL,
  `RecordUserID` int(11) DEFAULT NULL,
  `RecordDate` datetime NOT NULL,
  `RecordIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OtherUserIDs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `ParentRecordID` int(11) DEFAULT NULL,
  `Data` text COLLATE utf8_unicode_ci,
  `CountGroup` int(11) DEFAULT NULL,
  PRIMARY KEY (`LogID`),
  KEY `IX_Log_RecordType` (`RecordType`),
  KEY `IX_Log_RecordID` (`RecordID`),
  KEY `IX_Log_RecordIPAddress` (`RecordIPAddress`),
  KEY `IX_Log_ParentRecordID` (`ParentRecordID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `GDN_Log`
--

INSERT INTO `GDN_Log` (`LogID`, `Operation`, `RecordType`, `RecordID`, `RecordUserID`, `RecordDate`, `RecordIPAddress`, `InsertUserID`, `DateInserted`, `InsertIPAddress`, `OtherUserIDs`, `DateUpdated`, `ParentRecordID`, `Data`, `CountGroup`) VALUES
(1, 'Delete', 'Comment', 1, 1, '2012-11-02 13:41:20', '::1', 1, '2012-11-02 13:41:34', '::1', NULL, NULL, 2, 'a:15:{s:9:"CommentID";s:1:"1";s:12:"DiscussionID";s:1:"2";s:12:"InsertUserID";s:1:"1";s:12:"UpdateUserID";N;s:12:"DeleteUserID";N;s:4:"Body";s:25:"J''ai un probleme avec toi";s:6:"Format";s:4:"Html";s:12:"DateInserted";s:19:"2012-11-02 13:41:20";s:11:"DateDeleted";N;s:11:"DateUpdated";N;s:15:"InsertIPAddress";s:3:"::1";s:15:"UpdateIPAddress";N;s:4:"Flag";s:1:"0";s:5:"Score";N;s:10:"Attributes";N;}', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Message`
--

CREATE TABLE `GDN_Message` (
  `MessageID` int(11) NOT NULL AUTO_INCREMENT,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AllowDismiss` tinyint(4) NOT NULL DEFAULT '1',
  `Enabled` tinyint(4) NOT NULL DEFAULT '1',
  `Application` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Controller` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AssetTarget` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CssClass` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`MessageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Permission`
--

CREATE TABLE `GDN_Permission` (
  `PermissionID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleID` int(11) NOT NULL DEFAULT '0',
  `JunctionTable` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `JunctionColumn` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `JunctionID` int(11) DEFAULT NULL,
  `Garden.Email.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Settings.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Settings.View` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Routes.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Messages.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Applications.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Plugins.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Themes.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.SignIn.Allow` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Registration.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Applicants.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Roles.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Users.Add` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Users.Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Users.Delete` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Users.Approve` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Activity.Delete` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Activity.View` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Profiles.View` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Profiles.Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Moderation.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.AdvancedNotifications.Allow` tinyint(4) NOT NULL DEFAULT '0',
  `Conversations.Moderation.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Settings.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Categories.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Spam.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.View` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Add` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Announce` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Sink` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Close` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Delete` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Comments.Add` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Comments.Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Comments.Delete` tinyint(4) NOT NULL DEFAULT '0',
  `Plugins.Flagging.Notify` tinyint(4) NOT NULL DEFAULT '0',
  `Plugins.Van2Shout.View` tinyint(4) NOT NULL DEFAULT '0',
  `Plugins.Van2Shout.Post` tinyint(4) NOT NULL DEFAULT '0',
  `Plugins.Van2Shout.Delete` tinyint(4) NOT NULL DEFAULT '0',
  `Plugins.Van2Shout.ViewHistory` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PermissionID`),
  KEY `FK_Permission_RoleID` (`RoleID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `GDN_Permission`
--

INSERT INTO `GDN_Permission` (`PermissionID`, `RoleID`, `JunctionTable`, `JunctionColumn`, `JunctionID`, `Garden.Email.Manage`, `Garden.Settings.Manage`, `Garden.Settings.View`, `Garden.Routes.Manage`, `Garden.Messages.Manage`, `Garden.Applications.Manage`, `Garden.Plugins.Manage`, `Garden.Themes.Manage`, `Garden.SignIn.Allow`, `Garden.Registration.Manage`, `Garden.Applicants.Manage`, `Garden.Roles.Manage`, `Garden.Users.Add`, `Garden.Users.Edit`, `Garden.Users.Delete`, `Garden.Users.Approve`, `Garden.Activity.Delete`, `Garden.Activity.View`, `Garden.Profiles.View`, `Garden.Profiles.Edit`, `Garden.Moderation.Manage`, `Garden.AdvancedNotifications.Allow`, `Conversations.Moderation.Manage`, `Vanilla.Settings.Manage`, `Vanilla.Categories.Manage`, `Vanilla.Spam.Manage`, `Vanilla.Discussions.View`, `Vanilla.Discussions.Add`, `Vanilla.Discussions.Edit`, `Vanilla.Discussions.Announce`, `Vanilla.Discussions.Sink`, `Vanilla.Discussions.Close`, `Vanilla.Discussions.Delete`, `Vanilla.Comments.Add`, `Vanilla.Comments.Edit`, `Vanilla.Comments.Delete`, `Plugins.Flagging.Notify`, `Plugins.Van2Shout.View`, `Plugins.Van2Shout.Post`, `Plugins.Van2Shout.Delete`, `Plugins.Van2Shout.ViewHistory`) VALUES
(1, 0, NULL, NULL, NULL, 2, 2, 2, 2, 2, 2, 2, 2, 3, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2),
(2, 2, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 3, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 4, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 8, NULL, NULL, NULL, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 32, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 16, NULL, NULL, NULL, 0, 1, 0, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0),
(8, 0, 'Category', 'PermissionCategoryID', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 2, 2, 2, 2, 2, 3, 2, 2, 0, 0, 0, 0, 0),
(9, 2, 'Category', 'PermissionCategoryID', -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 3, 'Category', 'PermissionCategoryID', -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, 4, 'Category', 'PermissionCategoryID', -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 8, 'Category', 'PermissionCategoryID', -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0),
(13, 32, 'Category', 'PermissionCategoryID', -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(14, 16, 'Category', 'PermissionCategoryID', -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Photo`
--

CREATE TABLE `GDN_Photo` (
  `PhotoID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  PRIMARY KEY (`PhotoID`),
  KEY `FK_Photo_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Regarding`
--

CREATE TABLE `GDN_Regarding` (
  `RegardingID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  `ForeignType` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ForeignID` int(11) NOT NULL,
  `OriginalContent` text COLLATE utf8_unicode_ci,
  `ParentType` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ParentID` int(11) DEFAULT NULL,
  `ForeignURL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Comment` text COLLATE utf8_unicode_ci NOT NULL,
  `Reports` int(11) DEFAULT NULL,
  PRIMARY KEY (`RegardingID`),
  KEY `FK_Regarding_Type` (`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Role`
--

CREATE TABLE `GDN_Role` (
  `RoleID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Sort` int(11) DEFAULT NULL,
  `Deletable` tinyint(4) NOT NULL DEFAULT '1',
  `CanSession` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=33 ;

--
-- Dumping data for table `GDN_Role`
--

INSERT INTO `GDN_Role` (`RoleID`, `Name`, `Description`, `Sort`, `Deletable`, `CanSession`) VALUES
(2, 'Guest', 'Guests can only view content. Anyone browsing the site who is not signed in is considered to be a "Guest".', 1, 0, 0),
(3, 'Confirm Email', 'Users must confirm their emails before becoming full members. They get assigned to this role.', 6, 1, 1),
(4, 'Applicant', 'Users who have applied for membership, but have not yet been accepted. They have the same permissions as guests.', 2, 0, 1),
(8, 'Member', 'Members can participate in discussions.', 3, 1, 1),
(16, 'Administrator', 'Administrators have permission to do anything.', 5, 1, 1),
(32, 'Moderator', 'Moderators have permission to edit most content.', 4, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Session`
--

CREATE TABLE `GDN_Session` (
  `SessionID` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `UserID` int(11) NOT NULL DEFAULT '0',
  `DateInserted` datetime NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `TransientKey` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `Attributes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SessionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `GDN_Session`
--

INSERT INTO `GDN_Session` (`SessionID`, `UserID`, `DateInserted`, `DateUpdated`, `TransientKey`, `Attributes`) VALUES
('b1069fed44cacdec2e02c412c0c745dc', 1, '2012-11-02 13:41:20', '2012-11-02 13:41:20', 'cd6e1453e7cc', 'a:0:{}');

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Shoutbox`
--

CREATE TABLE `GDN_Shoutbox` (
  `EntryID` int(255) NOT NULL AUTO_INCREMENT,
  `Username` varchar(256) DEFAULT NULL,
  `data` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`EntryID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `GDN_Shoutbox`
--

INSERT INTO `GDN_Shoutbox` (`EntryID`, `Username`, `data`) VALUES
(4, 'System', 'Database has been cleared');

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Spammer`
--

CREATE TABLE `GDN_Spammer` (
  `UserID` int(11) NOT NULL,
  `CountSpam` smallint(5) unsigned NOT NULL DEFAULT '0',
  `CountDeletedSpam` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Tag`
--

CREATE TABLE `GDN_Tag` (
  `TagID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `CountDiscussions` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TagID`),
  UNIQUE KEY `UX_Tag` (`Name`),
  KEY `IX_Tag_Type` (`Type`),
  KEY `FK_Tag_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_TagDiscussion`
--

CREATE TABLE `GDN_TagDiscussion` (
  `TagID` int(11) NOT NULL,
  `DiscussionID` int(11) NOT NULL,
  PRIMARY KEY (`TagID`,`DiscussionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_User`
--

CREATE TABLE `GDN_User` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varbinary(100) NOT NULL,
  `HashMethod` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `About` text COLLATE utf8_unicode_ci,
  `Email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ShowEmail` tinyint(4) NOT NULL DEFAULT '0',
  `Gender` enum('m','f') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'm',
  `CountVisits` int(11) NOT NULL DEFAULT '0',
  `CountInvitations` int(11) NOT NULL DEFAULT '0',
  `CountNotifications` int(11) DEFAULT NULL,
  `InviteUserID` int(11) DEFAULT NULL,
  `DiscoveryText` text COLLATE utf8_unicode_ci,
  `Preferences` text COLLATE utf8_unicode_ci,
  `Permissions` text COLLATE utf8_unicode_ci,
  `Attributes` text COLLATE utf8_unicode_ci,
  `DateSetInvitations` datetime DEFAULT NULL,
  `DateOfBirth` datetime DEFAULT NULL,
  `DateFirstVisit` datetime DEFAULT NULL,
  `DateLastActive` datetime DEFAULT NULL,
  `LastIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdateIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HourOffset` int(11) NOT NULL DEFAULT '0',
  `Score` float DEFAULT NULL,
  `Admin` tinyint(4) NOT NULL DEFAULT '0',
  `Banned` tinyint(4) NOT NULL DEFAULT '0',
  `Deleted` tinyint(4) NOT NULL DEFAULT '0',
  `CountUnreadConversations` int(11) DEFAULT NULL,
  `CountDiscussions` int(11) DEFAULT NULL,
  `CountUnreadDiscussions` int(11) DEFAULT NULL,
  `CountComments` int(11) DEFAULT NULL,
  `CountDrafts` int(11) DEFAULT NULL,
  `CountBookmarks` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  KEY `FK_User_Name` (`Name`),
  KEY `IX_User_Email` (`Email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

--
-- Dumping data for table `GDN_User`
--

INSERT INTO `GDN_User` (`UserID`, `Name`, `Password`, `HashMethod`, `Photo`, `About`, `Email`, `ShowEmail`, `Gender`, `CountVisits`, `CountInvitations`, `CountNotifications`, `InviteUserID`, `DiscoveryText`, `Preferences`, `Permissions`, `Attributes`, `DateSetInvitations`, `DateOfBirth`, `DateFirstVisit`, `DateLastActive`, `LastIPAddress`, `DateInserted`, `InsertIPAddress`, `DateUpdated`, `UpdateIPAddress`, `HourOffset`, `Score`, `Admin`, `Banned`, `Deleted`, `CountUnreadConversations`, `CountDiscussions`, `CountUnreadDiscussions`, `CountComments`, `CountDrafts`, `CountBookmarks`) VALUES
(1, 'shingo', '$P$BCc.3OGfU6f1orFZCtY/vmF8sPa1f81', 'Vanilla', 'userpics/914/2MUO11RX75B1.png', NULL, 'yoomken@gmail.com', 0, 'm', 4, 0, 0, NULL, NULL, 'a:2:{s:16:"PreviewThemeName";s:0:"";s:18:"PreviewThemeFolder";s:0:"";}', '', 'a:2:{s:12:"TransientKey";s:12:"70ZBRIN1G76U";s:34:"Notifications.InformLastActivityID";s:1:"3";}', NULL, '1975-09-16 00:00:00', '2012-10-28 14:20:43', '2012-11-02 16:10:12', '127.0.0.1', '2012-10-28 14:20:43', NULL, '2012-11-02 16:10:12', '127.0.0.1', 1, NULL, 1, 0, 0, 0, 2, NULL, 0, NULL, NULL),
(2, 'sara', '$P$B1v3h1EU3h6XH8xdu5vQnumXwaCAZ11', 'Vanilla', NULL, 'Je suis ce que je suis.', 'selim.pousse@gmail.com', 0, 'm', 1, 0, 0, NULL, NULL, 'a:11:{s:17:"Popup.WallComment";s:1:"1";s:21:"Popup.ActivityComment";s:1:"1";s:25:"Email.ConversationMessage";s:1:"1";s:25:"Email.AddedToConversation";s:1:"1";s:25:"Popup.ConversationMessage";s:1:"1";s:25:"Popup.AddedToConversation";s:1:"1";s:21:"Email.BookmarkComment";s:1:"1";s:23:"Popup.DiscussionComment";s:1:"1";s:23:"Popup.DiscussionMention";s:1:"1";s:20:"Popup.CommentMention";s:1:"1";s:21:"Popup.BookmarkComment";s:1:"1";}', '', 'a:1:{s:12:"TransientKey";s:12:"1H4OUNOIP0AY";}', NULL, NULL, '2012-10-28 14:29:03', '2013-05-31 10:34:19', '127.0.0.1', '2012-10-28 14:29:03', NULL, '2012-11-03 20:18:39', '127.0.0.1', 1, NULL, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(6, 'specialone', '8dda369b75eb715d71c047ee092dd084ecb7232e', 'yoomken', '8f92bf76c33e582879e2f28db12dc778', 'Je suis ce que je suis.', 'yoomken.test@gmail.com', 0, '', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-11-26 20:01:47', '2013-05-30 16:50:05', NULL, '2012-11-02 16:10:12', NULL, '2012-11-02 16:10:12', '127.0.0.1', 1, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 'Kim', '71c693162120c30081793dc18fe09d2df9c27b11', 'yoomken', '3f5a116725f716f30b605fa138b666ef', 'Peintre indépendant depuis 4 ans cherche missions de courtes ou longes durées, pour tous types de travaux dans la peinture. Travail seul et propre. Devis gratuit sur r.d.v, region Iles de France.', 'yoomken.test@gmail.com', 0, 'm', 7, 0, 0, NULL, NULL, 'a:1:{s:13:"Authenticator";s:0:"";}', '', 'a:1:{s:12:"TransientKey";s:12:"EH5L5TUK41CB";}', NULL, '1981-07-27 00:00:00', '2011-11-23 20:40:02', '2013-05-31 10:58:17', '90.46.103.138', '2012-11-02 16:10:12', NULL, '2012-11-03 10:39:09', '::1', 1, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 'shingo', '1dee55489a07dc49b6195144a64e89e103ef1967', 'yoomken', NULL, 'Je suis ce hsdjfhsdfjsd fj sdfhjsd fjsdhfjsd f dsfhsdjfsdf dsh fjsd fhsdj fsdhf sdjf jsd que je suis.Je suis ce hsdjfhsdfjsd fj sdfhjsd fjsdhfjsd f dsfhsdjfsdf dsh fjsd fhsdj fsdhf sdjf jsd que je suis.Je suis ce hsdjfhsdfjsd fj sdfhjsd fjsdhfjsd f d', 'selim.pousse@gmail.com', 0, 'm', 516, 0, 0, NULL, NULL, 'a:1:{s:13:"Authenticator";s:0:"";}', '', 'a:1:{s:12:"TransientKey";s:12:"64KF2UA4DUSQ";}', NULL, '2012-09-04 00:00:00', '2012-07-13 10:26:37', '2012-11-25 11:56:53', '217.162.205.43', '2012-11-02 16:10:12', NULL, '2012-11-04 09:57:38', '::1', 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 'shingo', 'bc605c49f519507865aaea3551d0c56040e5b058', 'yoomken', NULL, 'Je suis ce que je suis.', 'yoomken@gmail.com', 0, '', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2012-09-15 00:00:00', '2012-09-13 13:01:02', '2013-05-31 10:32:06', NULL, '2012-11-02 16:10:12', NULL, '2012-11-02 16:10:12', '127.0.0.1', 1, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, 'charlotte', 'f8d532cd56547c0ce941d237894a253cc4e481e8', 'yoomken', NULL, 'Je suis ce que je suis.', 'shingo@yoomken.com', 0, 'f', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-10-09 00:49:26', '2013-05-30 17:08:50', NULL, '2012-11-02 16:10:12', NULL, '2012-11-02 16:10:12', '127.0.0.1', 1, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13, 'Selimpousse2', 'ac05ebbe4ae4d6d02f95489f9c3bb39bcb233c02', 'yoomken', NULL, 'Description non renseignée.', 'selim.pousse@gmail.com', 0, '', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-11-27 21:14:37', '2012-11-28 00:37:43', NULL, '2012-11-02 16:10:12', NULL, '2012-11-02 16:10:12', '127.0.0.1', 1, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14, 'Ahmadgabrielalkotob', '53649f6e45138ef119c955d04bf042562f6e2946', 'yoomken', NULL, 'Description non renseignée.', 'alkotobmail@gmail.com', 0, '', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-11-27 21:24:25', '2012-11-27 21:24:25', NULL, '2012-11-02 16:10:12', NULL, '2012-11-02 16:10:12', '127.0.0.1', 1, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15, 'Ahmadgabrielalkotob', '53649f6e45138ef119c955d04bf042562f6e2946', 'yoomken', NULL, 'Description non renseignée.', 'alkotobmail@gmail.com', 0, '', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-11-27 21:25:18', '2012-11-27 21:25:20', NULL, '2012-11-02 16:10:12', NULL, '2012-11-02 16:10:12', '127.0.0.1', 1, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(17, 'Ahmadgabrielalkotob', '53649f6e45138ef119c955d04bf042562f6e2946', 'yoomken', NULL, 'Description non renseignée.', 'alkotobmail@gmail.com', 0, '', 11, 0, 0, NULL, NULL, NULL, NULL, 'a:1:{s:12:"TransientKey";s:12:"3NRC1YABRHXQ";}', NULL, NULL, '2012-11-27 21:57:35', '2012-12-02 11:36:20', '88.174.111.174', '2012-11-02 16:10:12', NULL, '2012-11-02 16:10:12', '127.0.0.1', 1, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18, 'ShingoPousse', 'ac05ebbe4ae4d6d02f95489f9c3bb39bcb233c02', 'yoomken', NULL, 'Description non renseignée.', 'selim.pousse@gmail.com', 0, '', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '1981-12-21 00:00:00', '2012-11-28 16:59:59', '2013-11-24 15:13:09', NULL, '2012-11-02 16:10:12', NULL, '2012-11-02 16:10:12', '127.0.0.1', 1, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(19, 'Samy', '71c693162120c30081793dc18fe09d2df9c27b11', 'yoomken', NULL, 'Description non renseignée.', 'hakim.pousse@gmail.com', 0, 'm', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-05-25 15:44:49', '2013-05-30 17:03:21', NULL, '2012-11-02 16:10:12', NULL, '2012-11-02 16:10:12', '127.0.0.1', 1, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20, 'SlimPousse', '3c9cd3f04407ad22578dc6cd4c5fbd3ff54b3fa4', 'yoomken', NULL, 'Description non renseignée.', 'selim_pousse@hotmail.com', 0, '', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-11-22 10:52:18', '2013-11-23 07:26:56', NULL, '2012-11-02 16:10:12', NULL, '2012-11-02 16:10:12', '127.0.0.1', 1, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21, 'SlimPousse', 'd50338555566eb6d9eb4ca4a3ed4febabd05fef3', 'yoomken', NULL, 'Description non renseignée.', 'selim_pousse@hotmail.com', 0, '', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-11-23 07:28:45', '2013-11-23 19:57:09', NULL, '2012-11-02 16:10:12', NULL, '2012-11-02 16:10:12', '127.0.0.1', 1, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `GDN_UserAuthentication`
--

CREATE TABLE `GDN_UserAuthentication` (
  `ForeignUserKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ProviderKey` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`ForeignUserKey`,`ProviderKey`),
  KEY `FK_UserAuthentication_UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_UserAuthenticationNonce`
--

CREATE TABLE `GDN_UserAuthenticationNonce` (
  `Nonce` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `Token` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Nonce`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_UserAuthenticationProvider`
--

CREATE TABLE `GDN_UserAuthenticationProvider` (
  `AuthenticationKey` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `AuthenticationSchemeAlias` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AssociationSecret` text COLLATE utf8_unicode_ci NOT NULL,
  `AssociationHashMethod` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `AuthenticateUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RegisterUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SignInUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SignOutUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PasswordUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ProfileUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Attributes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`AuthenticationKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_UserAuthenticationToken`
--

CREATE TABLE `GDN_UserAuthenticationToken` (
  `Token` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ProviderKey` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `ForeignUserKey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TokenSecret` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `TokenType` enum('request','access') COLLATE utf8_unicode_ci NOT NULL,
  `Authorized` tinyint(4) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Lifetime` int(11) NOT NULL,
  PRIMARY KEY (`Token`,`ProviderKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_UserCategory`
--

CREATE TABLE `GDN_UserCategory` (
  `UserID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `DateMarkedRead` datetime DEFAULT NULL,
  `Unfollow` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`,`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_UserComment`
--

CREATE TABLE `GDN_UserComment` (
  `UserID` int(11) NOT NULL,
  `CommentID` int(11) NOT NULL,
  `Score` float DEFAULT NULL,
  `DateLastViewed` datetime DEFAULT NULL,
  PRIMARY KEY (`UserID`,`CommentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_UserConversation`
--

CREATE TABLE `GDN_UserConversation` (
  `UserID` int(11) NOT NULL,
  `ConversationID` int(11) NOT NULL,
  `CountReadMessages` int(11) NOT NULL DEFAULT '0',
  `LastMessageID` int(11) DEFAULT NULL,
  `DateLastViewed` datetime DEFAULT NULL,
  `DateCleared` datetime DEFAULT NULL,
  `Bookmarked` tinyint(4) NOT NULL DEFAULT '0',
  `Deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`,`ConversationID`),
  KEY `FK_UserConversation_LastMessageID` (`LastMessageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `GDN_UserConversation`
--

INSERT INTO `GDN_UserConversation` (`UserID`, `ConversationID`, `CountReadMessages`, `LastMessageID`, `DateLastViewed`, `DateCleared`, `Bookmarked`, `Deleted`) VALUES
(1, 1, 1, 1, '2012-11-02 13:19:29', NULL, 0, 0),
(1, 2, 2, 2, '2012-10-31 00:01:10', NULL, 0, 0),
(2, 1, 1, 1, '2012-10-28 14:33:04', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `GDN_UserDiscussion`
--

CREATE TABLE `GDN_UserDiscussion` (
  `UserID` int(11) NOT NULL,
  `DiscussionID` int(11) NOT NULL,
  `Score` float DEFAULT NULL,
  `CountComments` int(11) NOT NULL DEFAULT '0',
  `DateLastViewed` datetime DEFAULT NULL,
  `Dismissed` tinyint(4) NOT NULL DEFAULT '0',
  `Bookmarked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`,`DiscussionID`),
  KEY `FK_UserDiscussion_DiscussionID` (`DiscussionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `GDN_UserDiscussion`
--

INSERT INTO `GDN_UserDiscussion` (`UserID`, `DiscussionID`, `Score`, `CountComments`, `DateLastViewed`, `Dismissed`, `Bookmarked`) VALUES
(1, 1, NULL, 1, '2012-11-02 13:39:59', 0, 0),
(1, 2, NULL, 1, '2012-11-02 13:41:20', 0, 0),
(7, 2, NULL, 1, '2012-11-03 10:43:41', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `GDN_UserMeta`
--

CREATE TABLE `GDN_UserMeta` (
  `UserID` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`UserID`,`Name`),
  KEY `IX_UserMeta_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `GDN_UserMeta`
--

INSERT INTO `GDN_UserMeta` (`UserID`, `Name`, `Value`) VALUES
(0, 'Garden.Analytics.LastSentDate', '20121202');

-- --------------------------------------------------------

--
-- Table structure for table `GDN_UserRole`
--

CREATE TABLE `GDN_UserRole` (
  `UserID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`,`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `GDN_UserRole`
--

INSERT INTO `GDN_UserRole` (`UserID`, `RoleID`) VALUES
(0, 2),
(1, 16),
(2, 16),
(6, 8),
(7, 8),
(8, 8),
(10, 8),
(11, 8),
(13, 8),
(14, 8),
(15, 8),
(16, 8),
(17, 8),
(18, 8),
(19, 8),
(20, 8),
(21, 8);

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE `group` (
  `id_grp` varchar(32) NOT NULL,
  `title_grp` varchar(40) NOT NULL,
  `desc_grp` varchar(250) DEFAULT NULL,
  `privacy_grp` enum('P','S','R') NOT NULL DEFAULT 'P',
  `id_spt_grp` varchar(32) NOT NULL DEFAULT '99999999999999999999999999999999',
  `verified_grp` enum('N','V') NOT NULL DEFAULT 'N',
  `id_img_grp` varchar(50) DEFAULT NULL,
  `featured_grp` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_crea_grp` datetime NOT NULL,
  `url_grp` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_grp`),
  KEY `title` (`title_grp`),
  KEY `description` (`desc_grp`),
  KEY `privacy` (`privacy_grp`),
  KEY `spot` (`id_spt_grp`),
  KEY `featured` (`featured_grp`),
  KEY `date` (`date_crea_grp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`id_grp`, `title_grp`, `desc_grp`, `privacy_grp`, `id_spt_grp`, `verified_grp`, `id_img_grp`, `featured_grp`, `date_crea_grp`, `url_grp`) VALUES
('049f5359c2d4a60c3673e89e12b490e4', 'Magners League', 'A group about The \\\\\\&quot;Celtic\\\\\\&quot; Rugby League .', 'P', '99999999999999999999999999999999', 'N', '376da341f2525eaa4c3bac131d7b9f58', 0, '2010-11-19 15:04:10', '049f5359c2d4a60c3673e89e12b490e4'),
('04e9af1b2819c9316f2b813d7f93d121', 'Sion', 'Sion (German Sitten, Latin Sedunum) is the capital of the Swiss canton of Valais.', 'P', '99999999999999999999999999999999', 'N', 'b2892a855d1ab74eeba2dfddaaeb1361', 0, '2010-08-13 15:15:56', 'Sion'),
('07ff4f8e078cbf03cf46d89c8fd6935b', 'Major League Soccer', 'Professional United States Soccer League.', 'P', '99999999999999999999999999999999', 'N', '8d9fcbdc7142a82b98ab324027c8a45e', 0, '2010-10-28 07:32:52', 'mls'),
('08557bb0dcf1d407df68090e8dd11e7a', 'Flat Eric Fans', 'Everybody who love Flat Eric !!!! Welcome', 'P', '99999999999999999999999999999999', 'N', 'eb12ee60feb6cb1dfbbce5dfd23fcfa7', 0, '2010-09-02 08:44:25', '08557bb0dcf1d407df68090e8dd11e7a'),
('16a968cdb906137a952161789b5c1ea3', 'Radiohead', 'Let''s talk about whatever you want around Radiohead', 'P', 'f457220267b4c86c38db7321c973bc2c', 'N', '0d40baa60d1973442c33ca54fdb79fbb', 0, '2010-08-13 15:07:43', 'radiohead'),
('180521f2dbccbb6d7c2d25de4755e393', 'PHP', 'PHP developers and fans', 'P', '99999999999999999999999999999999', 'N', 'fb8ed906eda1afe4de38593074927f56', 0, '2010-10-11 08:55:23', '180521f2dbccbb6d7c2d25de4755e393'),
('18fa659f8c20f106bbd36a7075f9ecf6', 'guitar players', 'people who play guitar', 'P', 'e8c2dd92fdbd942d9944c7da4c8f6f13', 'N', 'ff6d400743dc7aa62275e1ae577d44c3', 0, '2010-10-25 14:20:49', 'guitar_players'),
('1e05d02ec7c4a4987fad35259b33995d', 'Macro photography', 'You like (or love ;-)) close-up photos of plants, insects or even rain drops ? Join us !', 'P', '99999999999999999999999999999999', 'N', 'c56bac3a8fde7ff890a0eddb3c417f30', 0, '2010-09-20 13:23:12', '1e05d02ec7c4a4987fad35259b33995d'),
('21c13512df892e131297328f705a1cc2', 'How I met your mother', 'Share your favs quotes or videos about that hilarious show!', 'P', '952dba3b805a66ee881d3518bec9e3dd', 'N', 'dda1b8bfa95127cdd7e65d7c1cc4872e', 0, '2010-09-16 11:18:57', 'himym'),
('2913b8ac2dccf089e251951bfe2b9c9f', 'Launch Competition', 'To celebrate our public launch, we are offering you the chance to win an iPad and more than $1500 in gift vouchers including iTunes, Amazon and more ! <a href="/launch_competition">Read more</a>', 'S', '99999999999999999999999999999999', 'N', '1f66ae14a56643b9ea963b2738f728af', 1, '2010-09-12 07:11:20', 'launch_competition'),
('2d4b71843973dafc059933d49ec6ad87', 'The Tudors', 'Everybody who loves the tv show', 'P', '99999999999999999999999999999999', 'N', 'ccb50d819787722fdaf6e985a828dbe1', 0, '2010-08-16 10:59:35', '2d4b71843973dafc059933d49ec6ad87'),
('2e40dc2c888a22379d3cf31da3a8fca1', 'Aviva Premiership', 'Aviva Premiership , English rugby championship', 'P', '99999999999999999999999999999999', 'N', '996d9b42ef2ba0853eb1d9583b581763', 0, '2010-10-27 16:37:20', 'aviva_premiership'),
('392a493f1a5f21eb079110e688743a83', 'Pop Art', 'Discover Pop Art, Share your favorite artists, pieces of art, exhibitions... Pop it!', 'P', '99999999999999999999999999999999', 'N', '45e3c38bd0917ce5b9eb47682bc23d90', 0, '2010-11-11 08:45:07', 'popart'),
('3a9e073f8cfe86766744cbbd375d9b40', 'Electronic Music', 'A group for all fans of Electronic Music !', 'P', '99999999999999999999999999999999', 'N', 'c15d8cfcbb337ff592d262e028f54963', 0, '2010-11-10 07:53:03', 'electronicmusic'),
('3c19fb15d693e17ded63bb3c9498bf11', 'Heliski', 'Let''s talk about Heliskiing', 'P', '99999999999999999999999999999999', 'N', 'ae9190b659ac3bd307c2c6ce38ebb7a3', 0, '2010-09-14 15:10:22', 'heliski'),
('3f1c5637a02e6fe64bd2032f7263052c', 'MUSIQUE SOUL FUNK', 'de la vrais musique', 'P', '99999999999999999999999999999999', 'N', '50c2fe616aaaa5dc0221eefcfdff915c', 0, '2010-11-13 06:09:30', 'musiquesoulfunk'),
('40a0317aec5dd4ee921500293c38db46', 'JheSalon Fashion', 'Everything about fashion like bags, shoes, apparel, and accessories.', 'P', '99999999999999999999999999999999', 'N', '64b9e9480ffe66cb84b11a59922a183c', 0, '2010-11-16 04:04:02', 'jhesalon-fashion'),
('40c05d11f2664fb925d570962f385b5e', 'Go green', 'Come here to share your tips and tricks to leave a safer planet to our Youngers... You can also share if you\\''re doing a manifestation...', 'P', '99999999999999999999999999999999', 'N', 'ab22a331ba7afd5122cd9d3b2468e9fc', 0, '2010-11-27 06:08:39', 'gogreen'),
('4646e4170364ba55f015e9c0ef459fc4', 'Audi Universe', 'Everything related to the German car manufacturer', 'P', '99999999999999999999999999999999', 'N', '91df82c6300d607f49d6d9369bb08072', 0, '2010-09-14 15:05:24', 'audi_universe'),
('4819f91acaba34634572b48002d91438', 'Dexter Fans', 'You love blood ????? Welcome .....', 'P', '0ede6d9f7c793882ab661e55c3dc75f0', 'N', 'd1529f08ec2f7100bc5df00c49eb9ea1', 0, '2010-08-19 13:29:21', '4819f91acaba34634572b48002d91438'),
('49ac5ab92dc4c37d15b6dbc3d1546783', 'Barclays Premier League', 'A group about English Football Championship .', 'P', '99999999999999999999999999999999', 'N', '745177715abefeb1b36ec06e61cdc73c', 0, '2010-10-27 03:33:58', '49ac5ab92dc4c37d15b6dbc3d1546783'),
('5a51b78188e0f7dd29c8a83c48f9775c', 'Real Estate', 'People who deal with the real estate sector, or even if they find an interest in that field.', 'P', '99999999999999999999999999999999', 'N', 'ad84d26902de8f2d722768a3e905cdb9', 0, '2010-09-16 10:08:54', '5a51b78188e0f7dd29c8a83c48f9775c'),
('5dab082d85ea606a0d4f9d33ba1ef8ac', 'The Big Bang Theory', 'For anyone who likes this serie!', 'P', '99999999999999999999999999999999', 'N', 'eb2c9dc332058e3c5b863b1118ebc28c', 0, '2010-11-28 07:53:24', 'tbbt'),
('5f33d38f4c176cc99ddbe0f370db6322', 'Sports', 'A place to discuss your favorite sports, games, memorabilia, and more', 'P', '10809be1d4d29c284d86575dc4a630ff', 'N', 'fde8002ba1c2128359e7093879d80368', 0, '2010-09-16 11:47:08', 'sports'),
('5fcba772b3a4298b67f336bd2513ff1e', 'ROLDAN', 'Musique Cubaine', 'P', '99999999999999999999999999999999', 'N', '9903bf34874d0fb07c145e2206bb3e87', 0, '2010-11-24 15:03:12', 'roldan'),
('60f29105809dd00564bab5739b97085e', 'Photography', 'You are photographer or fan of photography ? Join us !!!!', 'P', '99999999999999999999999999999999', 'N', '2189d84376a47717a5c1ed3b6987b909', 0, '2010-08-19 07:39:16', '60f29105809dd00564bab5739b97085e'),
('621ab3250ce768729430d16fd61a3d12', 'Hanna Montana', 'yes', 'P', '99999999999999999999999999999999', 'N', '621ab3250ce768729430d16fd61a3d12', 0, '2010-10-16 14:02:36', 'hannamontana'),
('627d9daa606fa1cf8de98184b9749f2a', 'Haute Couture', 'Best designers, last fashion show, what\\''s the next \\&quot;must have\\&quot;? Share your fashion feelings!', 'P', '99999999999999999999999999999999', 'N', 'b2394fef6fb5ce734075ce8ad48d989c', 0, '2010-11-14 03:46:25', 'hautecouture'),
('652a9672fc3ee6420f41bc0ecd4dd390', 'manga addict', 'fan de manga', 'P', '99999999999999999999999999999999', 'N', '42c917aeff9608f4fb7bd25a058ea4b4', 0, '2011-01-06 03:31:03', 'mangaaddict'),
('6735933c6bb8c545032e0e1e0ffa16c4', 'Humour', 'If you have a sixth sense...the sense of humour, you are welcome!', 'P', '99999999999999999999999999999999', 'N', '99999999999999999999999999999999', 0, '2010-09-15 09:17:51', '6735933c6bb8c545032e0e1e0ffa16c4'),
('722e5d514e45a329616e7a1afbc13d12', 'Basketball', 'Come here and share anything about that fabulous sport!', 'P', '99999999999999999999999999999999', 'N', '659bdee0528c88cb6a30fe7e7e380fc0', 0, '2010-11-21 08:11:54', 'basketball'),
('734a06b157413402f60586d6dc10f1af', 'SIX STRINGS FILM DOCUMENTARY', 'A Series of films documenting the motivation of 6 international guitarists, 6 at a time.', 'P', '99999999999999999999999999999999', 'N', '99999999999999999999999999999999', 0, '2010-09-17 16:56:11', '734a06b157413402f60586d6dc10f1af'),
('747caafcd918c260ea82c222f5f8320a', 'I love Boston', 'Want to talk about Boston?', 'P', '9ae8e9222e125ccb20d763d8da2ebbec', 'N', 'c3d1740f412d54637a0fde9cedf85e4a', 0, '2010-08-13 13:41:14', 'loveboston'),
('7666a40e9de65b116382fd34c01489a7', 'Golf Newbie', 'Learning Golf through sharing tips and experiences.', 'P', '99999999999999999999999999999999', 'N', '99999999999999999999999999999999', 0, '2010-11-16 01:51:08', 'golf-newbie'),
('7955df65f5f5750de252d9412d5f994b', 'Ã‰quitation', 'le chevale', 'P', '99999999999999999999999999999999', 'N', '15636f92129b7185f039719f309eb646', 0, '2010-11-18 05:35:03', '7955df65f5f5750de252d9412d5f994b'),
('7bafe4bac33858c2845def0c0b45f9dc', 'Hiking', 'You love walking in in natural environments? Share here your spots, pictures,tips...', 'P', '99999999999999999999999999999999', 'N', '64e70a9160e15f0ea7ffeb5773286a56', 0, '2010-09-18 11:27:36', '7bafe4bac33858c2845def0c0b45f9dc'),
('7fd3523d369f09c08581c1695989ee7e', 'Jazz Music', 'Every kind of jazz you like!', 'P', '99999999999999999999999999999999', 'N', '012c8797b707ea46c75f4d1e9800d62b', 0, '2010-11-01 04:41:48', 'jazz'),
('83dab293b08f91102daa258a5ae88d6e', 'Sauna', 'The real thing from Finland ;-)', 'P', '99999999999999999999999999999999', 'N', 'a18a117b0ae030f6707a8759b2468490', 0, '2010-09-28 18:46:57', '83dab293b08f91102daa258a5ae88d6e'),
('8671975e04a2c86a5dc2eb2fdfbaef5c', 'Skydiving Fans', 'Everybody who already do it,...or not, beginners, pro. Share sensations, etc....', 'P', '99999999999999999999999999999999', 'N', '1deb596e6ae8b4823ca7306c1308eb3e', 0, '2010-08-17 09:34:26', 'parachutists'),
('8fd47b2e8149e273ed6f7810d0edf61d', 'TV ads', 'Funny, Beautiful, Ridulous....all the TV ads that worth to be seen!', 'P', '99999999999999999999999999999999', 'N', '9aa9a6f62683312988d840c2e096d800', 0, '2010-11-05 11:17:42', 'tv-ads'),
('99b502c5721159da2cc8d8b020ddcbf1', 'V&eacute;lib''', 'V&eacute;lib''', 'P', 'd8aa36e7fa48e117ce8fc87760ed5930', 'N', '11ea1bcbc5aad2d92d472d18401903b7', 0, '2010-09-15 01:55:15', 'velib'),
('99dc6280e4619d5b5a2c110e0d696135', 'TOP 14', 'French Rugby Championship .', 'P', '99999999999999999999999999999999', 'N', 'aa5cdc48ce09677b491757a2c13a290c', 0, '2010-10-27 16:30:36', 'top14'),
('9e13b69d1d2da927102acaaaf7154a37', 'Javascript', 'For the aficionados of the bling bling UI or crazy people loving changing the DOM. Come to talking about Mootools and troll about jQuery.', 'P', '99999999999999999999999999999999', 'N', '1a6763ca3d2ec20aa8fe643b18fb1132', 0, '2010-08-13 18:48:20', 'javascript'),
('9f7202b543843b08273bde17182d5955', 'Hip Hop Channel', 'Rap, R&amp;B, MCing, DJing, B-boying, and Graffiti Writing, Beatboxing....share and discover the Hip-Hop artistic culture!', 'P', '99999999999999999999999999999999', 'N', '4aebbe55042bc5ae5139cf165630c2c7', 0, '2010-09-12 09:14:25', 'hiphop'),
('a6feb76248ee3a82edb68ac2be2706e7', 'Food Lovers', 'This group is for people who love cooking, good food, good wine..... Welcome !!!!', 'P', '99999999999999999999999999999999', 'N', 'cf1c7e471a0c0d2fb4a4715d54e0d164', 0, '2010-09-04 14:13:27', 'food_lovers'),
('a749db21fbf4dc8513bedda5f3dd112c', 'Bayen', 'si tu es mon ami alors rejoint mon groupe', 'P', '99999999999999999999999999999999', 'N', '65ed7d445fb03aea6b7f5987ae0d462b', 0, '2010-10-14 13:29:34', 'bayen'),
('acf655d3121507e5f4585ca0a88b8e77', 'Maserati', 'For all those that have a Maserati or Wish to acquire one then follow this group, You gonna love it with our Maserati videos and pictures.', 'P', '99999999999999999999999999999999', 'N', '8927657f62b78d3b7734009ce6e5a84e', 0, '2010-10-20 02:22:33', 'acf655d3121507e5f4585ca0a88b8e77'),
('b388f20cf1d3af378fd72f34071b69bc', 'Apple fan boys', 'For all those who &quot;think different&quot;!', 'P', '5f79a61c748278c62e9ed57480349e93', 'N', '294a2c64f5d4f5b5b296c9240f7b0a28', 0, '2010-08-13 13:29:05', 'apple'),
('b4c8502a0e3049d87d8c85376a46ac47', 'Political art', 'all about the Political art', 'P', '9ae8e9222e125ccb20d763d8da2ebbec', 'N', 'dd1fb944d81fa0ece8fefd3d4004e3b1', 0, '2010-09-08 06:28:55', 'b4c8502a0e3049d87d8c85376a46ac47'),
('bdbb51ace650766c10d7e0546dadfd0e', 'Comic Books', 'A groupe dedicated to all comic books !', 'P', '99999999999999999999999999999999', 'N', 'b5ecf52ed32d08d13451e25111b3fc83', 0, '2010-09-19 15:16:29', 'bdbb51ace650766c10d7e0546dadfd0e'),
('c5b69ccc94108d1bcba49363ef85bd19', 'I Love Auroville', 'You''ve ever or never been in Auroville, come with us to share or discover this Utopian City !!', 'P', '99999999999999999999999999999999', 'N', '74c9027d7aa78bed55a696f185f28d39', 0, '2010-08-18 10:22:23', 'c5b69ccc94108d1bcba49363ef85bd19'),
('c6cfd43f781cd0f23a356f88362631dd', 'Retro-Gaming', 'A group for all old video games players to talk about the good moments they had on their game consoles !', 'P', '99999999999999999999999999999999', 'N', '3a77eee5fd30db3c5c82072bcd249f0d', 0, '2010-10-27 03:40:08', 'c6cfd43f781cd0f23a356f88362631dd'),
('d2763fb19fa1ebd8a5f85eab5a27755e', 'All around eegoes', 'Want to give some ideas? Share feedback? Funny stories....', 'P', '9ae8e9222e125ccb20d763d8da2ebbec', 'N', 'a3f76b7cb37bf3ef9e0ca13c66ac3f7d', 1, '2010-08-13 14:32:18', 'eegoes'),
('d49e7bc182ba335e4deb7cf3d1d22562', 'Education', 'Des ressources pour la classe et les Ã©coles.', 'P', '99999999999999999999999999999999', 'N', '99999999999999999999999999999999', 0, '2010-12-05 06:03:47', 'education'),
('dbf56d31e9c60b7e64d05df290b02b36', 'manga addict ddggfdgf', 'fan de manga, come here', 'P', '99999999999999999999999999999999', 'N', 'db7d451d602cbf738ca59c9463995c38', 0, '2011-01-06 03:31:25', 'mangaaddictddggfdgf'),
('e1623d2ad61e0bff1a66490beeef7279', 'Running', 'Share your tracks,races and training', 'P', '99999999999999999999999999999999', 'N', '7e2620d040e5de4c3c29f519026afd6e', 0, '2010-08-16 04:18:53', 'running'),
('e28917d2ac23306201de041857f11aa1', 'Movies releases', 'There''s a film you can''t wait to see and that is not out yet? Come go ahead and give us the trailer or even more!', 'P', '99999999999999999999999999999999', 'N', 'd2ff98ae3f2069436aca3722f5f9a6d9', 0, '2010-08-14 08:38:21', 'latestmovies'),
('e7a190a78afdb71e01d9e7aefe067ba0', 'Project Management', 'A place where to share tips and ideas about the different project management styles, not necessarily related to the software industry.', 'P', '99999999999999999999999999999999', 'N', 'e9ae74366a769b55d9f98e2fce9aad61', 0, '2010-10-24 03:07:52', 'e7a190a78afdb71e01d9e7aefe067ba0'),
('eb8445e5e01e33ab2aabe08ca3f45254', 'Folk &amp; Acoustic', 'For those who like all that soft and cool music...', 'P', '99999999999999999999999999999999', 'N', '0f3faa392cae26d937ab87b6bb14c110', 0, '2010-09-25 04:20:34', 'eb8445e5e01e33ab2aabe08ca3f45254'),
('ecda49179ab03b4927fde8fe033bb38f', 'Watches', 'Join us and talk about the art of Horology. Tips..reviews...discounts...share your stuff here!', 'P', '99999999999999999999999999999999', 'N', '7ea471105fc993b8e302f75d50e0b91e', 0, '2010-09-14 14:58:50', 'watches'),
('f5bc01f39989aafdbfaec8e71d674f79', 'Dogs & Cats', 'Share everyday pictures of your dogs and cats.', 'P', '9ae8e9222e125ccb20d763d8da2ebbec', 'N', 'c0e1fc9adf619d309215024d136723d3', 0, '2010-09-12 09:10:29', 'f5bc01f39989aafdbfaec8e71d674f79'),
('fdfdf58070a7f235d2d00c436ce43bad', 'Rock Channel', 'Grunge, Hard, Punk...however you like it!', 'P', '99999999999999999999999999999999', 'N', '95dbf7b0d44f426818412892b6d61987', 0, '2010-09-21 12:06:04', 'rock_channel'),
('fead676bdc706792d0172dd03194a005', 'Roger Federer Fans', 'You like his talent ? You like Tennis ? Joins us !!!', 'P', 'a7825ef06d6e1501e1978816e3027c0b', 'N', 'c3ae5833cf58decbe8198b4549da1f04', 0, '2010-08-24 02:42:08', 'fead676bdc706792d0172dd03194a005');

-- --------------------------------------------------------

--
-- Table structure for table `grp_act`
--

CREATE TABLE `grp_act` (
  `id_grp_grpact` varchar(32) NOT NULL,
  `id_act_grpact` varchar(32) NOT NULL,
  PRIMARY KEY (`id_grp_grpact`,`id_act_grpact`),
  KEY `grp_act_ibfk_1` (`id_act_grpact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `grp_usr`
--

CREATE TABLE `grp_usr` (
  `id_grpusr` varchar(32) NOT NULL,
  `id_usr_grpusr` varchar(32) NOT NULL,
  `profil_usr_grpusr` enum('P','C','B') NOT NULL DEFAULT 'P',
  `type_usr_grpusr` enum('F','M','W') NOT NULL DEFAULT 'M',
  `privacy_msg_grpusr` enum('P','R') NOT NULL DEFAULT 'P',
  `date_grpusr` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_grpusr`,`date_grpusr`,`id_usr_grpusr`),
  KEY `profil_usr_grpusr` (`profil_usr_grpusr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `grp_usr`
--

INSERT INTO `grp_usr` (`id_grpusr`, `id_usr_grpusr`, `profil_usr_grpusr`, `type_usr_grpusr`, `privacy_msg_grpusr`, `date_grpusr`) VALUES
('0fbef09a987b7a2f6f5aad18a31a5c43', '0fbef09a987b7a2f6f5aad18a31a5c43', 'P', 'M', 'P', '2012-11-27 20:14:37'),
('17383410426aca2c81747bd50c3a7784', '79b1b9dc1b338006650c78d3b4919b04', 'B', 'M', 'P', '2012-11-18 11:08:30'),
('17383410426aca2c81747bd50c3a7784', '7d6653aaa16976e12b6cf7c774f83c1f', 'P', 'M', 'P', '2012-11-18 11:08:30'),
('17383410426aca2c81747bd50c3a7784', '79b1b9dc1b338006650c78d3b4919b04', 'B', 'M', 'P', '2012-11-18 11:16:21'),
('17383410426aca2c81747bd50c3a7784', '7d6653aaa16976e12b6cf7c774f83c1f', 'P', 'M', 'P', '2012-11-18 11:16:21'),
('178cd2f3df2d88613b46bb6e96a77f3a', '178cd2f3df2d88613b46bb6e96a77f3a', 'P', 'M', 'P', '2013-05-30 13:37:08'),
('199a821110285883b5ce4cc12507545b', '79b1b9dc1b338006650c78d3b4919b04', 'P', 'M', 'P', '2013-05-31 09:19:22'),
('199a821110285883b5ce4cc12507545b', 'a530b55030587b46519449c39181d1b8', 'C', 'M', 'P', '2013-05-31 09:19:22'),
('1b5d5518c800d0929e8d072ff556638b', '1b5d5518c800d0929e8d072ff556638b', 'P', 'M', 'P', '2012-11-27 20:26:30'),
('1df9e06e56cdc06289a2068cf52cd611', '1df9e06e56cdc06289a2068cf52cd611', 'P', 'M', 'P', '2012-11-27 20:25:18'),
('2bd8063bffa0986bfbe7e265cfba8a63', '2bd8063bffa0986bfbe7e265cfba8a63', 'P', 'M', 'P', '2013-05-30 13:35:57'),
('2e092827e845f39dbc34ec8796b087e1', '6b2e63b1fd55069fb7cb35fb60f61ed7', 'P', 'M', 'P', '2013-05-30 14:45:47'),
('2e092827e845f39dbc34ec8796b087e1', '79b1b9dc1b338006650c78d3b4919b04', 'B', 'M', 'P', '2013-05-30 14:45:47'),
('48ae9648a43e3633ae647c2583d84116', '48ae9648a43e3633ae647c2583d84116', 'P', 'M', 'P', '2012-11-14 23:04:37'),
('5a6097a8f128c86769da4e977927a78d', '5a6097a8f128c86769da4e977927a78d', 'P', 'M', 'P', '2012-11-28 16:00:04'),
('6b2e63b1fd55069fb7cb35fb60f61ed7', '6b2e63b1fd55069fb7cb35fb60f61ed7', 'P', 'M', 'P', '2012-09-29 22:48:02'),
('6ce86ea1adf41c118625e999e955d7d8', '6b2e63b1fd55069fb7cb35fb60f61ed7', 'B', 'M', 'P', '2012-09-29 23:32:34'),
('6ce86ea1adf41c118625e999e955d7d8', '7d6653aaa16976e12b6cf7c774f83c1f', 'P', 'M', 'P', '2012-09-29 23:32:34'),
('6ce86ea1adf41c118625e999e955d7d8', '6b2e63b1fd55069fb7cb35fb60f61ed7', 'B', 'M', 'P', '2012-09-29 23:51:59'),
('6ce86ea1adf41c118625e999e955d7d8', '7d6653aaa16976e12b6cf7c774f83c1f', 'P', 'M', 'P', '2012-09-29 23:51:59'),
('6ce86ea1adf41c118625e999e955d7d8', '6b2e63b1fd55069fb7cb35fb60f61ed7', 'B', 'M', 'P', '2012-09-30 00:02:41'),
('6ce86ea1adf41c118625e999e955d7d8', '7d6653aaa16976e12b6cf7c774f83c1f', 'P', 'M', 'P', '2012-09-30 00:02:41'),
('6ce86ea1adf41c118625e999e955d7d8', '6b2e63b1fd55069fb7cb35fb60f61ed7', 'B', 'M', 'P', '2012-09-30 08:27:11'),
('6ce86ea1adf41c118625e999e955d7d8', '7d6653aaa16976e12b6cf7c774f83c1f', 'P', 'M', 'P', '2012-09-30 08:27:11'),
('6ce86ea1adf41c118625e999e955d7d8', '6b2e63b1fd55069fb7cb35fb60f61ed7', 'B', 'M', 'P', '2012-09-30 09:21:09'),
('6ce86ea1adf41c118625e999e955d7d8', '7d6653aaa16976e12b6cf7c774f83c1f', 'P', 'M', 'P', '2012-09-30 09:21:09'),
('79b1b9dc1b338006650c78d3b4919b04', '79b1b9dc1b338006650c78d3b4919b04', 'P', 'M', 'P', '2012-11-03 23:05:13'),
('7d6653aaa16976e12b6cf7c774f83c1f', '7d6653aaa16976e12b6cf7c774f83c1f', 'P', 'M', 'P', '2012-09-29 22:37:26'),
('841ef8a50591e500450e46b20f0071cd', '841ef8a50591e500450e46b20f0071cd', 'P', 'M', 'P', '2012-11-17 12:39:02'),
('871aafc5183b46241b988e1ae13f3501', '871aafc5183b46241b988e1ae13f3501', 'P', 'M', 'P', '2013-11-22 09:52:20'),
('941af2c99f4f7895b481ab9c3261e4ee', '941af2c99f4f7895b481ab9c3261e4ee', 'P', 'M', 'P', '2013-05-25 13:44:54'),
('9dc4cd2d6c07049b21ccb1b21bfadbf8', '9dc4cd2d6c07049b21ccb1b21bfadbf8', 'P', 'M', 'P', '2012-11-27 20:24:25'),
('a3cefde48284f70b2098d7015e987148', 'a3cefde48284f70b2098d7015e987148', 'P', 'M', 'P', '2012-09-22 17:27:42'),
('a530b55030587b46519449c39181d1b8', 'a530b55030587b46519449c39181d1b8', 'P', 'M', 'P', '2013-05-30 13:38:14'),
('c', '', '', '', '', '2012-09-25 17:16:43'),
('d41d8cd98f00b204e9800998ecf8427e', '', 'P', 'M', 'P', '2013-05-24 11:15:42'),
('f7a5c01ea63f9176ff7352da1b5dcaa5', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'P', 'M', 'P', '2012-11-27 20:57:38'),
('i', 'a', 'P', 'M', 'P', '2012-09-25 17:16:43'),
('i', 'b', '', '', '', '2012-09-25 17:16:43'),
('ii', 'a', '', '', '', '2012-09-25 17:16:43'),
('ii', 'c', '', '', '', '2012-09-25 17:16:43'),
('iii', 'b', '', '', '', '2012-09-25 17:16:43'),
('iii', 'c', '', '', '', '2012-09-25 17:16:43'),
('iiii', 'a', 'P', 'M', 'P', '2012-09-25 17:16:43'),
('iiii', 'b', 'P', 'M', 'P', '2012-09-25 17:16:43'),
('iiii', 'e', '', '', '', '2012-09-25 17:16:43');

-- --------------------------------------------------------

--
-- Table structure for table `histo_collaborator`
--

CREATE TABLE `histo_collaborator` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `histo_collaborator`
--

INSERT INTO `histo_collaborator` (`id_coll`, `id_grpusr_coll`, `initiator_coll`, `date_begin_coll`, `date_end_coll`) VALUES
(1, 'i', 'a', '0000-00-00 00:00:00', NULL),
(2, 'ii', 'a', NULL, NULL),
(3, 'iii', NULL, NULL, NULL),
(4, 'iiii', 'a', NULL, NULL),
(5, '6ce86ea1adf41c118625e999e955d7d8', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-09-30 01:32:34', '0000-00-00 00:00:00'),
(6, '6ce86ea1adf41c118625e999e955d7d8', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-30 01:51:59', '0000-00-00 00:00:00'),
(7, '6ce86ea1adf41c118625e999e955d7d8', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-09-30 02:02:41', '2012-09-30 02:05:22'),
(8, '6ce86ea1adf41c118625e999e955d7d8', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-30 10:27:10', '2012-09-30 11:18:19'),
(9, '6ce86ea1adf41c118625e999e955d7d8', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-30 11:21:09', '2012-09-30 11:27:45'),
(10, '17383410426aca2c81747bd50c3a7784', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-18 12:08:30', NULL),
(11, '17383410426aca2c81747bd50c3a7784', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-18 12:16:21', NULL),
(12, '2e092827e845f39dbc34ec8796b087e1', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-30 16:45:47', NULL),
(13, '199a821110285883b5ce4cc12507545b', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-31 11:19:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `im_messages`
--

CREATE TABLE `im_messages` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `type` varchar(2) NOT NULL,
  `sent` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `im_messages`
--

INSERT INTO `im_messages` (`message_id`, `from_id`, `to_id`, `message`, `type`, `sent`, `read`) VALUES
(1, 8, 7, '0:offline', 's', '2012-11-13 22:40:50', 1),
(2, 8, 7, '0:offline', 's', '2012-11-13 22:40:52', 1),
(3, 7, 8, '1:Disponible', 's', '2012-11-17 17:10:54', 1),
(4, 8, 7, '0:offline', 's', '2012-11-17 17:18:08', 1),
(5, 8, 7, '0:offline', 's', '2012-11-17 17:18:12', 1),
(6, 8, 7, '1:Disponible', 's', '2012-11-18 11:05:29', 1),
(7, 7, 8, '0:offline', 's', '2012-11-18 11:38:01', 1),
(8, 7, 8, '1:Disponible', 's', '2012-11-25 10:28:21', 1),
(9, 8, 7, 't''es lÃ ', 'm', '2012-11-25 10:28:47', 1),
(10, 7, 8, '0:offline', 's', '2012-11-25 11:11:17', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `im_view_friends`
--
CREATE TABLE `im_view_friends` (
`user_id` int(11)
,`friend_id` int(11)
,`group_id` int(1)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `im_view_groups`
--
CREATE TABLE `im_view_groups` (
`group_id` bigint(20)
,`name` varchar(17)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `im_view_status`
--
CREATE TABLE `im_view_status` (
`user_id` int(11)
,`status` bigint(20)
,`message` varchar(14)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `im_view_users`
--
CREATE TABLE `im_view_users` (
`user_id` int(11)
,`username` varchar(45)
,`password` varchar(40)
,`last_known_ip` varchar(9)
,`last_login` timestamp
);
-- --------------------------------------------------------

--
-- Table structure for table `input`
--

CREATE TABLE `input` (
  `id_in` int(2) NOT NULL,
  `type_in` varchar(32) NOT NULL,
  `multi_in` tinyint(1) DEFAULT '1',
  `dynamic_in` tinyint(1) DEFAULT '1',
  `remote_in` varchar(100) DEFAULT NULL,
  `default_in` varchar(32) NOT NULL,
  `rules_in` varchar(250) NOT NULL,
  `hidden_in` varchar(250) DEFAULT NULL,
  `coment_in` text,
  PRIMARY KEY (`id_in`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `input`
--

INSERT INTO `input` (`id_in`, `type_in`, `multi_in`, `dynamic_in`, `remote_in`, `default_in`, `rules_in`, `hidden_in`, `coment_in`) VALUES
(1, 'text', 1, 1, NULL, '', '{required:true}', NULL, 'n''importe quelle description'),
(2, 'select', 0, 0, NULL, '', '', NULL, 'les valeurs sont  les rayons en km de recherche pour la geolocation\n '),
(3, 'text', 0, 0, NULL, 'TODAY', '{date:true}', NULL, 'permet de saisir une date'),
(4, '2text', 0, 0, NULL, 'between TODAY and LAST_WEEK', '{date:true}', NULL, 'date de debut et date de fin'),
(5, 'auto', 1, 0, 'remote: {url: ''/ajax/people/like''}', 'ME,ME>', 'onlyFromValues :true', NULL, 'autocomplete people'),
(6, 'auto', 1, 1, 'remote:{url: ''/ajax/tags''}', '', '', NULL, 'autocomplete tags'),
(7, 'auto', 1, 1, 'source: codeAddress', 'home', 'onlyFromValues :true', '', 'autocomplete country'),
(8, 'auto', 1, 1, 'source: codeAddress', 'home', 'onlyFromValues :true', '', 'autocomplete city'),
(9, 'auto', 1, 1, 'remote:{url: ''/ajax/services''}', '', 'onlyFromValues :true', '', 'autocomplete service');

-- --------------------------------------------------------

--
-- Table structure for table `invitation_user`
--

CREATE TABLE `invitation_user` (
  `mail_inv` varchar(50) NOT NULL,
  `code_inv` varchar(32) NOT NULL,
  `id_usr_inv` varchar(32) NOT NULL,
  `status_inv` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`mail_inv`),
  KEY `id_usr_inv` (`id_usr_inv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `like`
--

CREATE TABLE `like` (
  `pid_lik` int(11) NOT NULL AUTO_INCREMENT,
  `id_usr_lik` varchar(32) NOT NULL,
  `id_meta_lik` varchar(32) NOT NULL,
  `date_lik` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type_lik` enum('D','R','W','A','L') NOT NULL DEFAULT 'L',
  `meta_lik` enum('USR','ACT','CMT','BDG') NOT NULL DEFAULT 'ACT',
  `bdg_lik` varchar(32) DEFAULT NULL,
  `cmt_lik` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid_lik`),
  KEY `type_lik` (`type_lik`),
  KEY `id_meta_lik` (`id_meta_lik`),
  KEY `like_meta` (`meta_lik`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=55 ;

--
-- Dumping data for table `like`
--

INSERT INTO `like` (`pid_lik`, `id_usr_lik`, `id_meta_lik`, `date_lik`, `type_lik`, `meta_lik`, `bdg_lik`, `cmt_lik`) VALUES
(1, '6b2e63b1fd55069fb7cb35fb60f61ed7', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-30 09:44:52', 'L', 'USR', NULL, NULL),
(2, '7d6653aaa16976e12b6cf7c774f83c1f', '0b6d76dabad76b63eed79143bb9d70d6', '2012-09-24 12:18:44', 'L', 'CMT', NULL, NULL),
(3, '7d6653aaa16976e12b6cf7c774f83c1f', '12d26cc674652e848a7019d569e80c4b', '2012-09-28 07:13:37', 'L', 'ACT', NULL, NULL),
(4, '7d6653aaa16976e12b6cf7c774f83c1f', '272878c23469bffc05ffc76970f0ce9c', '2012-09-23 07:42:25', 'L', 'CMT', NULL, NULL),
(5, '7d6653aaa16976e12b6cf7c774f83c1f', '59aae09814a536b30041a7db1984e490', '2012-09-24 12:18:37', 'L', 'CMT', NULL, NULL),
(6, '7d6653aaa16976e12b6cf7c774f83c1f', '6e73c5a79f039412701ad6fa8c6391c2', '2012-09-24 12:22:15', 'L', 'CMT', NULL, NULL),
(7, '7d6653aaa16976e12b6cf7c774f83c1f', '7075995a8a4816a84d17101820889e95', '2012-09-28 06:42:16', 'L', 'ACT', NULL, NULL),
(8, '7d6653aaa16976e12b6cf7c774f83c1f', '86139c87f6edc9169aa116a4173be3b5', '2012-09-23 07:54:34', 'L', 'ACT', NULL, NULL),
(9, '7d6653aaa16976e12b6cf7c774f83c1f', '87fb4c00052559e2c34c470de0cb57b5', '2012-09-24 12:07:33', 'L', 'ACT', NULL, NULL),
(10, '7d6653aaa16976e12b6cf7c774f83c1f', 'b53d844d6383406de22d49412b6bcd5e', '2012-09-28 07:12:44', 'L', 'CMT', NULL, NULL),
(11, '7d6653aaa16976e12b6cf7c774f83c1f', 'e5f2e9fb93d26c10851dc4fedf8a4188', '2012-09-23 07:25:57', 'L', 'CMT', NULL, NULL),
(12, '7d6653aaa16976e12b6cf7c774f83c1f', 'f96636189e4702f06a6e5aa18ee36000', '2012-09-24 12:18:38', 'L', 'CMT', NULL, NULL),
(13, '7d6653aaa16976e12b6cf7c774f83c1f', 'ff1e62a186467d0ba091195d2f751a88', '2012-09-24 12:18:01', 'L', 'CMT', NULL, NULL),
(14, '5a6097a8f128c86769da4e977927a78d', '5a6097a8f128c86769da4e977927a78d', '2013-04-17 00:33:27', 'W', 'BDG', 'funny', NULL),
(15, '5a6097a8f128c86769da4e977927a78d', '5a6097a8f128c86769da4e977927a78d', '2013-04-17 00:35:26', 'W', 'BDG', 'attachant', NULL),
(16, '5a6097a8f128c86769da4e977927a78d', '5a6097a8f128c86769da4e977927a78d', '2013-04-17 00:36:41', 'R', 'BDG', 'attachant', NULL),
(17, '5a6097a8f128c86769da4e977927a78d', '5a6097a8f128c86769da4e977927a78d', '2013-04-17 00:36:45', 'R', 'BDG', 'funny', NULL),
(18, '5a6097a8f128c86769da4e977927a78d', '5a6097a8f128c86769da4e977927a78d', '2013-04-17 00:37:23', 'W', 'BDG', 'funny', NULL),
(19, 'f7a5c01ea63f9176ff7352da1b5dcaa5', '5a6097a8f128c86769da4e977927a78d', '2013-04-17 00:43:12', 'W', 'BDG', 'funny', NULL),
(20, '5a6097a8f128c86769da4e977927a78d', 'f7a5c01ea63f9176ff7352da1b5dcaa5', '2013-04-17 00:48:27', 'L', 'BDG', 'funny', NULL),
(21, '5a6097a8f128c86769da4e977927a78d', '5a6097a8f128c86769da4e977927a78d', '2013-04-17 00:48:42', 'R', 'BDG', 'funny', NULL),
(22, 'a3cefde48284f70b2098d7015e987148', '5a6097a8f128c86769da4e977927a78d', '2013-04-17 00:52:53', 'L', 'BDG', 'funny', NULL),
(23, 'a3cefde48284f70b2098d7015e987148', '5a6097a8f128c86769da4e977927a78d', '2013-04-17 00:53:21', 'W', 'BDG', 'nounou', NULL),
(24, 'a3cefde48284f70b2098d7015e987148', '5a6097a8f128c86769da4e977927a78d', '2013-04-17 00:53:40', 'A', 'BDG', 'nounou', NULL),
(25, '79b1b9dc1b338006650c78d3b4919b04', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-04-18 21:38:15', 'L', 'BDG', 'bricoler', NULL),
(26, '79b1b9dc1b338006650c78d3b4919b04', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-04-18 21:38:55', 'L', 'BDG', 'attachant', NULL),
(27, '79b1b9dc1b338006650c78d3b4919b04', 'a3cefde48284f70b2098d7015e987148', '2013-04-18 21:40:08', 'L', 'BDG', 'attachant', NULL),
(28, '79b1b9dc1b338006650c78d3b4919b04', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-04-18 21:40:41', 'L', 'USR', 'Selim Pousse', NULL),
(29, '5a6097a8f128c86769da4e977927a78d', 'f7a5c01ea63f9176ff7352da1b5dcaa5', '2013-05-24 11:15:42', 'L', 'USR', '', NULL),
(30, '6b2e63b1fd55069fb7cb35fb60f61ed7', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 13:33:23', 'L', 'BDG', 'travaillleur', NULL),
(31, '6b2e63b1fd55069fb7cb35fb60f61ed7', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 13:33:38', 'L', 'BDG', 'peindre', NULL),
(32, '6b2e63b1fd55069fb7cb35fb60f61ed7', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 13:34:13', 'L', 'BDG', 'flexible', NULL),
(33, '6b2e63b1fd55069fb7cb35fb60f61ed7', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 13:34:36', 'L', 'BDG', 'ponctual', NULL),
(34, '6b2e63b1fd55069fb7cb35fb60f61ed7', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 13:34:48', 'L', 'BDG', 'amical', NULL),
(35, '6b2e63b1fd55069fb7cb35fb60f61ed7', 'f7a5c01ea63f9176ff7352da1b5dcaa5', '2013-05-30 13:35:24', 'L', 'BDG', 'bricoler', NULL),
(36, '6b2e63b1fd55069fb7cb35fb60f61ed7', 'a3cefde48284f70b2098d7015e987148', '2013-05-30 13:35:46', 'L', 'BDG', 'electricity', NULL),
(37, '6b2e63b1fd55069fb7cb35fb60f61ed7', '2bd8063bffa0986bfbe7e265cfba8a63', '2013-05-30 13:35:57', 'L', 'BDG', 'couture', NULL),
(38, '6b2e63b1fd55069fb7cb35fb60f61ed7', '48ae9648a43e3633ae647c2583d84116', '2013-05-30 13:36:14', 'L', 'BDG', 'decor', NULL),
(39, '6b2e63b1fd55069fb7cb35fb60f61ed7', '2bd8063bffa0986bfbe7e265cfba8a63', '2013-05-30 13:36:48', 'L', 'BDG', 'direct', NULL),
(40, '6b2e63b1fd55069fb7cb35fb60f61ed7', '178cd2f3df2d88613b46bb6e96a77f3a', '2013-05-30 13:37:08', 'L', 'BDG', 'generous', NULL),
(41, '6b2e63b1fd55069fb7cb35fb60f61ed7', '48ae9648a43e3633ae647c2583d84116', '2013-05-30 13:37:21', 'L', 'BDG', 'open', NULL),
(42, '6b2e63b1fd55069fb7cb35fb60f61ed7', 'a530b55030587b46519449c39181d1b8', '2013-05-30 13:38:14', 'L', 'BDG', 'habile', NULL),
(43, '6b2e63b1fd55069fb7cb35fb60f61ed7', 'a530b55030587b46519449c39181d1b8', '2013-05-30 13:38:37', 'L', 'BDG', 'generous', NULL),
(44, '6b2e63b1fd55069fb7cb35fb60f61ed7', '178cd2f3df2d88613b46bb6e96a77f3a', '2013-05-30 13:39:02', 'L', 'BDG', 'nounou', NULL),
(45, 'a530b55030587b46519449c39181d1b8', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 15:10:53', 'L', 'BDG', 'travaillleur', NULL),
(46, 'a530b55030587b46519449c39181d1b8', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 15:11:11', 'L', 'BDG', 'dispo', NULL),
(47, 'a530b55030587b46519449c39181d1b8', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 15:12:04', 'L', 'BDG', 'bricoler', NULL),
(48, 'a530b55030587b46519449c39181d1b8', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 15:13:55', 'L', 'BDG', 'decor', NULL),
(49, 'a530b55030587b46519449c39181d1b8', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 15:14:09', 'L', 'BDG', 'amical', NULL),
(50, 'a530b55030587b46519449c39181d1b8', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 15:15:03', 'L', 'BDG', 'peindre', NULL),
(51, 'a530b55030587b46519449c39181d1b8', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-31 07:18:10', 'L', 'BDG', 'serviable', 84),
(52, 'a530b55030587b46519449c39181d1b8', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-31 07:19:29', 'L', 'BDG', 'peindre', 85),
(53, 'a530b55030587b46519449c39181d1b8', '941af2c99f4f7895b481ab9c3261e4ee', '2013-05-31 09:04:35', 'L', 'BDG', 'balenced', NULL),
(54, 'a530b55030587b46519449c39181d1b8', '941af2c99f4f7895b481ab9c3261e4ee', '2013-05-31 09:05:01', 'L', 'BDG', 'attachant', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id_msg` int(32) NOT NULL AUTO_INCREMENT,
  `id_usr_msg` varchar(32) DEFAULT NULL COMMENT 'sender',
  `id_grp_msg` varchar(32) DEFAULT NULL,
  `date_msg` datetime DEFAULT NULL,
  `content_msg` text,
  `mail_msg` text,
  `subject_msg` varchar(150) DEFAULT NULL,
  `status_msg` enum('N','R') DEFAULT 'N',
  `type_msg` enum('DE','ED','FO','OT','YD','ND','RB','AB','YB','NB','RU','CD') NOT NULL DEFAULT 'OT' COMMENT 'DE => start DEAL ED => end deal FO => follow user OT => other (no specific action) YD => accept deal ND => refuse deal AB => ask for badge YB => yes to give badge NB => no to give badge RB => receive badge',
  `smail_msg` smallint(1) NOT NULL DEFAULT '0',
  `active_msg` smallint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_msg`),
  KEY `id_usr_msg` (`id_usr_msg`,`id_grp_msg`),
  KEY `id_rec_msg` (`id_grp_msg`),
  KEY `date` (`date_msg`),
  KEY `status_usr_msg` (`status_msg`),
  KEY `smail_msg` (`smail_msg`,`active_msg`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=230 ;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id_msg`, `id_usr_msg`, `id_grp_msg`, `date_msg`, `content_msg`, `mail_msg`, `subject_msg`, `status_msg`, `type_msg`, `smail_msg`, `active_msg`) VALUES
(1, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-09-30 08:37:18', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(2, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-30 08:37:18', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(3, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-09-30 09:23:33', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(4, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-30 09:23:33', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(5, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-09-30 09:23:37', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(6, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-30 09:23:37', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(7, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-09-30 09:23:42', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(8, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-30 09:23:42', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(9, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-09-30 09:23:44', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(10, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-30 09:23:44', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(11, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-09-30 09:31:32', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(12, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-30 09:31:32', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(13, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-09-30 10:14:55', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(14, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-30 10:14:55', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {#accepted}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'OT', 1, 1),
(15, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-09-30 10:27:11', '{a#Zoubeidapousse01|Zoubeidapousse01#a} a accepté de collaborer avec vous. Ses données de contact vous sont dés à présent consultables.', '', 'Ahmad, vous avez un réponse à votre demande de collaboration.', 'R', 'YD', 1, 1),
(16, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-30 11:18:19', '{a#Ahmad gabriel|specialone#a} a mis fin à votre collaboration.', '', 'Ahmad gabriel a mis fin à votre collaboration.', 'R', 'ED', 1, 1),
(17, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-09-30 11:19:47', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(18, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-30 11:19:47', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {#accepted}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'OT', 1, 1),
(19, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-09-30 11:21:09', '{a#Zoubeidapousse01|Zoubeidapousse01#a} a accepté de collaborer avec vous. Ses données de contact vous sont dés à présent consultables.', '', 'Ahmad, vous avez un réponse à votre demande de collaboration.', 'R', 'YD', 1, 1),
(20, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-30 11:27:45', '{a#Ahmad gabriel|specialone#a} a mis fin à votre collaboration.', '', 'Ahmad gabriel a mis fin à votre collaboration.', 'R', 'ED', 1, 1),
(21, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-09-30 11:27:47', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(22, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-30 11:27:48', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(23, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 10:31:36', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(24, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 10:31:36', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(25, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 11:21:34', 'Vous êtes maintenant suivi par {a#Ahmad gabriel|specialone#a}.', '', 'Zoubeidapousse01, vous avez un nouveau suiveur sur Yoomken.', 'R', 'FO', 1, 1),
(26, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 11:27:37', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(27, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 11:27:37', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(28, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 11:33:29', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(29, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 11:33:29', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(30, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 11:36:19', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(31, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 11:36:19', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(32, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 11:38:52', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(33, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 11:38:52', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(34, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 11:40:26', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(35, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 11:40:26', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(36, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 11:43:01', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(37, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 11:43:01', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(38, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 11:44:27', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(39, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 11:44:27', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(40, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 11:46:23', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(41, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 11:46:23', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(42, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 11:48:12', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(43, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 11:48:12', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(44, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 11:49:56', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(45, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 11:49:57', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(46, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 11:52:28', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(47, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 11:52:28', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(48, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 11:54:25', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(49, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 11:54:25', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(50, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 11:55:54', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(51, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 11:55:54', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(52, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 11:57:04', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(53, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 11:57:04', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(54, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 12:00:49', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(55, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 12:00:49', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(56, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 12:01:21', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(57, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 12:01:21', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(58, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 12:02:23', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(59, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 12:02:23', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(60, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 12:04:06', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(61, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 12:04:06', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(62, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 12:05:32', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(63, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 12:05:32', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(64, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 12:07:59', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(65, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 12:07:59', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(66, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 12:09:14', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(67, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 12:09:14', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(68, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 12:10:41', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(69, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 12:10:41', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(70, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 12:15:04', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(71, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 12:15:05', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(72, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 12:17:46', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(73, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 12:17:46', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(74, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 12:20:40', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(75, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 12:20:40', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(76, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 12:24:14', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(77, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 12:24:14', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(78, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 12:27:13', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(79, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 12:27:13', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(80, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 12:30:06', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(81, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 12:30:06', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(82, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 12:31:53', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(83, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 12:31:53', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(84, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-10-01 12:33:12', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', '', 'R', 'OT', 1, 0),
(85, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 12:33:12', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#6b2e63b1fd55069fb7cb35fb60f61ed7#reject}', '{a#Ahmad gabriel|specialone#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Ahmad gabriel vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(86, '00', 'a3cefde48284f70b2098d7015e987148', '2012-10-01 17:00:40', 'Vous êtes maintenant suivi par {a#Zoubeidapousse01|Zoubeidapousse01#a}.', '', 'Selim, vous avez un nouveau suiveur sur Yoomken.', 'R', 'FO', 1, 0),
(87, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-03 20:38:06', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Selim Pousse|Selimpousse#a}.', '', '', 'R', 'OT', 1, 1),
(88, '00', 'a3cefde48284f70b2098d7015e987148', '2012-10-03 20:38:06', '{a#Zoubeidapousse01|Zoubeidapousse01#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#7d6653aaa16976e12b6cf7c774f83c1f#reject}', '{a#Zoubeidapousse01|Zoubeidapousse01#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Zoubeidapousse01 vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 1),
(90, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-15 00:04:28', 'Vous êtes maintenant suivi par {a#Hakim|Kim#a}.', '', 'Shingo, vous avez un nouveau suiveur sur Yoomken.', 'R', 'FO', 0, 1),
(92, '00', '48ae9648a43e3633ae647c2583d84116', '2012-11-15 00:04:37', '{a#Hakim|Kim#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {accept#79b1b9dc1b338006650c78d3b4919b04#reject}', '{a#Hakim|Kim#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Hakim vous a transmis une invitation pour collaborer sur Yoomken.', 'N', 'DE', 1, 1),
(93, '79b1b9dc1b338006650c78d3b4919b04', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-15 00:24:41', 'hello ca va', '', '', 'R', 'OT', 0, 1),
(94, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-15 00:24:41', 'hello ca va', '{a#|#a} vous a envoyé un nouveau message sur Yoomken.', ' vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'OT', 0, 0),
(95, '79b1b9dc1b338006650c78d3b4919b04', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-15 00:24:45', 'hello ca va', '', '', 'R', 'OT', 0, 1),
(96, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-15 00:24:45', 'hello ca va', '{a#|#a} vous a envoyé un nouveau message sur Yoomken.', ' vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'OT', 0, 0),
(97, '79b1b9dc1b338006650c78d3b4919b04', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-15 00:24:47', 'hello ca va', '', '', 'R', 'OT', 0, 1),
(98, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-15 00:24:47', 'hello ca va', '{a#|#a} vous a envoyé un nouveau message sur Yoomken.', ' vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'OT', 0, 0),
(99, '79b1b9dc1b338006650c78d3b4919b04', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-15 00:24:47', 'hello ca va', '', '', 'R', 'OT', 0, 1),
(100, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-15 00:24:47', 'hello ca va', '{a#|#a} vous a envoyé un nouveau message sur Yoomken.', ' vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'OT', 0, 0),
(101, '79b1b9dc1b338006650c78d3b4919b04', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-15 00:24:49', 'hello ca va', '', '', 'R', 'OT', 0, 1),
(102, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-15 00:24:49', 'hello ca va', '{a#|#a} vous a envoyé un nouveau message sur Yoomken.', ' vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'OT', 0, 0),
(103, '79b1b9dc1b338006650c78d3b4919b04', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-15 00:24:49', 'hello ca va', '', '', 'R', 'OT', 0, 1),
(104, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-15 00:24:49', 'hello ca va', '{a#|#a} vous a envoyé un nouveau message sur Yoomken.', ' vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'OT', 0, 0),
(105, '79b1b9dc1b338006650c78d3b4919b04', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-15 00:24:50', 'hello ca va', '', '', 'R', 'OT', 0, 1),
(106, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-15 00:24:50', 'hello ca va', '{a#|#a} vous a envoyé un nouveau message sur Yoomken.', ' vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'OT', 0, 0),
(107, '79b1b9dc1b338006650c78d3b4919b04', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-15 00:24:50', 'hello ca va', '', '', 'R', 'OT', 0, 1),
(108, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-15 00:24:50', 'hello ca va', '{a#|#a} vous a envoyé un nouveau message sur Yoomken.', ' vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'OT', 0, 0),
(109, '79b1b9dc1b338006650c78d3b4919b04', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-15 00:24:51', 'hello ca va', '', '', 'R', 'OT', 0, 1),
(110, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-15 00:24:51', 'hello ca va', '{a#|#a} vous a envoyé un nouveau message sur Yoomken.', ' vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'OT', 0, 0),
(111, '79b1b9dc1b338006650c78d3b4919b04', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-15 00:24:51', 'hello ca va', '', '', 'R', 'OT', 0, 1),
(112, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-15 00:24:51', 'hello ca va', '{a#|#a} vous a envoyé un nouveau message sur Yoomken.', ' vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'OT', 0, 0),
(113, '79b1b9dc1b338006650c78d3b4919b04', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-15 00:24:51', 'hello ca va', '', '', 'R', 'OT', 0, 1),
(114, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-15 00:24:51', 'hello ca va', '{a#|#a} vous a envoyé un nouveau message sur Yoomken.', ' vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'OT', 0, 0),
(115, '79b1b9dc1b338006650c78d3b4919b04', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-15 00:24:54', 'hello ca va', '', '', 'R', 'OT', 0, 1),
(116, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-15 00:24:54', 'hello ca va', '{a#|#a} vous a envoyé un nouveau message sur Yoomken.', ' vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'OT', 0, 0),
(118, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-15 00:24:55', 'hello ca va', '{a#|#a} vous a envoyé un nouveau message sur Yoomken.', ' vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'OT', 0, 0),
(120, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-15 00:24:56', 'hello ca va', '{a#|#a} vous a envoyé un nouveau message sur Yoomken.', ' vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'OT', 0, 0),
(121, '79b1b9dc1b338006650c78d3b4919b04', '48ae9648a43e3633ae647c2583d84116', '2012-11-15 23:28:02', 'Tu veux bien me contacter?', '', '', 'N', 'OT', 0, 1),
(122, '00', '48ae9648a43e3633ae647c2583d84116', '2012-11-15 23:28:02', 'Tu veux bien me contacter?', '{a#|#a} vous a envoyé un nouveau message sur Yoomken.', ' vous a transmis une invitation pour collaborer sur Yoomken.', 'N', 'OT', 1, 0),
(123, '7d6653aaa16976e12b6cf7c774f83c1f', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-17 07:38:57', 'hello ca va', '', '', 'R', 'OT', 0, 1),
(124, '00', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-17 07:38:57', 'hello ca va', '{a#Shingo|Shingo#a} vous a envoyé un nouveau message sur Yoomken.', 'Shingo vous a envoyé un nouveau message sur Yoomken.', 'R', 'OT', 1, 0),
(125, '79b1b9dc1b338006650c78d3b4919b04', '841ef8a50591e500450e46b20f0071cd', '2012-11-17 13:39:02', 'J''ai rien a dire', '', '', 'N', 'OT', 0, 1),
(126, '00', '841ef8a50591e500450e46b20f0071cd', '2012-11-17 13:39:02', 'J''ai rien a dire', 'MAIL_NEW_MSG', 'MAIL_NEW_MSG', 'N', 'OT', 1, 0),
(127, '79b1b9dc1b338006650c78d3b4919b04', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-18 12:06:07', 'hello, contacte moi\n', '', '', 'R', 'OT', 0, 1),
(128, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-18 12:06:07', 'hello, contacte moi\n', '{a#Hakim|Kim#a} vous a envoyé un nouveau message sur Yoomken.', 'Hakim vous a envoyé un nouveau message sur Yoomken.', 'R', 'OT', 0, 0),
(129, '7d6653aaa16976e12b6cf7c774f83c1f', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-18 12:06:26', 'je te contacte\n', '', '', 'R', 'OT', 0, 1),
(130, '00', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-18 12:06:26', 'je te contacte\n', '{a#Shingo|Shingo#a} vous a envoyé un nouveau message sur Yoomken.', 'Shingo vous a envoyé un nouveau message sur Yoomken.', 'R', 'OT', 1, 0),
(131, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-18 12:07:59', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Hakim|Kim#a}.', '', '', 'R', 'OT', 1, 1),
(132, '00', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-18 12:07:59', '{a#Shingo|Shingo#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {#accepted}', '{a#Shingo|Shingo#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Shingo vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'OT', 1, 0),
(133, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-18 12:08:12', 'Une demande d''invitation à la collaboration a été envoyé  par votre initiative à {a#Hakim|Kim#a}.', '', '', 'R', 'OT', 1, 1),
(134, '00', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-18 12:08:12', '{a#Shingo|Shingo#a} souhaiterai collaborer avec vous. En acceptant la collaboration, vous échangez en même temps vos coordonnées et il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous donc cette collaboration? {#accepted}', '{a#Shingo|Shingo#a} souhaiterai collaborer avec vous. Rejoinez votre réseau sur Yoomken pour répondre à son offre.', 'Shingo vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'OT', 1, 0),
(135, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-18 12:08:30', '{a#Hakim|Kim#a} a accepté de collaborer avec vous. Ses données de contact vous sont dés à présent consultables.', '', 'Shingo, vous avez un réponse à votre demande de collaboration.', 'R', 'YD', 0, 1),
(136, '00', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-18 12:16:21', '{a#Hakim|Kim#a} a accepté de collaborer avec vous. Ses données de contact vous sont dés à présent consultables.', '', 'Shingo, vous avez un réponse à votre demande de collaboration.', 'R', 'YD', 0, 1),
(137, '00', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-18 12:20:32', '{a#Shingo|Shingo#a} a posté sur votre journal : \n "{a#j''ecris un message sur ton mur|/journal/577e2644405566381b5b301a94bd3fa7#a}"', '', 'Shingo {#user} a posté sur votre journal', 'R', 'OT', 1, 0),
(138, '00', '0fbef09a987b7a2f6f5aad18a31a5c43', '2012-11-27 21:14:37', 'Bienvenue sur Yoomken  Selim Pousse,<br>\nPrenez quelques minutes afin que Yoomken soit plus proche de vous. Il est important de préparer votre meilleur profil qui vous reflète ainsi que vos intérêts, vous réaliserez avec quelle rapidité Yoomken vous aide à détecter vos cibles.<br>\nComment suivre les bonnes personnes ? Le filtrage est au c?ur du fonctionnement de Yoomken. Utiliser la puissance de vos filtres (qui apparaissent sur la barre de gauche des pages {a#Réseau|network#a} et {a#Journal|timeline#a}) afin de construire un réseau de contact qui vous convient.<br>\nA bientôt pour une nouvelle découverte.', '', '', 'R', 'OT', 1, 1),
(139, '00', '9dc4cd2d6c07049b21ccb1b21bfadbf8', '2012-11-27 21:24:25', 'Bienvenue sur Yoomken  Ahmad Gabriel AL KOTOB,<br>\nPrenez quelques minutes afin que Yoomken soit plus proche de vous. Il est important de préparer votre meilleur profil qui vous reflète ainsi que vos intérêts, vous réaliserez avec quelle rapidité Yoomken vous aide à détecter vos cibles.<br>\nComment suivre les bonnes personnes ? Le filtrage est au c?ur du fonctionnement de Yoomken. Utiliser la puissance de vos filtres (qui apparaissent sur la barre de gauche des pages {a#Réseau|network#a} et {a#Journal|timeline#a}) afin de construire un réseau de contact qui vous convient.<br>\nA bientôt pour une nouvelle découverte.', '', '', 'N', 'OT', 1, 1),
(140, '00', '1df9e06e56cdc06289a2068cf52cd611', '2012-11-27 21:25:18', 'Bienvenue sur Yoomken  Ahmad Gabriel AL KOTOB,<br>\nPrenez quelques minutes afin que Yoomken soit plus proche de vous. Il est important de préparer votre meilleur profil qui vous reflète ainsi que vos intérêts, vous réaliserez avec quelle rapidité Yoomken vous aide à détecter vos cibles.<br>\nComment suivre les bonnes personnes ? Le filtrage est au c?ur du fonctionnement de Yoomken. Utiliser la puissance de vos filtres (qui apparaissent sur la barre de gauche des pages {a#Réseau|network#a} et {a#Journal|timeline#a}) afin de construire un réseau de contact qui vous convient.<br>\nA bientôt pour une nouvelle découverte.', '', '', 'N', 'OT', 1, 1);
INSERT INTO `message` (`id_msg`, `id_usr_msg`, `id_grp_msg`, `date_msg`, `content_msg`, `mail_msg`, `subject_msg`, `status_msg`, `type_msg`, `smail_msg`, `active_msg`) VALUES
(141, '00', '1b5d5518c800d0929e8d072ff556638b', '2012-11-27 21:26:30', 'Bienvenue sur Yoomken  Ahmad Gabriel AL KOTOB,<br>\nPrenez quelques minutes afin que Yoomken soit plus proche de vous. Il est important de préparer votre meilleur profil qui vous reflète ainsi que vos intérêts, vous réaliserez avec quelle rapidité Yoomken vous aide à détecter vos cibles.<br>\nComment suivre les bonnes personnes ? Le filtrage est au c?ur du fonctionnement de Yoomken. Utiliser la puissance de vos filtres (qui apparaissent sur la barre de gauche des pages {a#Réseau|network#a} et {a#Journal|timeline#a}) afin de construire un réseau de contact qui vous convient.<br>\nA bientôt pour une nouvelle découverte.', '', '', 'N', 'OT', 1, 1),
(142, '00', 'f7a5c01ea63f9176ff7352da1b5dcaa5', '2012-11-27 21:57:38', 'Bienvenue sur Yoomken  Ahmad Gabriel AL KOTOB,<br>\nPrenez quelques minutes afin que Yoomken soit plus proche de vous. Il est important de préparer votre meilleur profil qui vous reflète ainsi que vos intérêts, vous réaliserez avec quelle rapidité Yoomken vous aide à détecter vos cibles.<br>\nComment suivre les bonnes personnes ? Le filtrage est au c?ur du fonctionnement de Yoomken. Utiliser la puissance de vos filtres (qui apparaissent sur la barre de gauche des pages {a#Réseau|network#a} et {a#Journal|timeline#a}) afin de construire un réseau de contact qui vous convient.<br>\nA bientôt pour une nouvelle découverte.', '', '', 'R', 'OT', 1, 1),
(144, '00', '5a6097a8f128c86769da4e977927a78d', '2013-04-17 02:33:27', '<span> <a href="http://dev.yoomken.com/Selimpousse2/about" target="_blank">Selim Pousse</a> sollicite votre aide pour acquérir le badge Amusant.</span><br class="cleared"/><span class=''left'' style="margin: 5px 5px 5px 0"><img src="http://dev.yoomken.com//media/img/badges/badge_funny160_fr_or.png" switch=""alt="Amusant"style="width: 80px;height: 80px;float:left;border:none;margin:0 5px 0 0"class=""title="funny"/><span style="overflow-y: hidden;max-height: 15px;;"><a class="fn edit" style=''color: #F26B51;margin-top: 3px;''>Badge Amusant</a> <span style="font-weight: normal;font-size: 12px;">(Personnalité)</span></span><br/><span class="" style=''''>Les personnes qui ont acquis ce badge ont montré qu''ils ont une facilité à amuser les gens qu''ils soient petits ou grands.</span></span><br class="cleared"/><span style=''''>Acceptez-vous d''accorder sa demande de badge ? {#rejected}</span>', '<table style="width: 100%" style=""><tr><td>&nbsp;</td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Selimpousse2/about" target="_blank"><img src="http://www.gravatar.com/avatar/79f5749fb3e6e26285f00e3788596861?s=75&d=identicon&r=g" switch=""alt="Selim Pousse" style=''float:left;border-radius: 6px;margin-right:12px''width="80" height="80"class=""title="Selim Pousse"/></a><a href="http://dev.yoomken.com/Selimpousse2/about" target="_blank" style="{#astyle}">Selim Pousse</a> sollicite votre aide pour acquérir le badge Amusant.</p></td></tr><tr><td><a href=''"http://dev.yoomken.com/badges/funny''><img src="http://dev.yoomken.com//media/img/badges/badge_funny160_fr_or.png" switch=""alt="Amusant"style="width: 160px;height: 160px;float:left;border:none;margin-right:5px"class=""title="funny"/></a></td><td><span style=''float:left''><h4 style="overflow-y: hidden;max-height: 15px;"><a class="fn edit" style=''margin-top: 3px;color:{#astyle};''>Badge Amusant</a> <span style="font-weight: normal;font-size: 12px;">(Personnalité)</span></h4><p class="" style=''''>Les personnes qui ont acquis ce badge ont montré qu''ils ont une facilité à amuser les gens qu''ils soient petits ou grands.</p></span></td></tr><tr><td colspan="2"><p>Rejoignez le réseau Yoomken pour répondre à sa demande !</p></td></tr></table>', 'Selim Pousse vous avez reçu une demande de badge.', 'R', 'OT', 1, 1),
(146, '00', '5a6097a8f128c86769da4e977927a78d', '2013-04-17 02:36:41', ' {a#Selim Pousse|Selimpousse2#a} a rejeté votre demande de recevoir le badge Attachant', '', 'la demande de votre badge a été refusé.', 'R', 'NB', 1, 1),
(147, '00', '5a6097a8f128c86769da4e977927a78d', '2013-04-17 02:36:46', ' {a#Selim Pousse|Selimpousse2#a} a rejeté votre demande de recevoir le badge Amusant', '', 'la demande de votre badge a été refusé.', 'R', 'NB', 1, 1),
(148, '00', '5a6097a8f128c86769da4e977927a78d', '2013-04-17 02:37:23', '<span> <a href="http://dev.yoomken.com/Selimpousse2/about" target="_blank">Selim Pousse</a> sollicite votre aide pour acquérir le badge Amusant.</span><br class="cleared"/><span class=''left'' style="margin: 5px 5px 5px 0"><img src="http://dev.yoomken.com//media/img/badges/badge_funny160_fr_or.png" switch=""alt="Amusant"style="width: 80px;height: 80px;float:left;border:none;margin:0 5px 0 0"class=""title="funny"/><span style="overflow-y: hidden;max-height: 15px;;"><a class="fn edit" style=''color: #F26B51;margin-top: 3px;''>Badge Amusant</a> <span style="font-weight: normal;font-size: 12px;">(Personnalité)</span></span><br/><span class="" style=''''>Les personnes qui ont acquis ce badge ont montré qu''ils ont une facilité à amuser les gens qu''ils soient petits ou grands.</span></span><br class="cleared"/><span style=''''>Acceptez-vous d''accorder sa demande de badge ? {#rejected}</span>', '<table style="width: 100%" style=""><tr><td>&nbsp;</td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Selimpousse2/about" target="_blank"><img src="http://www.gravatar.com/avatar/79f5749fb3e6e26285f00e3788596861?s=75&d=identicon&r=g" switch=""alt="Selim Pousse" style=''float:left;border-radius: 6px;margin-right:12px''width="80" height="80"class=""title="Selim Pousse"/></a><a href="http://dev.yoomken.com/Selimpousse2/about" target="_blank" style="{#astyle}">Selim Pousse</a> sollicite votre aide pour acquérir le badge Amusant.</p></td></tr><tr><td><a href=''"http://dev.yoomken.com/badges/funny''><img src="http://dev.yoomken.com//media/img/badges/badge_funny160_fr_or.png" switch=""alt="Amusant"style="width: 160px;height: 160px;float:left;border:none;margin-right:5px"class=""title="funny"/></a></td><td><span style=''float:left''><h4 style="overflow-y: hidden;max-height: 15px;"><a class="fn edit" style=''margin-top: 3px;color:{#astyle};''>Badge Amusant</a> <span style="font-weight: normal;font-size: 12px;">(Personnalité)</span></h4><p class="" style=''''>Les personnes qui ont acquis ce badge ont montré qu''ils ont une facilité à amuser les gens qu''ils soient petits ou grands.</p></span></td></tr><tr><td colspan="2"><p>Rejoignez le réseau Yoomken pour répondre à sa demande !</p></td></tr></table>', 'Selim Pousse vous avez reçu une demande de badge.', 'R', 'OT', 1, 1),
(149, '00', 'f7a5c01ea63f9176ff7352da1b5dcaa5', '2013-04-17 02:43:13', '<span> <a href="http://dev.yoomken.com/Selimpousse2/about" target="_blank">Selim Pousse</a> sollicite votre aide pour acquérir le badge Amusant.</span><br class="cleared"/><span class=''left'' style="margin: 5px 5px 5px 0"><img src="http://dev.yoomken.com//media/img/badges/badge_funny160_fr_or.png" switch=""alt="Amusant"style="width: 80px;height: 80px;float:left;border:none;margin:0 5px 0 0"class=""title="funny"/><span style="overflow-y: hidden;max-height: 15px;;"><a class="fn edit" style=''color: #F26B51;margin-top: 3px;''>Badge Amusant</a> <span style="font-weight: normal;font-size: 12px;">(Personnalité)</span></span><br/><span class="" style=''''>Les personnes qui ont acquis ce badge ont montré qu''ils ont une facilité à amuser les gens qu''ils soient petits ou grands.</span></span><br class="cleared"/><span style=''''>Acceptez-vous d''accorder sa demande de badge ? {accept#5a6097a8f128c86769da4e977927a78d-BADGE-funny#reject}</span>', '<table style="width: 100%" style=""><tr><td>&nbsp;</td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Selimpousse2/about" target="_blank"><img src="http://www.gravatar.com/avatar/79f5749fb3e6e26285f00e3788596861?s=75&d=identicon&r=g" switch=""alt="Selim Pousse" style=''float:left;border-radius: 6px;margin-right:12px''width="80" height="80"class=""title="Selim Pousse"/></a><a href="http://dev.yoomken.com/Selimpousse2/about" target="_blank" style="{#astyle}">Selim Pousse</a> sollicite votre aide pour acquérir le badge Amusant.</p></td></tr><tr><td><a href=''"http://dev.yoomken.com/badges/funny''><img src="http://dev.yoomken.com//media/img/badges/badge_funny160_fr_or.png" switch=""alt="Amusant"style="width: 160px;height: 160px;float:left;border:none;margin-right:5px"class=""title="funny"/></a></td><td><span style=''float:left''><h4 style="overflow-y: hidden;max-height: 15px;"><a class="fn edit" style=''margin-top: 3px;color:{#astyle};''>Badge Amusant</a> <span style="font-weight: normal;font-size: 12px;">(Personnalité)</span></h4><p class="" style=''''>Les personnes qui ont acquis ce badge ont montré qu''ils ont une facilité à amuser les gens qu''ils soient petits ou grands.</p></span></td></tr><tr><td colspan="2"><p>Rejoignez le réseau Yoomken pour répondre à sa demande !</p></td></tr></table>', 'Ahmad Gabriel Al Kotob vous avez reçu une demande de badge.', 'N', 'AB', 1, 1),
(150, '00', 'f7a5c01ea63f9176ff7352da1b5dcaa5', '2013-04-17 02:48:27', '<img src="http://dev.yoomken.com//media/img/badges/badge_funny160_fr_or.png" switch=""alt="Amusant"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="funny"/><span>Félicitations ! Vous avez reçu le badge Amusant de <a href="http://dev.yoomken.com/Selimpousse2/wall" target="_blank">Selim Pousse</a>.</span>', '<table style="width: 100%;"><tr><td>&nbsp;</td></tr><tr><td colspan="2"><p>Félicitations ! Vous avez reçu le badge Amusant de <a href="http://dev.yoomken.com/Selimpousse2/about" target="_blank" style=''color:{#acolor};''>Selim Pousse</a> .</p></td></tr><tr><td>&nbsp;</td></tr><tr><td><a href=''"http://dev.yoomken.com/badges/funny''><img src="http://dev.yoomken.com//media/img/badges/badge_funny160_fr_or.png" switch=""alt="Amusant"style="width: 160px;height: 160px;float:left;border:none;margin-right:5px"class=""title="funny"/></a></td><td ><span style=''float:left''><h4 style="overflow-y: hidden;max-height: 15px;"><a class="fn edit" style=''margin-top: 3px;font-weight: bold;color:{#acolor};''>Badge Amusant</a> <span style="font-weight: normal;font-size: 12px;">(Personnalité)</span></h4><p class="" style=''''>Les personnes qui ont acquis ce badge ont montré qu''ils ont une facilité à amuser les gens qu''ils soient petits ou grands.</p></span></td></tr></table>', 'vous avez reçu un nouveau badge.', 'N', 'RB', 1, 1),
(151, '00', '5a6097a8f128c86769da4e977927a78d', '2013-04-17 02:48:42', ' {a#Selim Pousse|Selimpousse2#a} a rejeté votre demande de recevoir le badge Amusant', '', 'la demande de votre badge a été refusé.', 'R', 'NB', 1, 1),
(152, '00', '5a6097a8f128c86769da4e977927a78d', '2013-04-17 02:52:54', '<img src="http://dev.yoomken.com//media/img/badges/badge_funny160_fr_or.png" switch=""alt="Amusant"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="funny"/><span>Félicitations ! Vous avez reçu le badge Amusant de <a href="http://dev.yoomken.com/Shingo/wall" target="_blank">shingo</a>.</span>', '<table style="width: 100%;"><tr><td>&nbsp;</td></tr><tr><td colspan="2"><p>Félicitations ! Vous avez reçu le badge Amusant de <a href="http://dev.yoomken.com/Shingo/about" target="_blank" style=''color:{#acolor};''>shingo</a> .</p></td></tr><tr><td>&nbsp;</td></tr><tr><td><a href=''"http://dev.yoomken.com/badges/funny''><img src="http://dev.yoomken.com//media/img/badges/badge_funny160_fr_or.png" switch=""alt="Amusant"style="width: 160px;height: 160px;float:left;border:none;margin-right:5px"class=""title="funny"/></a></td><td ><span style=''float:left''><h4 style="overflow-y: hidden;max-height: 15px;"><a class="fn edit" style=''margin-top: 3px;font-weight: bold;color:{#acolor};''>Badge Amusant</a> <span style="font-weight: normal;font-size: 12px;">(Personnalité)</span></h4><p class="" style=''''>Les personnes qui ont acquis ce badge ont montré qu''ils ont une facilité à amuser les gens qu''ils soient petits ou grands.</p></span></td></tr></table>', 'vous avez reçu un nouveau badge.', 'R', 'RB', 1, 1),
(153, '00', 'a3cefde48284f70b2098d7015e987148', '2013-04-17 02:53:21', '<span> <a href="http://dev.yoomken.com/Selimpousse2/about" target="_blank">Selim Pousse</a> sollicite votre aide pour acquérir le badge Baby-sitting.</span><br class="cleared"/><span class=''left'' style="margin: 5px 5px 5px 0"><img src="http://dev.yoomken.com//media/img/badges/badge_nounou160_fr_ma.png" switch=""alt="Baby-sitting"style="width: 80px;height: 80px;float:left;border:none;margin:0 5px 0 0"class=""title="nounou"/><span style="overflow-y: hidden;max-height: 15px;;"><a class="fn edit" style=''color: #F26B51;margin-top: 3px;''>Badge Baby-sitting</a> <span style="font-weight: normal;font-size: 12px;">(Compétences)</span></span><br/><span class="" style=''''>Les personns qui ont reçu ce badge ont prouvé qu''ils savent accorder une attention aux enfants et de les éduquer de façon ludique.</span></span><br class="cleared"/><span style=''''>Acceptez-vous d''accorder sa demande de badge ? {#accepted}</span>', '<table style="width: 100%" style=""><tr><td>&nbsp;</td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Selimpousse2/about" target="_blank"><img src="http://www.gravatar.com/avatar/79f5749fb3e6e26285f00e3788596861?s=75&d=identicon&r=g" switch=""alt="Selim Pousse" style=''float:left;border-radius: 6px;margin-right:12px''width="80" height="80"class=""title="Selim Pousse"/></a><a href="http://dev.yoomken.com/Selimpousse2/about" target="_blank" style="{#astyle}">Selim Pousse</a> sollicite votre aide pour acquérir le badge Baby-sitting.</p></td></tr><tr><td><a href=''"http://dev.yoomken.com/badges/nounou''><img src="http://dev.yoomken.com//media/img/badges/badge_nounou160_fr_ma.png" switch=""alt="Baby-sitting"style="width: 160px;height: 160px;float:left;border:none;margin-right:5px"class=""title="nounou"/></a></td><td><span style=''float:left''><h4 style="overflow-y: hidden;max-height: 15px;"><a class="fn edit" style=''margin-top: 3px;color:{#astyle};''>Badge Baby-sitting</a> <span style="font-weight: normal;font-size: 12px;">(Compétences)</span></h4><p class="" style=''''>Les personns qui ont reçu ce badge ont prouvé qu''ils savent accorder une attention aux enfants et de les éduquer de façon ludique.</p></span></td></tr><tr><td colspan="2"><p>Rejoignez le réseau Yoomken pour répondre à sa demande !</p></td></tr></table>', 'shingo vous avez reçu une demande de badge.', 'R', 'OT', 1, 0),
(154, '00', '5a6097a8f128c86769da4e977927a78d', '2013-04-17 02:53:40', 'Féliciatations ! {a#shingo|Shingo#a} a accepté de vous donner le badge  Baby-sitting', '', 'vous avez reçu un nouveau badge.', 'R', 'YB', 1, 1),
(155, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-04-18 23:38:15', '<img src="http://dev.yoomken.com//media/img/badges/badge_bricoler160_fr_ma.png" switch=""alt="Bricolage"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="bricoler"/><span>Félicitations ! Vous avez reçu le badge Bricolage de <a href="http://dev.yoomken.com/Kim/wall" target="_blank">Hakim Pousse</a>.</span>', '<table style="width: 100%;"><tr><td>&nbsp;</td></tr><tr><td colspan="2"><p>Félicitations ! Vous avez reçu le badge Bricolage de <a href="http://dev.yoomken.com/Kim/about" target="_blank" style=''color:{#acolor};''>Hakim Pousse</a> .</p></td></tr><tr><td>&nbsp;</td></tr><tr><td><a href=''"http://dev.yoomken.com/badges/bricoler''><img src="http://dev.yoomken.com//media/img/badges/badge_bricoler160_fr_ma.png" switch=""alt="Bricolage"style="width: 160px;height: 160px;float:left;border:none;margin-right:5px"class=""title="bricoler"/></a></td><td ><span style=''float:left''><h4 style="overflow-y: hidden;max-height: 15px;"><a class="fn edit" style=''margin-top: 3px;font-weight: bold;color:{#acolor};''>Badge Bricolage</a> <span style="font-weight: normal;font-size: 12px;">(Compétences)</span></h4><p class="" style=''''></p></span></td></tr></table>', 'vous avez reçu un nouveau badge.', 'R', 'RB', 1, 1),
(156, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-04-18 23:38:55', '<img src="http://dev.yoomken.com//media/img/badges/badge_attachant160_fr_or.png" switch=""alt="Attachant"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="attachant"/><span>Félicitations ! Vous avez reçu le badge Attachant de <a href="http://dev.yoomken.com/Kim/wall" target="_blank">Hakim Pousse</a>.</span>', '<table style="width: 100%;"><tr><td>&nbsp;</td></tr><tr><td colspan="2"><p>Félicitations ! Vous avez reçu le badge Attachant de <a href="http://dev.yoomken.com/Kim/about" target="_blank" style=''color:{#acolor};''>Hakim Pousse</a> .</p></td></tr><tr><td>&nbsp;</td></tr><tr><td><a href=''"http://dev.yoomken.com/badges/attachant''><img src="http://dev.yoomken.com//media/img/badges/badge_attachant160_fr_or.png" switch=""alt="Attachant"style="width: 160px;height: 160px;float:left;border:none;margin-right:5px"class=""title="attachant"/></a></td><td ><span style=''float:left''><h4 style="overflow-y: hidden;max-height: 15px;"><a class="fn edit" style=''margin-top: 3px;font-weight: bold;color:{#acolor};''>Badge Attachant</a> <span style="font-weight: normal;font-size: 12px;">(Personnalité)</span></h4><p class="" style=''''></p></span></td></tr></table>', 'vous avez reçu un nouveau badge.', 'R', 'RB', 1, 1),
(157, '00', 'a3cefde48284f70b2098d7015e987148', '2013-04-18 23:40:09', '<img src="http://dev.yoomken.com//media/img/badges/badge_attachant160_fr_or.png" switch=""alt="Attachant"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="attachant"/><span>Félicitations ! Vous avez reçu le badge Attachant de <a href="http://dev.yoomken.com/Kim/wall" target="_blank">Hakim Pousse</a>.</span>', '<table style="width: 100%;"><tr><td>&nbsp;</td></tr><tr><td colspan="2"><p>Félicitations ! Vous avez reçu le badge Attachant de <a href="http://dev.yoomken.com/Kim/about" target="_blank" style=''color:{#acolor};''>Hakim Pousse</a> .</p></td></tr><tr><td>&nbsp;</td></tr><tr><td><a href=''"http://dev.yoomken.com/badges/attachant''><img src="http://dev.yoomken.com//media/img/badges/badge_attachant160_fr_or.png" switch=""alt="Attachant"style="width: 160px;height: 160px;float:left;border:none;margin-right:5px"class=""title="attachant"/></a></td><td ><span style=''float:left''><h4 style="overflow-y: hidden;max-height: 15px;"><a class="fn edit" style=''margin-top: 3px;font-weight: bold;color:{#acolor};''>Badge Attachant</a> <span style="font-weight: normal;font-size: 12px;">(Personnalité)</span></h4><p class="" style=''''></p></span></td></tr></table>', 'vous avez reçu un nouveau badge.', 'R', 'RB', 1, 0),
(158, '00', '841ef8a50591e500450e46b20f0071cd', '2013-04-18 23:40:41', '<p><a href="http://dev.yoomken.com/Kim/about" target="_blank" style="{#astyle}">Hakim Pousse</a> vous recommande d''entrer en relation de travail avec <a href="http://dev.yoomken.com/Specialone/about" target="_blank" style="{#astyle}">Ahmad gabriel</a> pour ses qualités de services à la personne :</p><table style=""><tr><td><a href="http://dev.yoomken.com/Specialone/timeline/wall"><img src="http://www.gravatar.com/avatar/c11a47a1a8d4154780cadaa798c718f2?s=75&d=identicon&r=g" switch=""alt="Ahmad gabriel"style=''margin-top:0px;margin-right: 12px;-webkit-border-radius: 6px;-moz-border-radius: 6px;border-radius: 6px;''width="80" height="80"title="Ahmad gabriel"/></a></td><td><table style=''''><tr><td style="overflow-y: hidden;max-height: 15px;"><a href="http://dev.yoomken.com/Specialone/timeline/wall" style=''color:{#acolor};margin-top: 3px;text-decoration: none;font-weight: bold''>Ahmad gabriel</a> <span>(Provider & Asker)</span></td></tr><tr><td style=''margin:3px 0;overflow-y: hidden;max-height: 15px;''><span>Sport</span></td></tr><tr><td><span>Paris, France</span></td></tr><tr><td><table><tr style=''''><td style="float:left;border-right:1px solid #8f8d89; padding-right:10px"><a href="http://dev.yoomken.com/Specialone/relations/init" style="color:{#acolor};text-decoration: none;"><b >2</b> <br/><span class="meta">Relations</span></a></td><td style="float:left;padding-left:10px"><a href="http://dev.yoomken.com/Specialone/badges" style="color:{#acolor};text-decoration: none;" ><b >2</b> <br/><span >Badges</span></a></td></tr></table></td></tr></table></td></tr></table>', '<p><a href="http://dev.yoomken.com/Kim/about" target="_blank" style="{#astyle}">Hakim Pousse</a> vous recommande d''entrer en relation de travail avec <a href="http://dev.yoomken.com/Specialone/about" target="_blank" style="{#astyle}">Ahmad gabriel</a> pour ses qualités de services à la personne :</p><table style=""><tr><td><a href="http://dev.yoomken.com/Specialone/timeline/wall"><img src="http://www.gravatar.com/avatar/c11a47a1a8d4154780cadaa798c718f2?s=75&d=identicon&r=g" switch=""alt="Ahmad gabriel"style=''margin-top:0px;margin-right: 12px;-webkit-border-radius: 6px;-moz-border-radius: 6px;border-radius: 6px;''width="80" height="80"title="Ahmad gabriel"/></a></td><td><table style=''''><tr><td style="overflow-y: hidden;max-height: 15px;"><a href="http://dev.yoomken.com/Specialone/timeline/wall" style=''color:{#acolor};margin-top: 3px;text-decoration: none;font-weight: bold''>Ahmad gabriel</a> <span>(Provider & Asker)</span></td></tr><tr><td style=''margin:3px 0;overflow-y: hidden;max-height: 15px;''><span>Sport</span></td></tr><tr><td><span>Paris, France</span></td></tr><tr><td><table><tr style=''''><td style="float:left;border-right:1px solid #8f8d89; padding-right:10px"><a href="http://dev.yoomken.com/Specialone/relations/init" style="color:{#acolor};text-decoration: none;"><b >2</b> <br/><span class="meta">Relations</span></a></td><td style="float:left;padding-left:10px"><a href="http://dev.yoomken.com/Specialone/badges" style="color:{#acolor};text-decoration: none;" ><b >2</b> <br/><span >Badges</span></a></td></tr></table></td></tr></table></td></tr></table>', 'Hakim Pousse vous suggère une relation de travail', 'N', 'RU', 1, 1),
(159, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-04-18 23:42:03', ' <a href="http://dev.yoomken.com/Kim/about" target="_blank">Hakim Pousse</a> souhaiterai collaborer avec vous.<br class="cleared"/><br/>Si vous acceptez la collaboration, il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous sa demande de collaboration ? {accept#79b1b9dc1b338006650c78d3b4919b04-DEAL-NULL#reject}', '<table style="width: 100%" style=""><tr><td>&nbsp;</td></tr><tr><td ><a href="http://dev.yoomken.com/Kim/about" target="_blank"><img src="http://www.gravatar.com/avatar/bfb6a655576cb10c956e4cbb28f0f55c?s=75&d=identicon&r=g" switch=""alt="Hakim Pousse" style=''float:left;border-radius: 6px;margin-right:12px''width="80" height="80"class=""title="Hakim Pousse"/></a></td><td><p><a href="http://dev.yoomken.com/Kim/about" target="_blank" style="{#astyle}">Hakim Pousse</a> souhaiterai collaborer avec vous.</p><p>Si vous acceptez la collaboration, il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. </p></td></tr><tr><td colspan="2"><p>Rejoignez le réseau Yoomken pour répondre à sa demande !</p></td></tr></table>', 'Hakim Pousse vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'DE', 1, 0),
(160, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-04-18 23:42:28', ' <a href="http://dev.yoomken.com/Kim/about" target="_blank">Hakim Pousse</a> souhaiterai collaborer avec vous.<br class="cleared"/><br/>Si vous acceptez la collaboration, il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous sa demande de collaboration ? {#accepted}', '<table style="width: 100%" style=""><tr><td>&nbsp;</td></tr><tr><td ><a href="http://dev.yoomken.com/Kim/about" target="_blank"><img src="http://www.gravatar.com/avatar/bfb6a655576cb10c956e4cbb28f0f55c?s=75&d=identicon&r=g" switch=""alt="Hakim Pousse" style=''float:left;border-radius: 6px;margin-right:12px''width="80" height="80"class=""title="Hakim Pousse"/></a></td><td><p><a href="http://dev.yoomken.com/Kim/about" target="_blank" style="{#astyle}">Hakim Pousse</a> souhaiterai collaborer avec vous.</p><p>Si vous acceptez la collaboration, il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. </p></td></tr><tr><td colspan="2"><p>Rejoignez le réseau Yoomken pour répondre à sa demande !</p></td></tr></table>', 'Hakim Pousse vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'OT', 1, 1),
(161, '00', 'f7a5c01ea63f9176ff7352da1b5dcaa5', '2013-04-19 09:45:48', 'Vous êtes maintenant suivi par {a#Selim Pousse|Selimpousse2#a}.', '', 'Ahmad, vous avez un nouveau suiveur sur Yoomken.', 'N', 'FO', 1, 1),
(162, '00', 'a3cefde48284f70b2098d7015e987148', '2013-04-19 09:45:49', 'Vous êtes maintenant suivi par {a#Selim Pousse|Selimpousse2#a}.', '', 'shingo, vous avez un nouveau suiveur sur Yoomken.', 'R', 'FO', 1, 0),
(163, '00', '841ef8a50591e500450e46b20f0071cd', '2013-04-19 09:45:51', 'Vous êtes maintenant suivi par {a#Selim Pousse|Selimpousse2#a}.', '', 'Selim, vous avez un nouveau suiveur sur Yoomken.', 'N', 'FO', 0, 1),
(164, '00', '48ae9648a43e3633ae647c2583d84116', '2013-04-19 09:45:53', 'Vous êtes maintenant suivi par {a#Selim Pousse|Selimpousse2#a}.', '', 'Fatene, vous avez un nouveau suiveur sur Yoomken.', 'N', 'FO', 1, 1),
(165, '00', '5a6097a8f128c86769da4e977927a78d', '2013-04-28 09:35:38', '{a#shingo|Shingo#a} a commenté votre question.\n				       							{a#accéder aux commentaires|journal/fae8c41b9f97670fad332eb081733396#a}', '', 'shingo a commenté votre question', 'R', 'OT', 1, 1),
(166, '00', '5a6097a8f128c86769da4e977927a78d', '2013-04-28 09:40:45', '{a#shingo|Shingo#a} a commenté votre question.\n				       							{a#accéder aux commentaires|journal/fae8c41b9f97670fad332eb081733396#a}', '', 'shingo a commenté votre question', 'R', 'OT', 1, 1),
(167, '00', '5a6097a8f128c86769da4e977927a78d', '2013-04-28 09:44:02', '{a#shingo|Shingo#a} a commenté votre question.\n				       							{a#accéder aux commentaires|journal/fae8c41b9f97670fad332eb081733396#a}', '', 'shingo a commenté votre question', 'R', 'OT', 1, 1),
(168, '', 'a3cefde48284f70b2098d7015e987148', '2013-04-28 09:47:48', '{a#Selim Pousse|Selimpousse2#a} a ajouté un commentaire dans une conversation où vous avez pris part.\n		       									{a#accéder aux commentaires|journal/fae8c41b9f97670fad332eb081733396#a}', '', 'Selim Pousse a ajouté un commentaire dans une conversation où vous avez pris part', 'N', 'OT', 0, 1),
(169, '00', 'f7a5c01ea63f9176ff7352da1b5dcaa5', '2013-04-28 09:48:06', ' <a href="http://dev.yoomken.com/Selimpousse2/about" target="_blank">Selim Pousse</a> souhaiterai collaborer avec vous.<br class="cleared"/><br/>Si vous acceptez la collaboration, il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous sa demande de collaboration ? {accept#5a6097a8f128c86769da4e977927a78d-DEAL-NULL#reject}', '<table style="width: 100%" style=""><tr><td>&nbsp;</td></tr><tr><td ><a href="http://dev.yoomken.com/Selimpousse2/about" target="_blank"><img src="http://www.gravatar.com/avatar/79f5749fb3e6e26285f00e3788596861?s=75&d=identicon&r=g" switch=""alt="Selim Pousse" style=''float:left;border-radius: 6px;margin-right:12px''width="80" height="80"class=""title="Selim Pousse"/></a></td><td><p><a href="http://dev.yoomken.com/Selimpousse2/about" target="_blank" style="{#astyle}">Selim Pousse</a> souhaiterai collaborer avec vous.</p><p>Si vous acceptez la collaboration, il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. </p></td></tr><tr><td colspan="2"><p>Rejoignez le réseau Yoomken pour répondre à sa demande !</p></td></tr></table>', 'Selim Pousse vous a transmis une invitation pour collaborer sur Yoomken.', 'N', 'DE', 1, 1),
(170, '00', 'd41d8cd98f00b204e9800998ecf8427e', '2013-05-24 13:15:42', '<p><a href="http://dev.yoomken.com/Selimpousse2/about" target="_blank" style="{#astyle}">Selim Pousse</a> recommend to start a working relationship with <a href="http://dev.yoomken.com/Ahmadgabrielalkotob/about" target="_blank" style="{#astyle}">Ahmad Gabriel Al Kotob</a> for his qualities of services :</p><table style=""><tr><td><a href="http://dev.yoomken.com/Ahmadgabrielalkotob/timeline/wall"><img src="http://www.gravatar.com/avatar/a7b2b2d4236f4839d889e349f6a1bd96?s=75&d=identicon&r=g" switch=""alt="Ahmad Gabriel Al Kotob"style=''margin-top:0px;margin-right: 12px;-webkit-border-radius: 6px;-moz-border-radius: 6px;border-radius: 6px;''width="80" height="80"title="Ahmad Gabriel Al Kotob"/></a></td><td><table style=''''><tr><td style="overflow-y: hidden;max-height: 15px;"><a href="http://dev.yoomken.com/Ahmadgabrielalkotob/timeline/wall" style=''color:{#acolor};margin-top: 3px;text-decoration: none;font-weight: bold''>Ahmad Gabriel Al Kotob</a> <span>(Provider & Asker)</span></td></tr><tr><td style=''margin:3px 0;overflow-y: hidden;max-height: 15px;''><span>Ménage & Linge</span></td></tr><tr><td><span>Paris, France</span></td></tr><tr><td><table><tr style=''''><td style="float:left;border-right:1px solid #8f8d89; padding-right:10px"><a href="http://dev.yoomken.com/Ahmadgabrielalkotob/relations/init" style="color:{#acolor};text-decoration: none;"><b >1</b> <br/><span class="meta">Relations</span></a></td><td style="float:left;padding-left:10px"><a href="http://dev.yoomken.com/Ahmadgabrielalkotob/badges" style="color:{#acolor};text-decoration: none;" ><b >1</b> <br/><span >Badges</span></a></td></tr></table></td></tr></table></td></tr></table>', '<table style="width: 100%" style=""><tr><td>&nbsp;</td></tr><tr><td colspan="2"><a href="http://dev.yoomken.com/Selimpousse2/about" target="_blank" style="{#astyle}">Selim Pousse</a> recommend to start a working relationship with <a href="http://dev.yoomken.com/Ahmadgabrielalkotob/about" target="_blank" style="{#astyle}">Ahmad Gabriel Al Kotob</a> for his qualities of services :</td></tr><tr><td>&nbsp;</td></tr><tr><td colspan="2"><table style=""><tr><td><a href="http://dev.yoomken.com/Ahmadgabrielalkotob/timeline/wall"><img src="http://www.gravatar.com/avatar/a7b2b2d4236f4839d889e349f6a1bd96?s=75&d=identicon&r=g" switch=""alt="Ahmad Gabriel Al Kotob"style=''margin-top:0px;margin-right: 12px;-webkit-border-radius: 6px;-moz-border-radius: 6px;border-radius: 6px;''width="80" height="80"title="Ahmad Gabriel Al Kotob"/></a></td><td><table style=''''><tr><td style="overflow-y: hidden;max-height: 15px;"><a href="http://dev.yoomken.com/Ahmadgabrielalkotob/timeline/wall" style=''color:{#acolor};margin-top: 3px;text-decoration: none;font-weight: bold''>Ahmad Gabriel Al Kotob</a> <span>(Provider & Asker)</span></td></tr><tr><td style=''margin:3px 0;overflow-y: hidden;max-height: 15px;''><span>Ménage & Linge</span></td></tr><tr><td><span>Paris, France</span></td></tr><tr><td><table><tr style=''''><td style="float:left;border-right:1px solid #8f8d89; padding-right:10px"><a href="http://dev.yoomken.com/Ahmadgabrielalkotob/relations/init" style="color:{#acolor};text-decoration: none;"><b >1</b> <br/><span class="meta">Relations</span></a></td><td style="float:left;padding-left:10px"><a href="http://dev.yoomken.com/Ahmadgabrielalkotob/badges" style="color:{#acolor};text-decoration: none;" ><b >1</b> <br/><span >Badges</span></a></td></tr></table></td></tr></table></td></tr></table></td></tr><tr><td>&nbsp;</td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com//relations" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Go there now</a></p></td></tr></table>', 'Selim Pousse recommend a working relationship with…', 'N', 'RU', 0, 1),
(171, '00', '941af2c99f4f7895b481ab9c3261e4ee', '2013-05-25 15:44:54', 'Welcome Hakim Pousse,<br>\nTake a few minutes to prepare your best profile that reflects your interests, and you will realize how quickly Yoomken helps you to find your targets.<br>\nEnjoy, it''s totally free :)', '', '', 'R', 'OT', 1, 1),
(172, '00', '5a6097a8f128c86769da4e977927a78d', '2013-05-30 10:51:05', 'Vous êtes maintenant suivi par {a#Charlotte|Charlotte#a}.', '', 'Selim, vous avez un nouveau suiveur sur Yoomken.', 'N', 'FO', 1, 1),
(173, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-30 10:51:11', 'Vous êtes maintenant suivi par {a#Charlotte|Charlotte#a}.', '', 'Ahmad, vous avez un nouveau suiveur sur Yoomken.', 'R', 'FO', 1, 1),
(174, '00', 'f7a5c01ea63f9176ff7352da1b5dcaa5', '2013-05-30 10:51:11', 'Vous êtes maintenant suivi par {a#Charlotte|Charlotte#a}.', '', 'Ahmad, vous avez un nouveau suiveur sur Yoomken.', 'N', 'FO', 1, 1),
(175, '00', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 15:33:23', '<img src="http://dev.yoomken.com//media/img/badges/badge_travaillleur160_fr_or.png" switch=""alt="Travaillleur"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="travaillleur"/><span>Félicitations ! Vous avez reçu le badge Travaillleur de <a href="http://dev.yoomken.com/Specialone/wall" target="_blank">Ahmad gabriel</a>.</span>', '<table cellpadding="10" cellspacing="0" style="width: 100%;"><tr><td colspan="2">Félicitations ! Vous avez reçu le badge Travaillleur de <a href="http://dev.yoomken.com/Specialone/about" target="_blank" style="{#astyle}">Ahmad gabriel</a> :</td></tr><tr><td style="width:160px"><img src="http://dev.yoomken.com/media/img/badges/badge_travaillleur160_fr_or.png" alt="Travaillleur" width="160" height="160" style="border:none;"/></td><td><span style="float:left"><h4 style="overflow-y: hidden;max-height: 15px;"><a style="margin-top: 3px;font-weight: bold;color:{#acolor};text-decoration: none" href="http://dev.yoomken.com/badges/travaillleur">Badge Travaillleur</a> <span style="font-weight: normal;font-size: 12px;">(Personnalité)</span></h4><p>Les personnes qui ont reçu ce badge détiennent une grande conscience professionelle. Ce genre de personnes sont prêt à donner leur tout pour que le résultat de leur travail soit utile ou bénéfique à d''autres.</p></span></td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Kim/relations" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p> </td></tr></table>', 'vous avez reçu un nouveau badge.', 'R', 'RB', 1, 1),
(176, '00', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 15:33:38', '<img src="http://dev.yoomken.com//media/img/badges/badge_peindre160_fr_ma.png" switch=""alt="Peinture"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="peindre"/><span>Félicitations ! Vous avez reçu le badge Peinture de <a href="http://dev.yoomken.com/Specialone/wall" target="_blank">Ahmad gabriel</a>.</span>', '<table cellpadding="10" cellspacing="0" style="width: 100%;"><tr><td colspan="2">Félicitations ! Vous avez reçu le badge Peinture de <a href="http://dev.yoomken.com/Specialone/about" target="_blank" style="{#astyle}">Ahmad gabriel</a> :</td></tr><tr><td style="width:160px"><img src="http://dev.yoomken.com/media/img/badges/badge_peindre160_fr_ma.png" alt="Peinture" width="160" height="160" style="border:none;"/></td><td><span style="float:left"><h4 style="overflow-y: hidden;max-height: 15px;"><a style="margin-top: 3px;font-weight: bold;color:{#acolor};text-decoration: none" href="http://dev.yoomken.com/badges/peindre">Badge Peinture</a> <span style="font-weight: normal;font-size: 12px;">(Compétences)</span></h4><p>Les personnes avec ce badge ont démontré une impressionnante efficacité à enduire et peindre les surfaces tel que les murs, plafonds et boiseries.</p></span></td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Kim/relations" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p> </td></tr></table>', 'vous avez reçu un nouveau badge.', 'R', 'RB', 1, 1),
(177, '00', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 15:34:13', '<img src="http://dev.yoomken.com//media/img/badges/badge_flexible160_fr_or.png" switch=""alt="Flexible"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="flexible"/><span>Félicitations ! Vous avez reçu le badge Flexible de <a href="http://dev.yoomken.com/Specialone/wall" target="_blank">Ahmad gabriel</a>.</span>', '<table cellpadding="10" cellspacing="0" style="width: 100%;"><tr><td colspan="2">Félicitations ! Vous avez reçu le badge Flexible de <a href="http://dev.yoomken.com/Specialone/about" target="_blank" style="{#astyle}">Ahmad gabriel</a> :</td></tr><tr><td style="width:160px"><img src="http://dev.yoomken.com/media/img/badges/badge_flexible160_fr_or.png" alt="Flexible" width="160" height="160" style="border:none;"/></td><td><span style="float:left"><h4 style="overflow-y: hidden;max-height: 15px;"><a style="margin-top: 3px;font-weight: bold;color:{#acolor};text-decoration: none" href="http://dev.yoomken.com/badges/flexible">Badge Flexible</a> <span style="font-weight: normal;font-size: 12px;">(Personnalité)</span></h4><p>Les personnes flexibles démontrent une capacité d''adaptation aux circonstances qui peut se traduire par une intervention en dehors de leur horaire habituel ou par la presatation de services exclusifs. Les détenteurs de ce badge ont prouvé qu''on peut compter sur eux pour s''adapter.</p></span></td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Kim/relations" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p> </td></tr></table>', 'vous avez reçu un nouveau badge.', 'R', 'RB', 1, 1),
(178, '00', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 15:34:36', '<img src="http://dev.yoomken.com//media/img/badges/badge_ponctual160_fr_or.png" switch=""alt="Ponctuel"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="ponctual"/><span>Félicitations ! Vous avez reçu le badge Ponctuel de <a href="http://dev.yoomken.com/Specialone/wall" target="_blank">Ahmad gabriel</a>.</span>', '<table cellpadding="10" cellspacing="0" style="width: 100%;"><tr><td colspan="2">Félicitations ! Vous avez reçu le badge Ponctuel de <a href="http://dev.yoomken.com/Specialone/about" target="_blank" style="{#astyle}">Ahmad gabriel</a> :</td></tr><tr><td style="width:160px"><img src="http://dev.yoomken.com/media/img/badges/badge_ponctual160_fr_or.png" alt="Ponctuel" width="160" height="160" style="border:none;"/></td><td><span style="float:left"><h4 style="overflow-y: hidden;max-height: 15px;"><a style="margin-top: 3px;font-weight: bold;color:{#acolor};text-decoration: none" href="http://dev.yoomken.com/badges/ponctual">Badge Ponctuel</a> <span style="font-weight: normal;font-size: 12px;">(Personnalité)</span></h4><p>Etre ponctuel a de nombreuses facettes tel qu''arriver à l''heure, accomplir ses tâches avant la fin des délais... Les personnes qui ont reçu ce badge suivent tous ces qualités.</p></span></td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Kim/relations" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p> </td></tr></table>', 'vous avez reçu un nouveau badge.', 'R', 'RB', 1, 1),
(179, '00', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 15:34:49', '<img src="http://dev.yoomken.com//media/img/badges/badge_amical160_fr_or.png" switch=""alt="Amical"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="amical"/><span>Félicitations ! Vous avez reçu le badge Amical de <a href="http://dev.yoomken.com/Specialone/wall" target="_blank">Ahmad gabriel</a>.</span>', '<table cellpadding="10" cellspacing="0" style="width: 100%;"><tr><td colspan="2">Félicitations ! Vous avez reçu le badge Amical de <a href="http://dev.yoomken.com/Specialone/about" target="_blank" style="{#astyle}">Ahmad gabriel</a> :</td></tr><tr><td style="width:160px"><img src="http://dev.yoomken.com/media/img/badges/badge_amical160_fr_or.png" alt="Amical" width="160" height="160" style="border:none;"/></td><td><span style="float:left"><h4 style="overflow-y: hidden;max-height: 15px;"><a style="margin-top: 3px;font-weight: bold;color:{#acolor};text-decoration: none" href="http://dev.yoomken.com/badges/amical">Badge Amical</a> <span style="font-weight: normal;font-size: 12px;">(Personnalité)</span></h4><p>Les détenteurs de ce badge ont le sens du contact pour se faire des amis et les entretenir. Leurs principales qualités proviennent de leur écoute et leur communication.</p></span></td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Kim/relations" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p> </td></tr></table>', 'vous avez reçu un nouveau badge.', 'R', 'RB', 1, 1),
(180, '00', 'f7a5c01ea63f9176ff7352da1b5dcaa5', '2013-05-30 15:35:24', '<img src="http://dev.yoomken.com//media/img/badges/badge_bricoler160_fr_ma.png" switch=""alt="Bricolage"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="bricoler"/><span>Félicitations ! Vous avez reçu le badge Bricolage de <a href="http://dev.yoomken.com/Specialone/wall" target="_blank">Ahmad gabriel</a>.</span>', '<table cellpadding="10" cellspacing="0" style="width: 100%;"><tr><td colspan="2">Félicitations ! Vous avez reçu le badge Bricolage de <a href="http://dev.yoomken.com/Specialone/about" target="_blank" style="{#astyle}">Ahmad gabriel</a> :</td></tr><tr><td style="width:160px"><img src="http://dev.yoomken.com/media/img/badges/badge_bricoler160_fr_ma.png" alt="Bricolage" width="160" height="160" style="border:none;"/></td><td><span style="float:left"><h4 style="overflow-y: hidden;max-height: 15px;"><a style="margin-top: 3px;font-weight: bold;color:{#acolor};text-decoration: none" href="http://dev.yoomken.com/badges/bricoler">Badge Bricolage</a> <span style="font-weight: normal;font-size: 12px;">(Compétences)</span></h4><p>Les détenteurs de ce badge ont démontré en tant qu''amateur ou professionnel qu''ils étaient remarquables dans les tâches de bricolage liées à la création, l''amélioration, la réparation et l''entretien de toutes choses matérielles.</p></span></td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Ahmadgabrielalkotob/relations" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p> </td></tr></table>', 'vous avez reçu un nouveau badge.', 'N', 'RB', 1, 1),
(181, '00', 'a3cefde48284f70b2098d7015e987148', '2013-05-30 15:35:46', '<img src="http://dev.yoomken.com//media/img/badges/badge_electricity160_fr_ma.png" switch=""alt="Electricité"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="electricity"/><span>Félicitations ! Vous avez reçu le badge Electricité de <a href="http://dev.yoomken.com/Specialone/wall" target="_blank">Ahmad gabriel</a>.</span>', '<table cellpadding="10" cellspacing="0" style="width: 100%;"><tr><td colspan="2">Félicitations ! Vous avez reçu le badge Electricité de <a href="http://dev.yoomken.com/Specialone/about" target="_blank" style="{#astyle}">Ahmad gabriel</a> :</td></tr><tr><td style="width:160px"><img src="http://dev.yoomken.com/media/img/badges/badge_electricity160_fr_ma.png" alt="Electricité" width="160" height="160" style="border:none;"/></td><td><span style="float:left"><h4 style="overflow-y: hidden;max-height: 15px;"><a style="margin-top: 3px;font-weight: bold;color:{#acolor};text-decoration: none" href="http://dev.yoomken.com/badges/electricity">Badge Electricité</a> <span style="font-weight: normal;font-size: 12px;">(Compétences)</span></h4><p>En recevant ce badge, les détenteurs logiquement profesionnels ont démontré qu''elles étaient capable de réaliser efficacement une installation électrique mise aux récentes normes.</p></span></td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Shingo/relations" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p> </td></tr></table>', 'vous avez reçu un nouveau badge.', 'R', 'RB', 1, 0),
(182, '00', '2bd8063bffa0986bfbe7e265cfba8a63', '2013-05-30 15:35:57', '<img src="http://dev.yoomken.com//media/img/badges/badge_couture160_fr_ma.png" switch=""alt="Couture"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="couture"/><span>Congratulations ! You have received the badge Couture from <a href="http://dev.yoomken.com/Specialone/wall" target="_blank">Ahmad gabriel</a>.</span>', '<table cellpadding="10" cellspacing="0" style="width: 100%;"><tr><td colspan="2">Congratulations ! You have received the badge Couture from <a href="http://dev.yoomken.com/Specialone/about" target="_blank" style="{#astyle}">Ahmad gabriel</a> :</td></tr><tr><td style="width:160px"><img src="http://dev.yoomken.com/media/img/badges/badge_couture160_fr_ma.png" alt="Couture" width="160" height="160" style="border:none;"/></td><td><span style="float:left"><h4 style="overflow-y: hidden;max-height: 15px;"><a style="margin-top: 3px;font-weight: bold;color:{#acolor};text-decoration: none" href="http://dev.yoomken.com/badges/couture">Badge Couture</a> <span style="font-weight: normal;font-size: 12px;">(Skills)</span></h4><p>Les détenteurs de ce badge sont reconnus pour posséder un excellent savoir-faire dans la confection, la retouche ou l''ajustement de vêtements que ce soit pour le loisir ou le travail. </p></span></td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Zoubeidapousse02/relations" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Go there now</a></p> </td></tr></table>', 'You have received a new badge', 'N', 'RB', 1, 1),
(183, '00', '48ae9648a43e3633ae647c2583d84116', '2013-05-30 15:36:14', '<img src="http://dev.yoomken.com//media/img/badges/badge_decor160_fr_ma.png" switch=""alt="Décoration"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="decor"/><span>Congratulations ! You have received the badge Décoration from <a href="http://dev.yoomken.com/Specialone/wall" target="_blank">Ahmad gabriel</a>.</span>', '<table cellpadding="10" cellspacing="0" style="width: 100%;"><tr><td colspan="2">Congratulations ! You have received the badge Décoration from <a href="http://dev.yoomken.com/Specialone/about" target="_blank" style="{#astyle}">Ahmad gabriel</a> :</td></tr><tr><td style="width:160px"><img src="http://dev.yoomken.com/media/img/badges/badge_decor160_fr_ma.png" alt="Décoration" width="160" height="160" style="border:none;"/></td><td><span style="float:left"><h4 style="overflow-y: hidden;max-height: 15px;"><a style="margin-top: 3px;font-weight: bold;color:{#acolor};text-decoration: none" href="http://dev.yoomken.com/badges/decor">Badge Décoration</a> <span style="font-weight: normal;font-size: 12px;">(Skills)</span></h4><p>Les détenteurs de ce badge possêdent un excellent talent céative pour embéllir une piéce ou un objet. En recevant ce badge, ils ont satisfait leur entourage en partageant entre autre des bonnes idées de décoration.</p></span></td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Fatenezrann/relations" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Go there now</a></p> </td></tr></table>', 'You have received a new badge', 'N', 'RB', 1, 1);
INSERT INTO `message` (`id_msg`, `id_usr_msg`, `id_grp_msg`, `date_msg`, `content_msg`, `mail_msg`, `subject_msg`, `status_msg`, `type_msg`, `smail_msg`, `active_msg`) VALUES
(184, '00', '2bd8063bffa0986bfbe7e265cfba8a63', '2013-05-30 15:36:48', '<img src="http://dev.yoomken.com//media/img/badges/badge_direct160_fr_or.png" switch=""alt="Direct"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="direct"/><span>Congratulations ! You have received the badge Direct from <a href="http://dev.yoomken.com/Specialone/wall" target="_blank">Ahmad gabriel</a>.</span>', '<table cellpadding="10" cellspacing="0" style="width: 100%;"><tr><td colspan="2">Congratulations ! You have received the badge Direct from <a href="http://dev.yoomken.com/Specialone/about" target="_blank" style="{#astyle}">Ahmad gabriel</a> :</td></tr><tr><td style="width:160px"><img src="http://dev.yoomken.com/media/img/badges/badge_direct160_fr_or.png" alt="Direct" width="160" height="160" style="border:none;"/></td><td><span style="float:left"><h4 style="overflow-y: hidden;max-height: 15px;"><a style="margin-top: 3px;font-weight: bold;color:{#acolor};text-decoration: none" href="http://dev.yoomken.com/badges/direct">Badge Direct</a> <span style="font-weight: normal;font-size: 12px;">(Personnality)</span></h4><p>Les détenteurs de ce badge ont la particularité d''aller droit au but sans chemins détournés en faisant preuve de tact.<br/>"Les personnes directs conservent leur intégrité en étant honnêtes vis à vis des gens", Kobad Ghandy.</p></span></td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Zoubeidapousse02/relations" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Go there now</a></p> </td></tr></table>', 'You have received a new badge', 'N', 'RB', 1, 1),
(185, '00', '178cd2f3df2d88613b46bb6e96a77f3a', '2013-05-30 15:37:08', '<img src="http://dev.yoomken.com//media/img/badges/badge_generous160_en_or.png" switch=""alt="Generous"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="generous"/><span>Congratulations ! You have received the badge Generous from <a href="http://dev.yoomken.com/Specialone/wall" target="_blank">Ahmad gabriel</a>.</span>', '<table cellpadding="10" cellspacing="0" style="width: 100%;"><tr><td colspan="2">Congratulations ! You have received the badge Generous from <a href="http://dev.yoomken.com/Specialone/about" target="_blank" style="{#astyle}">Ahmad gabriel</a> :</td></tr><tr><td style="width:160px"><img src="http://dev.yoomken.com/media/img/badges/badge_generous160_en_or.png" alt="Generous" width="160" height="160" style="border:none;"/></td><td><span style="float:left"><h4 style="overflow-y: hidden;max-height: 15px;"><a style="margin-top: 3px;font-weight: bold;color:{#acolor};text-decoration: none" href="http://dev.yoomken.com/badges/generous">Badge Generous</a> <span style="font-weight: normal;font-size: 12px;">(Personnality)</span></h4><p>Generosity isn''t just about money, it''s also giving his time and attention. People with this badge have these generous qualities that express their greatness of soul.</p></span></td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Sara/relations" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Go there now</a></p> </td></tr></table>', 'You have received a new badge', 'N', 'RB', 1, 1),
(186, '00', '48ae9648a43e3633ae647c2583d84116', '2013-05-30 15:37:21', '<img src="http://dev.yoomken.com//media/img/badges/badge_open160_fr_or.png" switch=""alt="Ouvert d''esprit"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="open"/><span>Congratulations ! You have received the badge Ouvert d''esprit from <a href="http://dev.yoomken.com/Specialone/wall" target="_blank">Ahmad gabriel</a>.</span>', '<table cellpadding="10" cellspacing="0" style="width: 100%;"><tr><td colspan="2">Congratulations ! You have received the badge Ouvert d''esprit from <a href="http://dev.yoomken.com/Specialone/about" target="_blank" style="{#astyle}">Ahmad gabriel</a> :</td></tr><tr><td style="width:160px"><img src="http://dev.yoomken.com/media/img/badges/badge_open160_fr_or.png" alt="Ouvert d''esprit" width="160" height="160" style="border:none;"/></td><td><span style="float:left"><h4 style="overflow-y: hidden;max-height: 15px;"><a style="margin-top: 3px;font-weight: bold;color:{#acolor};text-decoration: none" href="http://dev.yoomken.com/badges/open">Badge Ouvert d''esprit</a> <span style="font-weight: normal;font-size: 12px;">(Personnality)</span></h4><p>L''ouverture d''esprit, c''est accepter de rencontrer des points de vue opposés aux siens et en reconnaitre une certaine valeur. Les détenteurs de ce badge respectent donc clairement les différences des autres.<br/>"L''esprit est comme un parachute: il ne fonctionne que lorsqu''il est ouvert." Edgar Morin.</p></span></td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Fatenezrann/relations" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Go there now</a></p> </td></tr></table>', 'You have received a new badge', 'N', 'RB', 1, 1),
(187, '00', 'a530b55030587b46519449c39181d1b8', '2013-05-30 15:38:14', '<img src="http://dev.yoomken.com//media/img/badges/badge_habile160_fr_or.png" switch=""alt="Habile"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="habile"/><span>Félicitations ! Vous avez reçu le badge Habile de <a href="http://dev.yoomken.com/Specialone/wall" target="_blank">Ahmad gabriel</a>.</span>', '<table cellpadding="10" cellspacing="0" style="width: 100%;"><tr><td colspan="2">Félicitations ! Vous avez reçu le badge Habile de <a href="http://dev.yoomken.com/Specialone/about" target="_blank" style="{#astyle}">Ahmad gabriel</a> :</td></tr><tr><td style="width:160px"><img src="http://dev.yoomken.com/media/img/badges/badge_habile160_fr_or.png" alt="Habile" width="160" height="160" style="border:none;"/></td><td><span style="float:left"><h4 style="overflow-y: hidden;max-height: 15px;"><a style="margin-top: 3px;font-weight: bold;color:{#acolor};text-decoration: none" href="http://dev.yoomken.com/badges/habile">Badge Habile</a> <span style="font-weight: normal;font-size: 12px;">(Personnalité)</span></h4><p> Les détenteurs de ce badge reconnus habiles ont montré qu''ils pratiquaient avec adresse et compétence leur art de leurs mains.</p></span></td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Charlotte/relations" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p> </td></tr></table>', 'vous avez reçu un nouveau badge.', 'R', 'RB', 1, 1),
(188, '00', 'a530b55030587b46519449c39181d1b8', '2013-05-30 15:38:37', '<img src="http://dev.yoomken.com//media/img/badges/badge_generous160_fr_or.png" switch=""alt="Généreux"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="generous"/><span>Félicitations ! Vous avez reçu le badge Généreux de <a href="http://dev.yoomken.com/Specialone/wall" target="_blank">Ahmad gabriel</a>.</span>', '<table cellpadding="10" cellspacing="0" style="width: 100%;"><tr><td colspan="2">Félicitations ! Vous avez reçu le badge Généreux de <a href="http://dev.yoomken.com/Specialone/about" target="_blank" style="{#astyle}">Ahmad gabriel</a> :</td></tr><tr><td style="width:160px"><img src="http://dev.yoomken.com/media/img/badges/badge_generous160_fr_or.png" alt="Généreux" width="160" height="160" style="border:none;"/></td><td><span style="float:left"><h4 style="overflow-y: hidden;max-height: 15px;"><a style="margin-top: 3px;font-weight: bold;color:{#acolor};text-decoration: none" href="http://dev.yoomken.com/badges/generous">Badge Généreux</a> <span style="font-weight: normal;font-size: 12px;">(Personnalité)</span></h4><p>La générosité ne concerne pas que le porte-monnaie, c''est aussi donner de son temps et de l''attention. Les acquéreurs de ce badge disposent de ces qualités généreuses qui expriment leur grandeur d''âme.</p></span></td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Charlotte/relations" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p> </td></tr></table>', 'vous avez reçu un nouveau badge.', 'R', 'RB', 1, 1),
(189, '00', '178cd2f3df2d88613b46bb6e96a77f3a', '2013-05-30 15:39:02', '<img src="http://dev.yoomken.com//media/img/badges/badge_nounou160_en_ma.png" switch=""alt="Baby-sitting"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="nounou"/><span>Congratulations ! You have received the badge Baby-sitting from <a href="http://dev.yoomken.com/Specialone/wall" target="_blank">Ahmad gabriel</a>.</span>', '<table cellpadding="10" cellspacing="0" style="width: 100%;"><tr><td colspan="2">Congratulations ! You have received the badge Baby-sitting from <a href="http://dev.yoomken.com/Specialone/about" target="_blank" style="{#astyle}">Ahmad gabriel</a> :</td></tr><tr><td style="width:160px"><img src="http://dev.yoomken.com/media/img/badges/badge_nounou160_en_ma.png" alt="Baby-sitting" width="160" height="160" style="border:none;"/></td><td><span style="float:left"><h4 style="overflow-y: hidden;max-height: 15px;"><a style="margin-top: 3px;font-weight: bold;color:{#acolor};text-decoration: none" href="http://dev.yoomken.com/badges/nounou">Badge Baby-sitting</a> <span style="font-weight: normal;font-size: 12px;">(Skills)</span></h4><p>People who received this badge have proven they know devoting attention to children and educating them in a playful way.</p></span></td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Sara/relations" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Go there now</a></p> </td></tr></table>', 'You have received a new badge', 'N', 'RB', 1, 1),
(190, '00', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 16:45:47', '{a#Ahmad Gabriel|Specialone#a} a accepté de collaborer avec vous. Vous pouvez dès à présent le contacter.', '', 'kim, vous avez une réponse à votre demande de collaboration.', 'R', 'YD', 1, 1),
(191, '00', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 17:10:53', '<img src="http://dev.yoomken.com//media/img/badges/badge_travaillleur160_fr_or.png" switch=""alt="Travaillleur"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="travaillleur"/><span>Félicitations ! Vous avez reçu le badge Travaillleur de <a href="http://dev.yoomken.com/Charlotte/wall" target="_blank">Charlotte</a>.</span>', '<table cellpadding="10" cellspacing="0" style="width: 100%;"><tr><td colspan="2">Félicitations ! Vous avez reçu le badge Travaillleur de <a href="http://dev.yoomken.com/Charlotte/about" target="_blank" style="{#astyle}">Charlotte</a> :</td></tr><tr><td style="width:160px"><img src="http://dev.yoomken.com/media/img/badges/badge_travaillleur160_fr_or.png" alt="Travaillleur" width="160" height="160" style="border:none;"/></td><td><span style="float:left"><h4 style="overflow-y: hidden;max-height: 15px;"><a style="margin-top: 3px;font-weight: bold;color:{#acolor};text-decoration: none" href="http://dev.yoomken.com/badges/travaillleur">Badge Travaillleur</a> <span style="font-weight: normal;font-size: 12px;">(Personnalité)</span></h4><p>Les personnes qui ont reçu ce badge détiennent une grande conscience professionelle. Ce genre de personnes sont prêt à donner leur tout pour que le résultat de leur travail soit utile ou bénéfique à d''autres.</p></span></td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Kim/relations" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p> </td></tr></table>', 'vous avez reçu un nouveau badge.', 'R', 'RB', 1, 0),
(192, '00', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 17:11:11', '<img src="http://dev.yoomken.com//media/img/badges/badge_dispo160_fr_or.png" switch=""alt="Disponible"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="dispo"/><span>Félicitations ! Vous avez reçu le badge Disponible de <a href="http://dev.yoomken.com/Charlotte/wall" target="_blank">Charlotte</a>.</span>', '<table cellpadding="10" cellspacing="0" style="width: 100%;"><tr><td colspan="2">Félicitations ! Vous avez reçu le badge Disponible de <a href="http://dev.yoomken.com/Charlotte/about" target="_blank" style="{#astyle}">Charlotte</a> :</td></tr><tr><td style="width:160px"><img src="http://dev.yoomken.com/media/img/badges/badge_dispo160_fr_or.png" alt="Disponible" width="160" height="160" style="border:none;"/></td><td><span style="float:left"><h4 style="overflow-y: hidden;max-height: 15px;"><a style="margin-top: 3px;font-weight: bold;color:{#acolor};text-decoration: none" href="http://dev.yoomken.com/badges/dispo">Badge Disponible</a> <span style="font-weight: normal;font-size: 12px;">(Personnalité)</span></h4><p>Les détenteurs de ce badge sont soucieux de se rendre disponible en répondant à toutes les sollicitations. Même lorsqu''ils sont en période d''indisponibilité, ils font l''effort de rappeler. </p></span></td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Kim/relations" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p> </td></tr></table>', 'vous avez reçu un nouveau badge.', 'R', 'RB', 1, 0),
(193, '00', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 17:12:04', '<img src="http://dev.yoomken.com//media/img/badges/badge_bricoler160_fr_ma.png" switch=""alt="Bricolage"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="bricoler"/><span>Félicitations ! Vous avez reçu le badge Bricolage de <a href="http://dev.yoomken.com/Charlotte/wall" target="_blank">Charlotte</a>.</span>', '<table cellpadding="10" cellspacing="0" style="width: 100%;"><tr><td colspan="2">Félicitations ! Vous avez reçu le badge Bricolage de <a href="http://dev.yoomken.com/Charlotte/about" target="_blank" style="{#astyle}">Charlotte</a> :</td></tr><tr><td style="width:160px"><img src="http://dev.yoomken.com/media/img/badges/badge_bricoler160_fr_ma.png" alt="Bricolage" width="160" height="160" style="border:none;"/></td><td><span style="float:left"><h4 style="overflow-y: hidden;max-height: 15px;"><a style="margin-top: 3px;font-weight: bold;color:{#acolor};text-decoration: none" href="http://dev.yoomken.com/badges/bricoler">Badge Bricolage</a> <span style="font-weight: normal;font-size: 12px;">(Compétences)</span></h4><p>Les détenteurs de ce badge ont démontré en tant qu''amateur ou professionnel qu''ils étaient remarquables dans les tâches de bricolage liées à la création, l''amélioration, la réparation et l''entretien de toutes choses matérielles.</p></span></td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Kim/relations" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p> </td></tr></table>', 'vous avez reçu un nouveau badge.', 'R', 'RB', 1, 0),
(194, '00', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 17:13:55', '<img src="http://dev.yoomken.com//media/img/badges/badge_decor160_fr_ma.png" switch=""alt="Décoration"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="decor"/><span>Félicitations ! Vous avez reçu le badge Décoration de <a href="http://dev.yoomken.com/Charlotte/wall" target="_blank">Charlotte</a>.</span>', '<table cellpadding="10" cellspacing="0" style="width: 100%;"><tr><td colspan="2">Félicitations ! Vous avez reçu le badge Décoration de <a href="http://dev.yoomken.com/Charlotte/about" target="_blank" style="{#astyle}">Charlotte</a> :</td></tr><tr><td style="width:160px"><img src="http://dev.yoomken.com/media/img/badges/badge_decor160_fr_ma.png" alt="Décoration" width="160" height="160" style="border:none;"/></td><td><span style="float:left"><h4 style="overflow-y: hidden;max-height: 15px;"><a style="margin-top: 3px;font-weight: bold;color:{#acolor};text-decoration: none" href="http://dev.yoomken.com/badges/decor">Badge Décoration</a> <span style="font-weight: normal;font-size: 12px;">(Compétences)</span></h4><p>Les détenteurs de ce badge possêdent un excellent talent céative pour embéllir une piéce ou un objet. En recevant ce badge, ils ont satisfait leur entourage en partageant entre autre des bonnes idées de décoration.</p></span></td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Kim/relations" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p> </td></tr></table>', 'vous avez reçu un nouveau badge.', 'R', 'RB', 1, 0),
(195, '00', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 17:14:09', '<img src="http://dev.yoomken.com//media/img/badges/badge_amical160_fr_or.png" switch=""alt="Amical"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="amical"/><span>Félicitations ! Vous avez reçu le badge Amical de <a href="http://dev.yoomken.com/Charlotte/wall" target="_blank">Charlotte</a>.</span>', '<table cellpadding="10" cellspacing="0" style="width: 100%;"><tr><td colspan="2">Félicitations ! Vous avez reçu le badge Amical de <a href="http://dev.yoomken.com/Charlotte/about" target="_blank" style="{#astyle}">Charlotte</a> :</td></tr><tr><td style="width:160px"><img src="http://dev.yoomken.com/media/img/badges/badge_amical160_fr_or.png" alt="Amical" width="160" height="160" style="border:none;"/></td><td><span style="float:left"><h4 style="overflow-y: hidden;max-height: 15px;"><a style="margin-top: 3px;font-weight: bold;color:{#acolor};text-decoration: none" href="http://dev.yoomken.com/badges/amical">Badge Amical</a> <span style="font-weight: normal;font-size: 12px;">(Personnalité)</span></h4><p>Les détenteurs de ce badge ont le sens du contact pour se faire des amis et les entretenir. Leurs principales qualités proviennent de leur écoute et leur communication.</p></span></td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Kim/relations" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p> </td></tr></table>', 'vous avez reçu un nouveau badge.', 'R', 'RB', 1, 0),
(196, '00', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 17:15:03', '<img src="http://dev.yoomken.com//media/img/badges/badge_peindre160_fr_ma.png" switch=""alt="Peinture"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="peindre"/><span>Félicitations ! Vous avez reçu le badge Peinture de <a href="http://dev.yoomken.com/Charlotte/wall" target="_blank">Charlotte</a>.</span>', '<table cellpadding="10" cellspacing="0" style="width: 100%;"><tr><td colspan="2">Félicitations ! Vous avez reçu le badge Peinture de <a href="http://dev.yoomken.com/Charlotte/about" target="_blank" style="{#astyle}">Charlotte</a> :</td></tr><tr><td style="width:160px"><img src="http://dev.yoomken.com/media/img/badges/badge_peindre160_fr_ma.png" alt="Peinture" width="160" height="160" style="border:none;"/></td><td><span style="float:left"><h4 style="overflow-y: hidden;max-height: 15px;"><a style="margin-top: 3px;font-weight: bold;color:{#acolor};text-decoration: none" href="http://dev.yoomken.com/badges/peindre">Badge Peinture</a> <span style="font-weight: normal;font-size: 12px;">(Compétences)</span></h4><p>Les personnes avec ce badge ont démontré une impressionnante efficacité à enduire et peindre les surfaces tel que les murs, plafonds et boiseries.</p></span></td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Kim/relations" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p> </td></tr></table>', 'vous avez reçu un nouveau badge.', 'R', 'RB', 1, 0),
(197, '00', 'a530b55030587b46519449c39181d1b8', '2013-05-31 05:16:20', '{a#Ahmad Gabriel|Specialone#a} a commenté votre question. {a#accéder aux commentaires|journal/f8331425f3a89d15c6b5d298b112ceaa#a}.', '<table style="width: 100%" style=""><tr><td colspan="2"><p>{a#Ahmad Gabriel|Specialone#a} a commenté votre question. </p></td></tr><table cellpadding="0" cellspacing="0" style="width:500px"><tr><td valign="top"><table cellpadding="0" cellspacing="0" width="60"><tr><td valign="top" align="left" style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px;color:#535353;line-height:160%"><img src="http://www.gravatar.com/avatar/c11a47a1a8d4154780cadaa798c718f2?s=40&d=identicon&r=g" switch=""alt="Ahmad Gabriel" style="float:left;border-radius: 6px;margin-right:12px"width="40" height="40"class=""title="Ahmad Gabriel"/></td><td valign="top" align="right" style="border-collapse:collapse;font-size:12px;line-height:160%;padding:0"><p style="margin:8px 0;border-style:dashed dashed solid;border-color:#FBFBFB;border-width:10px 10px 10px;height:0;width:0;z-index: 1;border-right-color: #F1F0EE;"></p></td></tr></table></td><td valign="top"><table width="480" cellpadding="10" cellspacing="0" style="background:#F1F0EE;border-bottom:1px solid #dbdbdb;border-radius:5px"><tr><td style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px"><p style="margin:0;">« - Appliquer d\\''abord un enduit de lissage.- Peindre les finitions avec l\\''aide d\\''un ruban adhésif.- Peindre une 1er couche.- Enfin, peindre une 2nd couche. Bon courage ! ...»</p></td></tr></table></td></tr></table><tr><td>&nbsp;</td><td><p><a href="http://dev.yoomken.com/Specialone/messages" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p></td></tr></table>', 'Ahmad Gabriel a commenté votre question', 'R', 'OT', 1, 1),
(198, '00', 'a530b55030587b46519449c39181d1b8', '2013-05-31 05:16:55', '{a#Ahmad Gabriel|Specialone#a} a commenté votre question. {a#accéder aux commentaires|journal/f8331425f3a89d15c6b5d298b112ceaa#a}.', '<table style="width: 100%" style=""><tr><td colspan="2"><p>{a#Ahmad Gabriel|Specialone#a} a commenté votre question. </p></td></tr><table cellpadding="0" cellspacing="0" style="width:500px"><tr><td valign="top"><table cellpadding="0" cellspacing="0" width="60"><tr><td valign="top" align="left" style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px;color:#535353;line-height:160%"><img src="http://www.gravatar.com/avatar/c11a47a1a8d4154780cadaa798c718f2?s=40&d=identicon&r=g" switch=""alt="Ahmad Gabriel" style="float:left;border-radius: 6px;margin-right:12px"width="40" height="40"class=""title="Ahmad Gabriel"/></td><td valign="top" align="right" style="border-collapse:collapse;font-size:12px;line-height:160%;padding:0"><p style="margin:8px 0;border-style:dashed dashed solid;border-color:#FBFBFB;border-width:10px 10px 10px;height:0;width:0;z-index: 1;border-right-color: #F1F0EE;"></p></td></tr></table></td><td valign="top"><table width="480" cellpadding="10" cellspacing="0" style="background:#F1F0EE;border-bottom:1px solid #dbdbdb;border-radius:5px"><tr><td style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px"><p style="margin:0;">« Erewrwererwerw ...»</p></td></tr></table></td></tr></table><tr><td>&nbsp;</td><td><p><a href="http://dev.yoomken.com/Specialone/messages" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p></td></tr></table>', 'Ahmad Gabriel a commenté votre question', 'R', 'OT', 1, 1),
(199, '00', 'a530b55030587b46519449c39181d1b8', '2013-05-31 05:17:37', '{a#Ahmad Gabriel|Specialone#a} a commenté votre question. {a#accéder aux commentaires|journal/f8331425f3a89d15c6b5d298b112ceaa#a}.', '<table style="width: 100%" style=""><tr><td colspan="2"><p>{a#Ahmad Gabriel|Specialone#a} a commenté votre question. </p></td></tr><table cellpadding="0" cellspacing="0" style="width:500px"><tr><td valign="top"><table cellpadding="0" cellspacing="0" width="60"><tr><td valign="top" align="left" style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px;color:#535353;line-height:160%"><img src="http://www.gravatar.com/avatar/c11a47a1a8d4154780cadaa798c718f2?s=40&d=identicon&r=g" switch=""alt="Ahmad Gabriel" style="float:left;border-radius: 6px;margin-right:12px"width="40" height="40"class=""title="Ahmad Gabriel"/></td><td valign="top" align="right" style="border-collapse:collapse;font-size:12px;line-height:160%;padding:0"><p style="margin:8px 0;border-style:dashed dashed solid;border-color:#FBFBFB;border-width:10px 10px 10px;height:0;width:0;z-index: 1;border-right-color: #F1F0EE;"></p></td></tr></table></td><td valign="top"><table width="480" cellpadding="10" cellspacing="0" style="background:#F1F0EE;border-bottom:1px solid #dbdbdb;border-radius:5px"><tr><td style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px"><p style="margin:0;">« Sdfdsfsdfdf ...»</p></td></tr></table></td></tr></table><tr><td>&nbsp;</td><td><p><a href="http://dev.yoomken.com/Specialone/messages" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p></td></tr></table>', 'Ahmad Gabriel a commenté votre question', 'R', 'OT', 1, 1),
(200, '00', 'a530b55030587b46519449c39181d1b8', '2013-05-31 06:09:08', '{a#Ahmad Gabriel|Specialone#a} a commenté votre question. {a#accéder aux commentaires|journal/f8331425f3a89d15c6b5d298b112ceaa#a}.', '<table style="width: 100%" style=""><tr><td colspan="2"><p>{a#Ahmad Gabriel|Specialone#a} a commenté votre question. </p></td></tr><table cellpadding="0" cellspacing="0" style="width:500px"><tr><td valign="top"><table cellpadding="0" cellspacing="0" width="60"><tr><td valign="top" align="left" style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px;color:#535353;line-height:160%"><img src="http://www.gravatar.com/avatar/c11a47a1a8d4154780cadaa798c718f2?s=40&d=identicon&r=g" switch=""alt="Ahmad Gabriel" style="float:left;border-radius: 6px;margin-right:12px"width="40" height="40"class=""title="Ahmad Gabriel"/></td><td valign="top" align="right" style="border-collapse:collapse;font-size:12px;line-height:160%;padding:0"><p style="margin:8px 0;border-style:dashed dashed solid;border-color:#FBFBFB;border-width:10px 10px 10px;height:0;width:0;z-index: 1;border-right-color: #F1F0EE;"></p></td></tr></table></td><td valign="top"><table width="480" cellpadding="10" cellspacing="0" style="background:#F1F0EE;border-bottom:1px solid #dbdbdb;border-radius:5px"><tr><td style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px"><p style="margin:0;">« - dsfsdf- dfd\\''s ...»</p></td></tr></table></td></tr></table><tr><td>&nbsp;</td><td><p><a href="http://dev.yoomken.com/Specialone/messages" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p></td></tr></table>', 'Ahmad Gabriel a commenté votre question', 'R', 'OT', 1, 1),
(201, '00', 'a530b55030587b46519449c39181d1b8', '2013-05-31 06:09:43', '{a#Ahmad Gabriel|Specialone#a} a commenté votre question. {a#accéder aux commentaires|journal/f8331425f3a89d15c6b5d298b112ceaa#a}.', '<table style="width: 100%" style=""><tr><td colspan="2"><p>{a#Ahmad Gabriel|Specialone#a} a commenté votre question. </p></td></tr><table cellpadding="0" cellspacing="0" style="width:500px"><tr><td valign="top"><table cellpadding="0" cellspacing="0" width="60"><tr><td valign="top" align="left" style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px;color:#535353;line-height:160%"><img src="http://www.gravatar.com/avatar/c11a47a1a8d4154780cadaa798c718f2?s=40&d=identicon&r=g" switch=""alt="Ahmad Gabriel" style="float:left;border-radius: 6px;margin-right:12px"width="40" height="40"class=""title="Ahmad Gabriel"/></td><td valign="top" align="right" style="border-collapse:collapse;font-size:12px;line-height:160%;padding:0"><p style="margin:8px 0;border-style:dashed dashed solid;border-color:#FBFBFB;border-width:10px 10px 10px;height:0;width:0;z-index: 1;border-right-color: #F1F0EE;"></p></td></tr></table></td><td valign="top"><table width="480" cellpadding="10" cellspacing="0" style="background:#F1F0EE;border-bottom:1px solid #dbdbdb;border-radius:5px"><tr><td style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px"><p style="margin:0;">« Sasjad adsdg shd ashdga shd asd ashdg sahdg ahsdg ahs dgashdg ahsdg ashdg ahsdg hasdg hsa dghasgd hasgdhasgd ash dsadgahsd sadghdsa dsahdga sasjad adsdg shd ashdga shd asd ashdg sahdg ahsdg ahs dgashdg ahsdg ashdg ahsdg hasdg hsa dghasgd hasgdhasg... ...»</p></td></tr></table></td></tr></table><tr><td>&nbsp;</td><td><p><a href="http://dev.yoomken.com/Specialone/messages" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p></td></tr></table>', 'Ahmad Gabriel a commenté votre question', 'R', 'OT', 1, 1),
(202, '00', 'a530b55030587b46519449c39181d1b8', '2013-05-31 06:12:31', '{a#Ahmad Gabriel|Specialone#a} a commenté votre question. {a#accéder aux commentaires|journal/f8331425f3a89d15c6b5d298b112ceaa#a}.', '<table style="width: 100%" style=""><tr><td colspan="2"><p>{a#Ahmad Gabriel|Specialone#a} a commenté votre question. </p></td></tr><table cellpadding="0" cellspacing="0" style="width:500px"><tr><td valign="top"><table cellpadding="0" cellspacing="0" width="60"><tr><td valign="top" align="left" style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px;color:#535353;line-height:160%"><img src="http://www.gravatar.com/avatar/c11a47a1a8d4154780cadaa798c718f2?s=40&d=identicon&r=g" switch=""alt="Ahmad Gabriel" style="float:left;border-radius: 6px;margin-right:12px"width="40" height="40"class=""title="Ahmad Gabriel"/></td><td valign="top" align="right" style="border-collapse:collapse;font-size:12px;line-height:160%;padding:0"><p style="margin:8px 0;border-style:dashed dashed solid;border-color:#FBFBFB;border-width:10px 10px 10px;height:0;width:0;z-index: 1;border-right-color: #F1F0EE;"></p></td></tr></table></td><td valign="top"><table width="480" cellpadding="10" cellspacing="0" style="background:#F1F0EE;border-bottom:1px solid #dbdbdb;border-radius:5px"><tr><td style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px"><p style="margin:0;">« - Appliquer d\\''abord un enduit de lissage.- Peindre les finitions avec l\\''aide d\\''un ruban adhésif.- Peindre une 1er couche.- Enfin, peindre une 2nd couche. Bon courage ! ...»</p></td></tr></table></td></tr></table><tr><td>&nbsp;</td><td><p><a href="http://dev.yoomken.com/Specialone/messages" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p></td></tr></table>', 'Ahmad Gabriel a commenté votre question', 'R', 'OT', 1, 1),
(203, '00', 'a530b55030587b46519449c39181d1b8', '2013-05-31 06:15:10', '{a#Ahmad Gabriel|Specialone#a} a commenté votre question. {a#accéder aux commentaires|journal/f8331425f3a89d15c6b5d298b112ceaa#a}.', '<table style="width: 100%" style=""><tr><td colspan="2"><p>{a#Ahmad Gabriel|Specialone#a} a commenté votre question. </p></td></tr><table cellpadding="0" cellspacing="0" style="width:500px"><tr><td valign="top"><table cellpadding="0" cellspacing="0" width="60"><tr><td valign="top" align="left" style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px;color:#535353;line-height:160%"><img src="http://www.gravatar.com/avatar/c11a47a1a8d4154780cadaa798c718f2?s=40&d=identicon&r=g" switch=""alt="Ahmad Gabriel" style="float:left;border-radius: 6px;margin-right:12px"width="40" height="40"class=""title="Ahmad Gabriel"/></td><td valign="top" align="right" style="border-collapse:collapse;font-size:12px;line-height:160%;padding:0"><p style="margin:8px 0;border-style:dashed dashed solid;border-color:#FBFBFB;border-width:10px 10px 10px;height:0;width:0;z-index: 1;border-right-color: #F1F0EE;"></p></td></tr></table></td><td valign="top"><table width="480" cellpadding="10" cellspacing="0" style="background:#F1F0EE;border-bottom:1px solid #dbdbdb;border-radius:5px"><tr><td style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px"><p style="margin:0;">« - Appliquer d\\''abord un enduit de lissage.- Peindre les finitions avec l\\''aide d\\''un ruban adhésif.- Peindre une 1er couche.- Enfin, peindre une 2nd couche. Bon courage ! ...»</p></td></tr></table></td></tr></table><tr><td>&nbsp;</td><td><p><a href="http://dev.yoomken.com/Specialone/messages" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p></td></tr></table>', 'Ahmad Gabriel a commenté votre question', 'R', 'OT', 1, 1),
(204, '00', 'a530b55030587b46519449c39181d1b8', '2013-05-31 08:06:05', '{a#Sara|Sara#a} a commenté votre question. {a#accéder aux commentaires|journal/f8331425f3a89d15c6b5d298b112ceaa#a}.', '<table style="width: 100%" style=""><tr><td colspan="2"><p>{a#Sara|Sara#a} a commenté votre question. </p></td></tr><table cellpadding="0" cellspacing="0" style="width:500px"><tr><td valign="top"><table cellpadding="0" cellspacing="0" width="60"><tr><td valign="top" align="left" style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px;color:#535353;line-height:160%"><img src="http://www.gravatar.com/avatar/c4bb454dc818e8a7d6a33019e03ed33e?s=40&d=identicon&r=g" switch=""alt="Sara" style="float:left;border-radius: 6px;margin-right:12px"width="40" height="40"class=""title="Sara"/></td><td valign="top" align="right" style="border-collapse:collapse;font-size:12px;line-height:160%;padding:0"><p style="margin:8px 0;border-style:dashed dashed solid;border-color:#FBFBFB;border-width:10px 10px 10px;height:0;width:0;z-index: 1;border-right-color: #F1F0EE;"></p></td></tr></table></td><td valign="top"><table width="480" cellpadding="10" cellspacing="0" style="background:#F1F0EE;border-bottom:1px solid #dbdbdb;border-radius:5px"><tr><td style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px"><p style="margin:0;">« Vois ça avec @[Kim](contact:Kim) , c\\''est un bon peintre en indépendant prés de chez toi. ...»</p></td></tr></table></td></tr></table><tr><td>&nbsp;</td><td><p><a href="http://dev.yoomken.com/Sara/messages" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p></td></tr></table>', 'Sara a commenté votre question', 'R', 'OT', 1, 1),
(205, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-31 08:06:05', '{a#Sara|Sara#a} a ajouté un commentaire dans une conversation où vous aviez pris part. {a#accéder aux commentaires|journal/f8331425f3a89d15c6b5d298b112ceaa#a}.', '<table style="width: 100%" style=""><tr><td colspan="2"><p>{a#Sara|Sara#a} a ajouté un commentaire dans une conversation où vous aviez pris part. </p></td></tr><table cellpadding="0" cellspacing="0" style="width:500px"><tr><td valign="top"><table cellpadding="0" cellspacing="0" width="60"><tr><td valign="top" align="left" style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px;color:#535353;line-height:160%"><img src="http://www.gravatar.com/avatar/c4bb454dc818e8a7d6a33019e03ed33e?s=40&d=identicon&r=g" switch=""alt="Sara" style="float:left;border-radius: 6px;margin-right:12px"width="40" height="40"class=""title="Sara"/></td><td valign="top" align="right" style="border-collapse:collapse;font-size:12px;line-height:160%;padding:0"><p style="margin:8px 0;border-style:dashed dashed solid;border-color:#FBFBFB;border-width:10px 10px 10px;height:0;width:0;z-index: 1;border-right-color: #F1F0EE;"></p></td></tr></table></td><td valign="top"><table width="480" cellpadding="10" cellspacing="0" style="background:#F1F0EE;border-bottom:1px solid #dbdbdb;border-radius:5px"><tr><td style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px"><p style="margin:0;">« Vois ça avec @[Kim](contact:Kim) , c\\''est un bon peintre en indépendant prés de chez toi. ...»</p></td></tr></table></td></tr></table><tr><td>&nbsp;</td><td><p><a href="http://dev.yoomken.com/Sara/messages" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p></td></tr></table>', 'Sara a ajouté un commentaire dans une conversation où vous aviez pris part', 'N', 'OT', 1, 1),
(206, '00', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-31 08:06:09', ' <a href="/Sara/about" target="_blank" style="{#astyle}">Sara</a> vous a mentionné.&nbsp;<a href="/journal/f8331425f3a89d15c6b5d298b112ceaa" target="_blank" style=''margin: auto;''> Accéder tout de suite  </a>.', '<table cellpadding="10" cellspacing="0" style="width: 100%"><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Sara/about" target="_blank" style="{#astyle}">Sara</a> vous a mentionné.</p></td></tr><tr><td colspan="2"><table cellpadding="0" cellspacing="0" style="width:500px"><tr><td valign="top"><table cellpadding="0" cellspacing="0" width="60"><tr><td valign="top" align="left" style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px;color:#535353;line-height:160%"><img src="http://www.gravatar.com/avatar/c4bb454dc818e8a7d6a33019e03ed33e?s=40&d=identicon&r=g" switch=""alt="Sara" style="float:left;border-radius: 6px;margin-right:12px"width="40" height="40"class=""title="Sara"/></td><td valign="top" align="right" style="border-collapse:collapse;font-size:12px;line-height:160%;padding:0"><p style="margin:8px 0;border-style:dashed dashed solid;border-color:#FBFBFB;border-width:10px 10px 10px;height:0;width:0;z-index: 1;border-right-color: #F1F0EE;"></p></td></tr></table></td><td valign="top"><table width="480" cellpadding="10" cellspacing="0" style="background:#F1F0EE;border-bottom:1px solid #dbdbdb;border-radius:5px"><tr><td style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px"><p style="margin:0;">« vois ça avec @[Kim](contact:Kim) , c''est un bon peintre en indépendant prés de chez toi. ...»</p></td></tr></table></td></tr></table></td></tr><tr><td>&nbsp;</td><td><p><a href="http://dev.yoomken.com/journal/f8331425f3a89d15c6b5d298b112ceaa" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p></td></tr></table>', 'Sara vous a mentionné', 'R', 'OT', 1, 0),
(207, '00', 'a530b55030587b46519449c39181d1b8', '2013-05-31 08:17:49', '{a#Sara|Sara#a} a commenté votre question. {a#accéder aux commentaires|journal/f8331425f3a89d15c6b5d298b112ceaa#a}.', '<table style="width: 100%" style=""><tr><td colspan="2"><p>{a#Sara|Sara#a} a commenté votre question. </p></td></tr><table cellpadding="0" cellspacing="0" style="width:500px"><tr><td valign="top"><table cellpadding="0" cellspacing="0" width="60"><tr><td valign="top" align="left" style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px;color:#535353;line-height:160%"><img src="http://www.gravatar.com/avatar/c4bb454dc818e8a7d6a33019e03ed33e?s=40&d=identicon&r=g" switch=""alt="Sara" style="float:left;border-radius: 6px;margin-right:12px"width="40" height="40"class=""title="Sara"/></td><td valign="top" align="right" style="border-collapse:collapse;font-size:12px;line-height:160%;padding:0"><p style="margin:8px 0;border-style:dashed dashed solid;border-color:#FBFBFB;border-width:10px 10px 10px;height:0;width:0;z-index: 1;border-right-color: #F1F0EE;"></p></td></tr></table></td><td valign="top"><table width="480" cellpadding="10" cellspacing="0" style="background:#F1F0EE;border-bottom:1px solid #dbdbdb;border-radius:5px"><tr><td style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px"><p style="margin:0;">« Tu peux voir ça avec @[Kim](contact:Kim) , c\\''un bon peintre en indépendant prés de chez toi. ...»</p></td></tr></table></td></tr></table><tr><td>&nbsp;</td><td><p><a href="http://dev.yoomken.com/Sara/messages" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p></td></tr></table>', 'Sara a commenté votre question', 'R', 'OT', 1, 1),
(208, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-31 08:17:49', '{a#Sara|Sara#a} a ajouté un commentaire dans une conversation où vous aviez pris part. {a#accéder aux commentaires|journal/f8331425f3a89d15c6b5d298b112ceaa#a}.', '<table style="width: 100%" style=""><tr><td colspan="2"><p>{a#Sara|Sara#a} a ajouté un commentaire dans une conversation où vous aviez pris part. </p></td></tr><table cellpadding="0" cellspacing="0" style="width:500px"><tr><td valign="top"><table cellpadding="0" cellspacing="0" width="60"><tr><td valign="top" align="left" style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px;color:#535353;line-height:160%"><img src="http://www.gravatar.com/avatar/c4bb454dc818e8a7d6a33019e03ed33e?s=40&d=identicon&r=g" switch=""alt="Sara" style="float:left;border-radius: 6px;margin-right:12px"width="40" height="40"class=""title="Sara"/></td><td valign="top" align="right" style="border-collapse:collapse;font-size:12px;line-height:160%;padding:0"><p style="margin:8px 0;border-style:dashed dashed solid;border-color:#FBFBFB;border-width:10px 10px 10px;height:0;width:0;z-index: 1;border-right-color: #F1F0EE;"></p></td></tr></table></td><td valign="top"><table width="480" cellpadding="10" cellspacing="0" style="background:#F1F0EE;border-bottom:1px solid #dbdbdb;border-radius:5px"><tr><td style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px"><p style="margin:0;">« Tu peux voir ça avec @[Kim](contact:Kim) , c\\''un bon peintre en indépendant prés de chez toi. ...»</p></td></tr></table></td></tr></table><tr><td>&nbsp;</td><td><p><a href="http://dev.yoomken.com/Sara/messages" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p></td></tr></table>', 'Sara a ajouté un commentaire dans une conversation où vous aviez pris part', 'N', 'OT', 1, 1),
(209, '00', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-31 08:17:54', ' <a href="/Sara/about" target="_blank" style="{#astyle}">Sara</a> vous a mentionné.&nbsp;<a href="/journal/f8331425f3a89d15c6b5d298b112ceaa" target="_blank" style=''margin: auto;''> Accéder tout de suite  </a>.', '<table cellpadding="10" cellspacing="0" style="width: 100%"><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Sara/about" target="_blank" style="{#astyle}">Sara</a> vous a mentionné.</p></td></tr><tr><td colspan="2"><table cellpadding="0" cellspacing="0" style="width:500px"><tr><td valign="top"><table cellpadding="0" cellspacing="0" width="60"><tr><td valign="top" align="left" style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px;color:#535353;line-height:160%"><img src="http://www.gravatar.com/avatar/c4bb454dc818e8a7d6a33019e03ed33e?s=40&d=identicon&r=g" switch=""alt="Sara" style="float:left;border-radius: 6px;margin-right:12px"width="40" height="40"class=""title="Sara"/></td><td valign="top" align="right" style="border-collapse:collapse;font-size:12px;line-height:160%;padding:0"><p style="margin:8px 0;border-style:dashed dashed solid;border-color:#FBFBFB;border-width:10px 10px 10px;height:0;width:0;z-index: 1;border-right-color: #F1F0EE;"></p></td></tr></table></td><td valign="top"><table width="480" cellpadding="10" cellspacing="0" style="background:#F1F0EE;border-bottom:1px solid #dbdbdb;border-radius:5px"><tr><td style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px"><p style="margin:0;">« Tu peux voir ça avec @[Kim](contact:Kim) , c''un bon peintre en indépendant prés de chez toi. ...»</p></td></tr></table></td></tr></table></td></tr><tr><td>&nbsp;</td><td><p><a href="http://dev.yoomken.com/journal/f8331425f3a89d15c6b5d298b112ceaa" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p></td></tr></table>', 'Sara vous a mentionné', 'R', 'OT', 1, 0);
INSERT INTO `message` (`id_msg`, `id_usr_msg`, `id_grp_msg`, `date_msg`, `content_msg`, `mail_msg`, `subject_msg`, `status_msg`, `type_msg`, `smail_msg`, `active_msg`) VALUES
(210, '00', 'a530b55030587b46519449c39181d1b8', '2013-05-31 08:30:19', '{a#Sara|Sara#a} a commenté votre question. {a#accéder aux commentaires|journal/f8331425f3a89d15c6b5d298b112ceaa#a}.', '<table style="width: 100%" style=""><tr><td colspan="2"><p>{a#Sara|Sara#a} a commenté votre question. </p></td></tr><table cellpadding="0" cellspacing="0" style="width:500px"><tr><td valign="top"><table cellpadding="0" cellspacing="0" width="60"><tr><td valign="top" align="left" style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px;color:#535353;line-height:160%"><img src="http://www.gravatar.com/avatar/c4bb454dc818e8a7d6a33019e03ed33e?s=40&d=identicon&r=g" switch=""alt="Sara" style="float:left;border-radius: 6px;margin-right:12px"width="40" height="40"class=""title="Sara"/></td><td valign="top" align="right" style="border-collapse:collapse;font-size:12px;line-height:160%;padding:0"><p style="margin:8px 0;border-style:dashed dashed solid;border-color:#FBFBFB;border-width:10px 10px 10px;height:0;width:0;z-index: 1;border-right-color: #F1F0EE;"></p></td></tr></table></td><td valign="top"><table width="480" cellpadding="10" cellspacing="0" style="background:#F1F0EE;border-bottom:1px solid #dbdbdb;border-radius:5px"><tr><td style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px"><p style="margin:0;">« Tu peux voir ça avec @[Kim](contact:Kim) , c\\''est un bon peintre en independant prés de chez toi. ...»</p></td></tr></table></td></tr></table><tr><td>&nbsp;</td><td><p><a href="http://dev.yoomken.com/Sara/messages" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p></td></tr></table>', 'Sara a commenté votre question', 'R', 'OT', 1, 1),
(211, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-31 08:30:19', '{a#Sara|Sara#a} a ajouté un commentaire dans une conversation où vous aviez pris part. {a#accéder aux commentaires|journal/f8331425f3a89d15c6b5d298b112ceaa#a}.', '<table style="width: 100%" style=""><tr><td colspan="2"><p>{a#Sara|Sara#a} a ajouté un commentaire dans une conversation où vous aviez pris part. </p></td></tr><table cellpadding="0" cellspacing="0" style="width:500px"><tr><td valign="top"><table cellpadding="0" cellspacing="0" width="60"><tr><td valign="top" align="left" style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px;color:#535353;line-height:160%"><img src="http://www.gravatar.com/avatar/c4bb454dc818e8a7d6a33019e03ed33e?s=40&d=identicon&r=g" switch=""alt="Sara" style="float:left;border-radius: 6px;margin-right:12px"width="40" height="40"class=""title="Sara"/></td><td valign="top" align="right" style="border-collapse:collapse;font-size:12px;line-height:160%;padding:0"><p style="margin:8px 0;border-style:dashed dashed solid;border-color:#FBFBFB;border-width:10px 10px 10px;height:0;width:0;z-index: 1;border-right-color: #F1F0EE;"></p></td></tr></table></td><td valign="top"><table width="480" cellpadding="10" cellspacing="0" style="background:#F1F0EE;border-bottom:1px solid #dbdbdb;border-radius:5px"><tr><td style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px"><p style="margin:0;">« Tu peux voir ça avec @[Kim](contact:Kim) , c\\''est un bon peintre en independant prés de chez toi. ...»</p></td></tr></table></td></tr></table><tr><td>&nbsp;</td><td><p><a href="http://dev.yoomken.com/Sara/messages" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p></td></tr></table>', 'Sara a ajouté un commentaire dans une conversation où vous aviez pris part', 'N', 'OT', 1, 1),
(212, '00', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-31 08:30:24', ' <a href="/Sara/about" target="_blank" style="{#astyle}">Sara</a> vous a mentionné.&nbsp;<a href="/journal/f8331425f3a89d15c6b5d298b112ceaa" target="_blank" style=''margin: auto;''> Accéder tout de suite  </a>.', '<table cellpadding="10" cellspacing="0" style="width: 100%"><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Sara/about" target="_blank" style="{#astyle}">Sara</a> vous a mentionné.</p></td></tr><tr><td colspan="2"><table cellpadding="0" cellspacing="0" style="width:500px"><tr><td valign="top"><table cellpadding="0" cellspacing="0" width="60"><tr><td valign="top" align="left" style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px;color:#535353;line-height:160%"><img src="http://www.gravatar.com/avatar/c4bb454dc818e8a7d6a33019e03ed33e?s=40&d=identicon&r=g" switch=""alt="Sara" style="float:left;border-radius: 6px;margin-right:12px"width="40" height="40"class=""title="Sara"/></td><td valign="top" align="right" style="border-collapse:collapse;font-size:12px;line-height:160%;padding:0"><p style="margin:8px 0;border-style:dashed dashed solid;border-color:#FBFBFB;border-width:10px 10px 10px;height:0;width:0;z-index: 1;border-right-color: #F1F0EE;"></p></td></tr></table></td><td valign="top"><table width="480" cellpadding="10" cellspacing="0" style="background:#F1F0EE;border-bottom:1px solid #dbdbdb;border-radius:5px"><tr><td style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px"><p style="margin:0;">« Tu peux voir ça avec @[Kim](contact:Kim) , c''est un bon peintre en independant prés de chez toi. ...»</p></td></tr></table></td></tr></table></td></tr><tr><td>&nbsp;</td><td><p><a href="http://dev.yoomken.com/journal/f8331425f3a89d15c6b5d298b112ceaa" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p></td></tr></table>', 'Sara vous a mentionné', 'R', 'OT', 1, 1),
(213, '00', 'a530b55030587b46519449c39181d1b8', '2013-05-31 08:33:07', '{a#Sara|Sara#a} a commenté votre question. {a#accéder aux commentaires|journal/f8331425f3a89d15c6b5d298b112ceaa#a}.', '<table style="width: 100%" style=""><tr><td colspan="2"><p>{a#Sara|Sara#a} a commenté votre question. </p></td></tr><table cellpadding="0" cellspacing="0" style="width:500px"><tr><td valign="top"><table cellpadding="0" cellspacing="0" width="60"><tr><td valign="top" align="left" style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px;color:#535353;line-height:160%"><img src="http://www.gravatar.com/avatar/c4bb454dc818e8a7d6a33019e03ed33e?s=40&d=identicon&r=g" switch=""alt="Sara" style="float:left;border-radius: 6px;margin-right:12px"width="40" height="40"class=""title="Sara"/></td><td valign="top" align="right" style="border-collapse:collapse;font-size:12px;line-height:160%;padding:0"><p style="margin:8px 0;border-style:dashed dashed solid;border-color:#FBFBFB;border-width:10px 10px 10px;height:0;width:0;z-index: 1;border-right-color: #F1F0EE;"></p></td></tr></table></td><td valign="top"><table width="480" cellpadding="10" cellspacing="0" style="background:#F1F0EE;border-bottom:1px solid #dbdbdb;border-radius:5px"><tr><td style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px"><p style="margin:0;">« Tu peux voir ça avec @[Kim](contact:Kim) , c\\''est un bon peintre en indépendant prés de chez toi. ...»</p></td></tr></table></td></tr></table><tr><td>&nbsp;</td><td><p><a href="http://dev.yoomken.com/Sara/messages" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p></td></tr></table>', 'Sara a commenté votre question', 'R', 'OT', 1, 1),
(214, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-31 08:33:07', '{a#Sara|Sara#a} a ajouté un commentaire dans une conversation où vous aviez pris part. {a#accéder aux commentaires|journal/f8331425f3a89d15c6b5d298b112ceaa#a}.', '<table style="width: 100%" style=""><tr><td colspan="2"><p>{a#Sara|Sara#a} a ajouté un commentaire dans une conversation où vous aviez pris part. </p></td></tr><table cellpadding="0" cellspacing="0" style="width:500px"><tr><td valign="top"><table cellpadding="0" cellspacing="0" width="60"><tr><td valign="top" align="left" style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px;color:#535353;line-height:160%"><img src="http://www.gravatar.com/avatar/c4bb454dc818e8a7d6a33019e03ed33e?s=40&d=identicon&r=g" switch=""alt="Sara" style="float:left;border-radius: 6px;margin-right:12px"width="40" height="40"class=""title="Sara"/></td><td valign="top" align="right" style="border-collapse:collapse;font-size:12px;line-height:160%;padding:0"><p style="margin:8px 0;border-style:dashed dashed solid;border-color:#FBFBFB;border-width:10px 10px 10px;height:0;width:0;z-index: 1;border-right-color: #F1F0EE;"></p></td></tr></table></td><td valign="top"><table width="480" cellpadding="10" cellspacing="0" style="background:#F1F0EE;border-bottom:1px solid #dbdbdb;border-radius:5px"><tr><td style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px"><p style="margin:0;">« Tu peux voir ça avec @[Kim](contact:Kim) , c\\''est un bon peintre en indépendant prés de chez toi. ...»</p></td></tr></table></td></tr></table><tr><td>&nbsp;</td><td><p><a href="http://dev.yoomken.com/Sara/messages" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p></td></tr></table>', 'Sara a ajouté un commentaire dans une conversation où vous aviez pris part', 'N', 'OT', 1, 1),
(215, '00', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-31 08:33:11', ' <a href="/Sara/about" target="_blank" style="{#astyle}">Sara</a> vous a mentionné.&nbsp;<a href="/journal/f8331425f3a89d15c6b5d298b112ceaa" target="_blank" style=''margin: auto;''> Accéder tout de suite  </a>.', '<table cellpadding="10" cellspacing="0" style="width: 100%"><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Sara/about" target="_blank" style="{#astyle}">Sara</a> vous a mentionné.</p></td></tr><tr><td colspan="2"><table cellpadding="0" cellspacing="0" style="width:500px"><tr><td valign="top"><table cellpadding="0" cellspacing="0" width="60"><tr><td valign="top" align="left" style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px;color:#535353;line-height:160%"><img src="http://www.gravatar.com/avatar/c4bb454dc818e8a7d6a33019e03ed33e?s=40&d=identicon&r=g" switch=""alt="Sara" style="float:left;border-radius: 6px;margin-right:12px"width="40" height="40"class=""title="Sara"/></td><td valign="top" align="right" style="border-collapse:collapse;font-size:12px;line-height:160%;padding:0"><p style="margin:8px 0;border-style:dashed dashed solid;border-color:#FBFBFB;border-width:10px 10px 10px;height:0;width:0;z-index: 1;border-right-color: #F1F0EE;"></p></td></tr></table></td><td valign="top"><table width="480" cellpadding="10" cellspacing="0" style="background:#F1F0EE;border-bottom:1px solid #dbdbdb;border-radius:5px"><tr><td style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px"><p style="margin:0;">« Tu peux voir ça avec @[Kim](contact:Kim) , c''est un bon peintre en indépendant prés de chez toi. ...»</p></td></tr></table></td></tr></table></td></tr><tr><td>&nbsp;</td><td><p><a href="http://dev.yoomken.com/journal/f8331425f3a89d15c6b5d298b112ceaa" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p></td></tr></table>', 'Sara vous a mentionné', 'R', 'OT', 1, 0),
(216, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-31 09:18:10', '<img src="http://dev.yoomken.com//media/img/badges/badge_serviable160_fr_or.png" switch=""alt="Serviable"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="serviable"/><span>Félicitations ! Vous avez reçu le badge Serviable de <a href="http://dev.yoomken.com/Charlotte/wall" target="_blank">Charlotte</a> :<br/><span>« <i>merci pour ton aide</i> »</span></span>', '<table cellpadding="10" cellspacing="0" style="width: 100%;"><tr><td colspan="2">Félicitations ! Vous avez reçu le badge Serviable de <a href="http://dev.yoomken.com/Charlotte/about" target="_blank" style="{#astyle}">Charlotte</a> :</td></tr><tr><td style="width:160px"><img src="http://dev.yoomken.com/media/img/badges/badge_serviable160_fr_or.png" alt="Serviable" width="160" height="160" style="border:none;"/></td><td><span style="float:left"><h4 style="overflow-y: hidden;max-height: 15px;"><a style="margin-top: 3px;font-weight: bold;color:{#acolor};text-decoration: none" href="http://dev.yoomken.com/badges/serviable">Badge Serviable</a> <span style="font-weight: normal;font-size: 12px;">(Personnalité)</span></h4><p>Etre serviable ou rendre service sont des actions fortes que Yoomken défend et encourage dans le réseau. Si une personne rend service à un autre, la personne benéficiaire doit s''attendre à faire de même si l''occasion se présente. Les détenteurs de ce badge sont réactives au besoins des gens et apportent l''effort qu''ils peuvent pour rendre service en espérant qu''un jour le bénéficiare agissent de même pour les autres. <br/>"Il se faut entraider, c''est la loi de nature.", Jean de la Fontaine.</p></span></td></tr><tr><td>&nbsp;</td><td><table cellpadding="0" cellspacing="0" style="width:500px"><tr><td valign="top"><table cellpadding="0" cellspacing="0" width="60"><tr><td valign="top" align="left" style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px;color:#535353;line-height:160%"><img src="http://www.gravatar.com/avatar/eb9dd6cff5f1f4754bedb952e5fb811c?s=40&d=identicon&r=g" switch=""alt="Charlotte" style="float:left;border-radius: 6px;margin-right:12px"width="40" height="40"class=""title="Charlotte"/></td><td valign="top" align="right" style="border-collapse:collapse;font-size:12px;line-height:160%;padding:0"><p style="margin:8px 0;border-style:dashed dashed solid;border-color:#FBFBFB;border-width:10px 10px 10px;height:0;width:0;z-index: 1;border-right-color: #F1F0EE;"></p></td></tr></table></td><td valign="top"><table width="480" cellpadding="10" cellspacing="0" style="background:#F1F0EE;border-bottom:1px solid #dbdbdb;border-radius:5px"><tr><td style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px"><p style="margin:0;">« merci pour ton aide ...»</p></td></tr></table></td></tr></table></td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Specialone/relations" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p> </td></tr></table>', 'vous avez reçu un nouveau badge.', 'N', 'RB', 1, 1),
(217, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-31 09:19:29', '<img src="http://dev.yoomken.com//media/img/badges/badge_peindre160_fr_ma.png" switch=""alt="Peinture"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="peindre"/><span>Félicitations ! Vous avez reçu le badge Peinture de <a href="http://dev.yoomken.com/Charlotte/wall" target="_blank">Charlotte</a> :<br/><span>« <i>et merci d\\''avoir partagé tes connaissances.</i> »</span></span>', '<table cellpadding="10" cellspacing="0" style="width: 100%;"><tr><td colspan="2">Félicitations ! Vous avez reçu le badge Peinture de <a href="http://dev.yoomken.com/Charlotte/about" target="_blank" style="{#astyle}">Charlotte</a> :</td></tr><tr><td style="width:160px"><img src="http://dev.yoomken.com/media/img/badges/badge_peindre160_fr_ma.png" alt="Peinture" width="160" height="160" style="border:none;"/></td><td><span style="float:left"><h4 style="overflow-y: hidden;max-height: 15px;"><a style="margin-top: 3px;font-weight: bold;color:{#acolor};text-decoration: none" href="http://dev.yoomken.com/badges/peindre">Badge Peinture</a> <span style="font-weight: normal;font-size: 12px;">(Compétences)</span></h4><p>Les personnes avec ce badge ont démontré une impressionnante efficacité à enduire et peindre les surfaces tel que les murs, plafonds et boiseries.</p></span></td></tr><tr><td>&nbsp;</td><td><table cellpadding="0" cellspacing="0" style="width:500px"><tr><td valign="top"><table cellpadding="0" cellspacing="0" width="60"><tr><td valign="top" align="left" style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px;color:#535353;line-height:160%"><img src="http://www.gravatar.com/avatar/eb9dd6cff5f1f4754bedb952e5fb811c?s=40&d=identicon&r=g" switch=""alt="Charlotte" style="float:left;border-radius: 6px;margin-right:12px"width="40" height="40"class=""title="Charlotte"/></td><td valign="top" align="right" style="border-collapse:collapse;font-size:12px;line-height:160%;padding:0"><p style="margin:8px 0;border-style:dashed dashed solid;border-color:#FBFBFB;border-width:10px 10px 10px;height:0;width:0;z-index: 1;border-right-color: #F1F0EE;"></p></td></tr></table></td><td valign="top"><table width="480" cellpadding="10" cellspacing="0" style="background:#F1F0EE;border-bottom:1px solid #dbdbdb;border-radius:5px"><tr><td style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px"><p style="margin:0;">« et merci d\\''avoir partagé tes connaissances. ...»</p></td></tr></table></td></tr></table></td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Specialone/relations" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p> </td></tr></table>', 'vous avez reçu un nouveau badge.', 'N', 'RB', 1, 1),
(218, '00', '178cd2f3df2d88613b46bb6e96a77f3a', '2013-05-31 11:03:40', 'Vous êtes maintenant suivi par {a#Charlotte|Charlotte#a}.', '', 'Sara, vous avez un nouveau suiveur sur Yoomken.', 'N', 'FO', 1, 1),
(219, '00', '48ae9648a43e3633ae647c2583d84116', '2013-05-31 11:03:59', 'Your are now traked by {a#Charlotte|Charlotte#a}.', '', 'Fatene, You have a new follower on Yoomken', 'N', 'FO', 1, 1),
(220, '00', '941af2c99f4f7895b481ab9c3261e4ee', '2013-05-31 11:04:35', '<img src="http://dev.yoomken.com//media/img/badges/badge_balenced160_fr_or.png" switch=""alt="équilibré"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="balenced"/><span>Félicitations ! Vous avez reçu le badge équilibré de <a href="http://dev.yoomken.com/Charlotte/wall" target="_blank">Charlotte</a>.</span>', '<table cellpadding="10" cellspacing="0" style="width: 100%;"><tr><td colspan="2">Félicitations ! Vous avez reçu le badge équilibré de <a href="http://dev.yoomken.com/Charlotte/about" target="_blank" style="{#astyle}">Charlotte</a> :</td></tr><tr><td style="width:160px"><img src="http://dev.yoomken.com/media/img/badges/badge_balenced160_fr_or.png" alt="équilibré" width="160" height="160" style="border:none;"/></td><td><span style="float:left"><h4 style="overflow-y: hidden;max-height: 15px;"><a style="margin-top: 3px;font-weight: bold;color:{#acolor};text-decoration: none" href="http://dev.yoomken.com/badges/balenced">Badge équilibré</a> <span style="font-weight: normal;font-size: 12px;">(Personnalité)</span></h4><p>Les détenteurs de ce badge sont en harmonie entre leur charge de travail et leur vie personnelle.</p></span></td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Samy/relations" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p> </td></tr></table>', 'vous avez reçu un nouveau badge.', 'R', 'RB', 1, 1),
(221, '00', '941af2c99f4f7895b481ab9c3261e4ee', '2013-05-31 11:05:01', '<img src="http://dev.yoomken.com//media/img/badges/badge_attachant160_fr_or.png" switch=""alt="Attachant"style="width: 80px;height: 80px;float:left;border:none;margin-right:5px"class=""title="attachant"/><span>Félicitations ! Vous avez reçu le badge Attachant de <a href="http://dev.yoomken.com/Charlotte/wall" target="_blank">Charlotte</a>.</span>', '<table cellpadding="10" cellspacing="0" style="width: 100%;"><tr><td colspan="2">Félicitations ! Vous avez reçu le badge Attachant de <a href="http://dev.yoomken.com/Charlotte/about" target="_blank" style="{#astyle}">Charlotte</a> :</td></tr><tr><td style="width:160px"><img src="http://dev.yoomken.com/media/img/badges/badge_attachant160_fr_or.png" alt="Attachant" width="160" height="160" style="border:none;"/></td><td><span style="float:left"><h4 style="overflow-y: hidden;max-height: 15px;"><a style="margin-top: 3px;font-weight: bold;color:{#acolor};text-decoration: none" href="http://dev.yoomken.com/badges/attachant">Badge Attachant</a> <span style="font-weight: normal;font-size: 12px;">(Personnalité)</span></h4><p>Les personnes attachantes sont trés appréciés par leurs relations. Ce qui implique que les detenteurs de ce badge se placent en position trés favorable pour être supporté ou recevoir de l''aide.</p></span></td></tr><tr><td colspan="2"><p><a href="http://dev.yoomken.com/Samy/relations" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p> </td></tr></table>', 'vous avez reçu un nouveau badge.', 'R', 'RB', 1, 1),
(222, '00', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-31 11:14:29', ' <a href="http://dev.yoomken.com/Charlotte/about" target="_blank">Charlotte</a> souhaiterai collaborer avec vous:<br/>« Je recherche une personne habile qui me prête main forte pour repeindre mes murs. Seriez-vous intéressé ? »<br class="cleared"/><br/>Si vous acceptez la collaboration, il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. Acceptez-vous sa demande de collaboration ? {#accepted}', '<table cellpadding="10" cellspacing="0"><tr><td colspan="2"><a href="http://dev.yoomken.com/Charlotte/about" target="_blank" style="{#astyle}">Charlotte</a> souhaiterai collaborer avec vous</td></tr><tr><td colspan="2"><table cellpadding="0" cellspacing="0" style="width:500px"><tr><td valign="top"><table cellpadding="0" cellspacing="0" width="60"><tr><td valign="top" align="left" style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px;color:#535353;line-height:160%"><img src="http://www.gravatar.com/avatar/eb9dd6cff5f1f4754bedb952e5fb811c?s=40&d=identicon&r=g" switch=""alt="Charlotte" style="float:left;border-radius: 6px;margin-right:12px"width="40" height="40"class=""title="Charlotte"/></td><td valign="top" align="right" style="border-collapse:collapse;font-size:12px;line-height:160%;padding:0"><p style="margin:8px 0;border-style:dashed dashed solid;border-color:#FBFBFB;border-width:10px 10px 10px;height:0;width:0;z-index: 1;border-right-color: #F1F0EE;"></p></td></tr></table></td><td valign="top"><table width="480" cellpadding="10" cellspacing="0" style="background:#F1F0EE;border-bottom:1px solid #dbdbdb;border-radius:5px"><tr><td style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px"><p style="margin:0;">« Je recherche une personne habile qui me prête main forte pour repeindre mes murs. Seriez-vous intéressé ? ...»</p></td></tr></table></td></tr></table></td></tr><tr><td colspan="2"><p>Si vous acceptez la collaboration, il sera possible à cette personne de vous contacter ou de visualiser votre vrai nom pendant toute la durée de votre entente. </p><p><a href="http://dev.yoomken.com/Kim/messages" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p></td></tr></table>', 'Charlotte vous a transmis une invitation pour collaborer sur Yoomken.', 'R', 'OT', 1, 1),
(223, '00', 'a530b55030587b46519449c39181d1b8', '2013-05-31 11:19:22', '{a#Kim|Kim#a} a accepté de collaborer avec vous. Vous pouvez dès à présent le contacter.', '', 'Charlotte, vous avez une réponse à votre demande de collaboration.', 'N', 'YD', 1, 1),
(224, '00', 'a530b55030587b46519449c39181d1b8', '2013-06-02 13:23:49', '{a#Sara|Sara#a} a commenté votre question. {a#accéder aux commentaires|journal/f8331425f3a89d15c6b5d298b112ceaa#a}.', '<table style="width: 100%" style=""><tr><td colspan="2"><p>{a#Sara|Sara#a} a commenté votre question. </p></td></tr><table cellpadding="0" cellspacing="0" style="width:500px"><tr><td valign="top"><table cellpadding="0" cellspacing="0" width="60"><tr><td valign="top" align="left" style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px;color:#535353;line-height:160%"><img src="http://www.gravatar.com/avatar/c4bb454dc818e8a7d6a33019e03ed33e?s=40&d=identicon&r=g" switch=""alt="Sara" style="float:left;border-radius: 6px;margin-right:12px"width="40" height="40"class=""title="Sara"/></td><td valign="top" align="right" style="border-collapse:collapse;font-size:12px;line-height:160%;padding:0"><p style="margin:8px 0;border-style:dashed dashed solid;border-color:#FBFBFB;border-width:10px 10px 10px;height:0;width:0;z-index: 1;border-right-color: #F1F0EE;"></p></td></tr></table></td><td valign="top"><table width="480" cellpadding="10" cellspacing="0" style="background:#F1F0EE;border-bottom:1px solid #dbdbdb;border-radius:5px"><tr><td style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px"><p style="margin:0;">« Djsf sdfsdf dsfs ...»</p></td></tr></table></td></tr></table><tr><td>&nbsp;</td><td><p><a href="http://dev.yoomken.com/Sara/messages" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p></td></tr></table>', 'Sara a commenté votre question', 'N', 'OT', 1, 1),
(225, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-06-02 13:23:49', '{a#Sara|Sara#a} a ajouté un commentaire dans une conversation où vous aviez pris part. {a#accéder aux commentaires|journal/f8331425f3a89d15c6b5d298b112ceaa#a}.', '<table style="width: 100%" style=""><tr><td colspan="2"><p>{a#Sara|Sara#a} a ajouté un commentaire dans une conversation où vous aviez pris part. </p></td></tr><table cellpadding="0" cellspacing="0" style="width:500px"><tr><td valign="top"><table cellpadding="0" cellspacing="0" width="60"><tr><td valign="top" align="left" style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px;color:#535353;line-height:160%"><img src="http://www.gravatar.com/avatar/c4bb454dc818e8a7d6a33019e03ed33e?s=40&d=identicon&r=g" switch=""alt="Sara" style="float:left;border-radius: 6px;margin-right:12px"width="40" height="40"class=""title="Sara"/></td><td valign="top" align="right" style="border-collapse:collapse;font-size:12px;line-height:160%;padding:0"><p style="margin:8px 0;border-style:dashed dashed solid;border-color:#FBFBFB;border-width:10px 10px 10px;height:0;width:0;z-index: 1;border-right-color: #F1F0EE;"></p></td></tr></table></td><td valign="top"><table width="480" cellpadding="10" cellspacing="0" style="background:#F1F0EE;border-bottom:1px solid #dbdbdb;border-radius:5px"><tr><td style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px"><p style="margin:0;">« Djsf sdfsdf dsfs ...»</p></td></tr></table></td></tr></table><tr><td>&nbsp;</td><td><p><a href="http://dev.yoomken.com/Sara/messages" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p></td></tr></table>', 'Sara a ajouté un commentaire dans une conversation où vous aviez pris part', 'N', 'OT', 1, 1),
(226, '00', 'a530b55030587b46519449c39181d1b8', '2013-06-02 13:29:47', '{a#Sara|Sara#a} a commenté votre question. {a#accéder aux commentaires|journal/f8331425f3a89d15c6b5d298b112ceaa#a}.', '<table style="width: 100%" style=""><tr><td colspan="2"><p>{a#Sara|Sara#a} a commenté votre question. </p></td></tr><tr><td colspan="2"><table cellpadding="0" cellspacing="0" style="width:500px"><tr><td valign="top"><table cellpadding="0" cellspacing="0" width="60"><tr><td valign="top" align="left" style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px;color:#535353;line-height:160%"><img src="http://www.gravatar.com/avatar/c4bb454dc818e8a7d6a33019e03ed33e?s=40&d=identicon&r=g" switch=""alt="Sara" style="float:left;border-radius: 6px;margin-right:12px"width="40" height="40"class=""title="Sara"/></td><td valign="top" align="right" style="border-collapse:collapse;font-size:12px;line-height:160%;padding:0"><p style="margin:8px 0;border-style:dashed dashed solid;border-color:#FBFBFB;border-width:10px 10px 10px;height:0;width:0;z-index: 1;border-right-color: #F1F0EE;"></p></td></tr></table></td><td valign="top"><table width="480" cellpadding="10" cellspacing="0" style="background:#F1F0EE;border-bottom:1px solid #dbdbdb;border-radius:5px"><tr><td style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px"><p style="margin:0;">« Qu\\''est ce qui ce passe ???? ...»</p></td></tr></table></td></tr></table></td></tr><tr><td>&nbsp;</td><td><p><a href="http://dev.yoomken.com/Sara/messages" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p></td></tr></table>', 'Sara a commenté votre question', 'N', 'OT', 1, 1),
(227, '00', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-06-02 13:29:47', '{a#Sara|Sara#a} a ajouté un commentaire dans une conversation où vous aviez pris part. {a#accéder aux commentaires|journal/f8331425f3a89d15c6b5d298b112ceaa#a}.', '<table style="width: 100%" style=""><tr><td colspan="2"><p>{a#Sara|Sara#a} a ajouté un commentaire dans une conversation où vous aviez pris part. </p></td></tr><tr><td colspan="2"><table cellpadding="0" cellspacing="0" style="width:500px"><tr><td valign="top"><table cellpadding="0" cellspacing="0" width="60"><tr><td valign="top" align="left" style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px;color:#535353;line-height:160%"><img src="http://www.gravatar.com/avatar/c4bb454dc818e8a7d6a33019e03ed33e?s=40&d=identicon&r=g" switch=""alt="Sara" style="float:left;border-radius: 6px;margin-right:12px"width="40" height="40"class=""title="Sara"/></td><td valign="top" align="right" style="border-collapse:collapse;font-size:12px;line-height:160%;padding:0"><p style="margin:8px 0;border-style:dashed dashed solid;border-color:#FBFBFB;border-width:10px 10px 10px;height:0;width:0;z-index: 1;border-right-color: #F1F0EE;"></p></td></tr></table></td><td valign="top"><table width="480" cellpadding="10" cellspacing="0" style="background:#F1F0EE;border-bottom:1px solid #dbdbdb;border-radius:5px"><tr><td style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px"><p style="margin:0;">« Qu\\''est ce qui ce passe ???? ...»</p></td></tr></table></td></tr></table></td></tr><tr><td>&nbsp;</td><td><p><a href="http://dev.yoomken.com/Sara/messages" target="_blank" style="text-transform: uppercase;background: #FFB53E url(http://dev.yoomken.com/css/images/glass-light.png) repeat-x 0 50%;padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">Accéder tout de suite</a></p></td></tr></table>', 'Sara a ajouté un commentaire dans une conversation où vous aviez pris part', 'N', 'OT', 1, 1),
(228, '00', '871aafc5183b46241b988e1ae13f3501', '2013-11-22 10:52:20', 'Welcome Sélim Pousse,<br>\nTake a few minutes to prepare your best profile that reflects your interests, and you will realize how quickly Yoomken helps you to find your targets.<br>\nEnjoy, it''s totally free :)', '', '', 'N', 'OT', 1, 1),
(229, '00', '871aafc5183b46241b988e1ae13f3501', '2013-11-23 07:28:45', 'Welcome Sélim Pousse,<br>\nTake a few minutes to prepare your best profile that reflects your interests, and you will realize how quickly Yoomken helps you to find your targets.<br>\nEnjoy, it''s totally free :)', '', '', 'N', 'OT', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `network`
--

CREATE TABLE `network` (
  `id_net` varchar(32) NOT NULL,
  `title_net` varchar(100) NOT NULL,
  `shortdesc_net` varchar(100) DEFAULT NULL,
  `id_prt_net` varchar(32) DEFAULT NULL,
  `url_net` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_net`),
  KEY `id_prt_net` (`id_prt_net`),
  KEY `title` (`title_net`),
  KEY `desc` (`shortdesc_net`),
  KEY `url` (`url_net`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `operator`
--

CREATE TABLE `operator` (
  `id_op` int(2) NOT NULL,
  `alias_op` varchar(100) NOT NULL,
  `value_op` varchar(32) NOT NULL,
  `fields_op` varchar(100) NOT NULL,
  `glues_op` varchar(100) NOT NULL,
  PRIMARY KEY (`id_op`),
  KEY `alias_op` (`alias_op`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `operator`
--

INSERT INTO `operator` (`id_op`, `alias_op`, `value_op`, `fields_op`, `glues_op`) VALUES
(1, 'inclus', 'IN', '1', '(-)-"-"-,'),
(2, 'non inclus', 'NOT IN', '1', '(-)-"-"-,'),
(3, 'contenant', 'LIKE', '1', '-- "%-%" - OR'),
(4, 'ne contenant pas', 'NOT LIKE', '1', '-- "%-%" - OR'),
(5, 'dans', 'SOUNDEX', 'country_spt,city_spt', '='),
(6, 'antérieur à', '<', '0', ''),
(7, 'postérieur à', '>', '0', ''),
(8, 'pas dans', 'SOUNDEX', 'country_spt,city_spt', '<>'),
(9, 'dans la ville', 'SOUNDEX', 'city_spt', '(-)-"-"-,'),
(10, 'qui sont', 'IN', '1', '(-)-"-"-,'),
(11, 'qui ne sont pas', 'NOT IN', '1', '(-)-"-"-,'),
(12, 'contenant', 'SOUNDEX', 'titlle_tag', '='),
(13, 'ne contenant pas', 'SOUNDEX', 'title_tag', '<>');

-- --------------------------------------------------------

--
-- Table structure for table `price`
--

CREATE TABLE `price` (
  `amont_pri` float NOT NULL DEFAULT '-1',
  `currency_pri` varchar(3) CHARACTER SET utf8 NOT NULL,
  `frequency_pri` enum('-','D','H') CHARACTER SET utf8 NOT NULL DEFAULT '-',
  `id_usr_pri` varchar(32) CHARACTER SET utf8 NOT NULL,
  `profil_pri` enum('P','C') CHARACTER SET utf8 NOT NULL DEFAULT 'P',
  PRIMARY KEY (`id_usr_pri`,`profil_pri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `price`
--

INSERT INTO `price` (`amont_pri`, `currency_pri`, `frequency_pri`, `id_usr_pri`, `profil_pri`) VALUES
(0, '', '-', '00', 'P'),
(0, '', '', '00', 'C'),
(0, 'EUR', 'H', '0fbef09a987b7a2f6f5aad18a31a5c43', 'P'),
(0, '', '', '0fbef09a987b7a2f6f5aad18a31a5c43', 'C'),
(0, 'EUR', 'H', '5a6097a8f128c86769da4e977927a78d', 'P'),
(0, 'EUR', 'H', '6b2e63b1fd55069fb7cb35fb60f61ed7', 'P'),
(30, 'EUR', 'H', '79b1b9dc1b338006650c78d3b4919b04', 'P'),
(0, '', '-', '79b1b9dc1b338006650c78d3b4919b04', 'C'),
(120, 'EUR', 'H', '7d6653aaa16976e12b6cf7c774f83c1f', 'P'),
(0, '', '-', '7d6653aaa16976e12b6cf7c774f83c1f', 'C'),
(30, 'EUR', 'H', '941af2c99f4f7895b481ab9c3261e4ee', 'P'),
(0, 'EUR', 'H', 'a3cefde48284f70b2098d7015e987148', 'P'),
(0, '', '-', 'a3cefde48284f70b2098d7015e987148', 'C'),
(0, '', '-', 'a530b55030587b46519449c39181d1b8', 'C'),
(0, 'EUR', 'H', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'P'),
(0, 'EUR', 'H', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'C');

-- --------------------------------------------------------

--
-- Table structure for table `provider`
--

CREATE TABLE `provider` (
  `id_prv` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name_prv` varchar(50) DEFAULT NULL,
  `url_prv` varchar(255) DEFAULT NULL,
  `icourl_prv` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_prv`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `provider`
--

INSERT INTO `provider` (`id_prv`, `name_prv`, `url_prv`, `icourl_prv`) VALUES
(1, 'yoomken', 'http://yoomken.li', '/med/img/yoomken.ico'),
(2, 'youtube', 'http://www.youtube.com/', 'http://s.ytimg.com/yt/favicon-vflZlzSbU.ico'),
(3, 'Vimeo', '', ''),
(4, 'College Humor', '', ''),
(5, 'FORA.tv', '', ''),
(6, 'dailymotion', '', ''),
(7, 'Flickr', 'http://www.flickr.com/', 'http://l.yimg.com/g/favicon.ico'),
(8, 'Google', '', ''),
(9, 'Tumblr', '', ''),
(10, 'Twitpic', '', ''),
(11, 'Break.com', '', ''),
(12, 'LiveLeak.com', '', ''),
(13, 'Screencast', '', ''),
(14, 'Imgur', '', ''),
(15, 'TED', '', ''),
(16, 'Ustream.tv', '', ''),
(17, '', '', ''),
(18, 'Zh', 'http://steueramt.zh.ch', 'http://steueramt.zh.ch'),
(19, 'Gstatic', 'http://gstatic.com', 'http://gstatic.com'),
(20, 'Wallpapergate', 'http://wallpapergate.com', 'http://wallpapergate.com'),
(21, 'Posterous', 'http://posterous.com', 'http://posterous.com'),
(22, 'Minitokyo', 'http://minitokyo.net', 'http://minitokyo.net/favicon.ico');

-- --------------------------------------------------------

--
-- Table structure for table `rate`
--

CREATE TABLE `rate` (
  `rate_usr_likusr` varchar(32) NOT NULL,
  `take_usr_likusr` varchar(32) NOT NULL,
  `note_likusr` int(1) NOT NULL,
  `cmt_likusr` varchar(256) DEFAULT NULL,
  `type_likusr` enum('CP','PC') NOT NULL DEFAULT 'CP',
  PRIMARY KEY (`rate_usr_likusr`,`take_usr_likusr`),
  KEY `note_rat` (`note_likusr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `spot`
--

CREATE TABLE `spot` (
  `id_spt` varchar(32) NOT NULL,
  `long_spt` double DEFAULT NULL,
  `lat_spt` double DEFAULT NULL,
  `zip_spt` varchar(45) DEFAULT NULL,
  `city_spt` varchar(45) DEFAULT NULL,
  `country_spt` varchar(45) DEFAULT NULL,
  `state_spt` varchar(45) DEFAULT NULL,
  `street_spt` varchar(45) DEFAULT NULL,
  `no_street_spt` varchar(32) DEFAULT NULL,
  `address_spt` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_spt`),
  KEY `long` (`long_spt`),
  KEY `lat` (`lat_spt`),
  KEY `city` (`city_spt`),
  KEY `country` (`country_spt`),
  KEY `state` (`state_spt`),
  KEY `name` (`address_spt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `spot`
--

INSERT INTO `spot` (`id_spt`, `long_spt`, `lat_spt`, `zip_spt`, `city_spt`, `country_spt`, `state_spt`, `street_spt`, `no_street_spt`, `address_spt`) VALUES
('0006aeb7aa985ae4f0fe34e8e7c27ee0', 0, 0, '', '', '', '', '', NULL, 'je suis ce q'),
('006d2143154327a64d86a264aea225f3', 0, 0, '', '', '', '', '', NULL, 'qw'),
('00c830af5e583fa63a5bc31d88c5aa5f', -0.0131930999999668, 51.4872448, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('016954e5a2aebe61cb4cac13a7a83eb4', 6.62647679999998, 46.5166567, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('016998dad6c68fea05b9df7f6f56fb96', 0, 0, '', '', '', '', '', NULL, 'dds'),
('01b6e20344b68835c5ed1ddedf20d531', 0, 0, '', '', '', '', '', NULL, 'to'),
('01f650aa4924633a6b13ee5c5a2ba2ae', 0, 0, '', '', '', '', '', NULL, 'COIFF'),
('0253c4a012e0d32bc73b0ad2a2832762', 0, 0, '', '', '', '', '', NULL, 'salon'),
('0273fc22ebc60f6598b2c6a876b1294a', 8.5500025, 47.367347, '', 'Zurich', 'Switzerland', 'CH', '', NULL, 'Zurich, Switzerland'),
('0284bb853a649751efbca489e6132b12', 0, 0, '', '', '', '', '', NULL, 'sdfs'),
('02aedb77949edd43e025d3a910cb8834', 0, 0, '', '', '', '', '', NULL, 'zuric'),
('03b101fd0c5c7cc576884420966eb1ab', -0.0131989000000203, 51.4872443, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('03bd16f1fff98aa59ee7a6e59462654e', 2.316374, 48.780454, '', 'Bourg-la-Reine', 'France', 'FR', '', NULL, 'Bourg-la-Reine, France'),
('03c7c0ace395d80182db07ae2c30f034', 0, 0, '', '', '', '', '', NULL, 's'),
('03e6f0dba7369437497b38cb168220fa', 2.30742729999997, 48.780675, '92330', 'Sceaux', 'France', 'FR', 'Rue de la Marne', NULL, '47 Rue de la Marne, 92330 Sceaux, France'),
('047013f1cef1f56fb19baaef74267965', 0, 0, '', '', '', '', '', NULL, 'sdsddsd'),
('04807da3be33d1ef0cac039e8a4664fe', 6.62651919999996, 46.5166474, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('04ea921932254331f5bb5dd4b2181f1e', 6.62643230000003, 46.5166664, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('0528127b43f341bd72d87c7da6f0d613', 6.62644069999999, 46.5166646, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('05b8c74cbd96fbf2de4c1a352702fbf4', 0, 0, '', '', '', '', '', NULL, 'window'),
('06161379527b8df6b18fca5aa984113a', 0, 0, '', '', '', '', '', NULL, 'FAT'),
('066a581676e3e0754ab512457411089c', 6.62647500000003, 46.5166571, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('066cf547b32cee49965dda83acc106c3', 2.35610210000004, 48.8662613, '75003', 'Paris', 'France', 'FR', 'Rue Vaucanson', NULL, '5 Rue Vaucanson, 75003 Paris, France'),
('06f26982d9b01aeb1105cf5d9927f08b', 0, 0, '', '', '', '', '', NULL, 'effretik'),
('07159c47ee1b19ae4fb9c40d480856c4', 0, 0, '', '', '', '', '', NULL, 'ba'),
('07304e56c452be73ad2b51a4647d0300', 0, 0, '', '', '', '', '', NULL, 'dss'),
('07a85d65ca19576b57ad4d1abf5cf4ef', 2.31621369999993, 48.7880591, '92340', 'Bourg-la-Reine', 'France', 'FR', 'Rue du Pré Hilduin', NULL, '11 Rue du Pré Hilduin, 92340 Bourg-la-Reine, France'),
('07e3caf60db39abf58dcf23b8a5098f5', 6.62643849999995, 46.5166651, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('07e8b45b677a375196ad3e53646b74fc', 0, 0, '', '', '', '', '', NULL, 'ldsfsd'),
('07fd7513342b47f24c62049170019f99', -0.0131678999999849, 51.4872469, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('08402bd1c9a177584ae9906c693bd76b', -0.0131794999999784, 51.4871651, 'E14 3QL', 'London', 'United Kingdom', 'GB', 'Westferry Road', NULL, '320 Westferry Road, London, Greater London E14 3QL, UK'),
('0858f228718e633e12e6fda644dad542', 0, 0, '', '', '', '', '', NULL, 'spe'),
('08701e2722b7675c72c0e68bd794a6ef', -0.013315700000021, 51.4873022, 'E14', 'London', 'United Kingdom', 'GB', 'East Ferry Road', NULL, '224 East Ferry Road, London Borough of Tower Hamlets, E14, UK'),
('088f66d695c5014bc5f419139989d4b5', 0, 0, '', '', '', '', '', NULL, 'lond'),
('08c7b0daa33b1e5e86a230c1801254c9', 0, 0, '', '', '', '', '', NULL, 'ri'),
('098f6bcd4621d373cade4e832627b4f6', 0, 0, '', '', '', '', '', NULL, 'test'),
('0a9e8990105f6864f6a5abb5edeb71f9', 2.35611300000005, 48.8662785, '75003', 'Paris', 'France', 'FR', 'Rue Vaucanson', NULL, '5 Rue Vaucanson, 75003 Paris, France'),
('0ab3e5d0801aea3f3758bcbd812e8f10', 0, 0, '', '', '', '', '', NULL, 'nr'),
('0b080119cbf1138edfa9132471e1a661', 0, 0, '', '', '', '', '', NULL, 'tot'),
('0b08bd98d279b88859b628cd8c061ae0', 0, 0, '', '', '', '', '', NULL, 'win'),
('0b180078d994cb2b5ed89d7ce8e7eea2', 0, 0, '', '', '', '', '', NULL, 'su'),
('0b2fa0ef1d0709a76dda139b1dabe345', 6.62645620000001, 46.5166612, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('0b41f68dd88ac7b1f63153a44645fb62', 2.30739349999999, 48.7806816, '92330', 'Sceaux', 'France', 'FR', 'Rue de la Marne', NULL, '47 Rue de la Marne, 92330 Sceaux, France'),
('0b76e769bcf423bfdac5af33ac3f1833', 0, 0, '', '', '', '', '', NULL, 'doio'),
('0bd6506986ec42e732ffb866d33bb14e', 0, 0, '', '', '', '', '', NULL, 'special'),
('0bdb6d2234963ad7145fb7ed351a9d4e', -88.75, 14.816667, '', '', 'Honduras', 'HN', '', NULL, 'Santa Rosa de Copan (SDH), Port lotniczy Sant'),
('0be3fc3a7f1db1df3b07b5a0e715d868', 0, 0, '', '', '', '', '', NULL, 'speciai'),
('0c58a5169d04348a8f29e8e769f44be0', 0, 0, '', '', '', '', '', NULL, 'new te'),
('0cc175b9c0f1b6a831c399e269772661', 0, 0, '', '', '', '', '', NULL, 'a'),
('0cce969af939c8cbbfdba6045124bf2c', 0, 0, '', '', '', '', '', NULL, 'coiffur'),
('0d2336ffbf21bd28ec755d112ebeab5e', 0, 0, '', '', '', '', '', NULL, 'londo'),
('0d742649430a60d939eec78e294477c0', 0, 0, '', '', '', '', '', NULL, 'pusse'),
('0d9e3e2c0ef2621797a556bf7540fec5', -74.2099245, 40.8176485, '07042', 'Montclair', 'États-Unis', 'US', 'Label St', NULL, 'Label St, Montclair, New Jersey 07042, États-'),
('0e4064013c30626823100e2194f70548', 0, 0, '', '', '', '', '', NULL, 'ahmad g'),
('0e44719f50d0d0d47fa5b04fef709672', 6.62644899999998, 46.5166628, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('0ec53c34ceb021b4c7907d31db2ff752', 0, 0, '', '', '', '', '', NULL, 'asdd'),
('0f035e262e624496a403a85951e84b23', 0, 0, '', '', '', '', '', NULL, 'lkdsf'),
('0f09102422992cc5b43fcf4485401f69', 0, 0, '', '', '', '', '', NULL, 'virtual job'),
('0f70f96dac9a1ff2006c91c97eea2eaa', 0, 0, '', '', '', '', '', NULL, 'ahmad gabr'),
('0fb2f8e6a640560a8b43c4f75bf5a7d0', 6.62649160000001, 46.5166534, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('0fe08fa5b5c17940c6d206036b2f8740', 8.6950008, 47.4276585, '8307', 'Illnau-Effretikon', 'Suisse', 'CH', 'Müslistrasse', NULL, 'Müslistrasse, 8307 Illnau-Effretikon, Suisse'),
('10036819523f63cbdfce70d108575538', 6.68285739999999, 46.5607718, '1000', 'Lausanne', 'Suisse', 'CH', 'Route de Cojonnex', NULL, 'Route de Cojonnex 18, 1000 Lausanne, Suisse'),
('103211ea2c12ba25e4c195a0b7eb687b', 0.955565999999976, 46.2153149, '87320', 'Darnac', 'France', 'FR', 'Ville', NULL, 'Ville, 87320 Darnac, France'),
('11068ebdce986aa71f6e01012910ef57', -0.0132869000000255, 51.4870879, 'E14', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '8 Ferry Street, London Borough of Tower Hamlets, E14, UK'),
('11432615ffed7560895a46f0fcbb3abe', 0, 0, '', '', '', '', '', NULL, 'gfdgfdgfdgfdgf'),
('121eb265a15ed56d3b7d4ab685def908', 6.6264377, 46.5166652, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('12470fe406d44017d96eab37dd65fc14', 0, 0, '', '', '', '', '', NULL, 'es'),
('124fbb0ae64dc110c8b032b72dd2b54c', -0.0131834000000026, 51.4872456, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('12e6bb9ed4a27b440b78d8386f75f1fc', 6.62650929999995, 46.5166496, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('133146df0abe2a2404b7f6044d5fba4b', 6.62670939999998, 46.5166594, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 34, 1006 Lausanne, Schweiz'),
('1361a39dc4efe484b663471caeab331e', -0.0132866999999806, 51.487087, 'E14', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '8 Ferry Street, London Borough of Tower Hamlets, E14, UK'),
('13b5bfe96f3e2fe411c9f66f4a582adf', 0, 0, '', '', '', '', '', NULL, 'in'),
('14083cf69ecad60e1e2cb90f64dcd56d', -0.0752291000000014, 51.5985508, '', 'Tottenham', 'Royaume-Uni', 'GB', '', NULL, 'Tottenham, Londres, Royaume-Uni'),
('14221d307885b72f073d7ba8da51d19e', -0.0131754000000228, 51.4872463, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('144178c22b31a844a1f4f97ed97919ba', 0, 0, '', '', '', '', '', NULL, 'shin'),
('14508d0c8354e4ae2f832425604ab850', 0, 0, '', '', '', '', '', NULL, 'zuri'),
('14a0d838724f8a1924ece7d700562597', 0, 0, '', '', '', '', '', NULL, 'bejour'),
('14bded967a1d42c74c8c4dd2b0e77cc1', 0, 0, '', '', '', '', '', NULL, 'salut les'),
('14d946e3ab69c9ec3eda5b5b8ada09da', -0.0132131999999956, 51.4872431, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('1525c1dd8775a25af387589d7a2c7fa2', 0, 0, '', '', '', '', '', NULL, 'suo'),
('162238ae364d2ce4784982e5d78ffffd', -0.12574, 51.5085, '-', 'London', 'United kingdom', 'GB', '', NULL, ''),
('17d3af842567b8d93bc4262a44dc7d28', 7.07679840000003, 46.1012955, '1920', 'Martigny', 'Suisse', 'CH', 'Rue du Grand-Verger', NULL, 'Rue du Grand-Verger 5, 1920 Martigny, Suisse'),
('1806ee6bfe472b74041f3338d79ea1fe', 6.62645599999996, 46.5166612, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('1863b38fd5b38cea924b198825aec393', -0.0132355000000643, 51.4872421, 'E14', 'London', 'United Kingdom', 'GB', 'Manchester Road', NULL, '3 Manchester Road, London Borough of Tower Hamlets, E14, UK'),
('18670245849a7ba01669bdac40144a82', 0, 0, '', '', '', '', '', NULL, 'zu'),
('188e0877732ac5e4690c3d908cf667dd', 0, 0, '', '', '', '', '', NULL, 'new c'),
('18b049cc8d8535787929df716f9f4e68', 0, 0, '', '', '', '', '', NULL, 'an'),
('18d1a709d170e55f7f9520f95fd2e871', 8.69589029999997, 47.4276268, '8307', 'Illnau-Effretikon', 'Suisse', 'CH', 'Quellenstrasse', NULL, 'Quellenstrasse 6, 8307 Illnau-Effretikon, Suisse'),
('18f893ffd459cf01e1ca934c360ed7cd', 0, 0, '', '', '', '', '', NULL, 'shingo'),
('1952a01898073d1e561b9b4f2e42cbd7', 0, 0, '', '', '', '', '', NULL, 'sp'),
('19a0d289501a678eac0e4fa84fdd9713', 0, 0, '', '', '', '', '', NULL, 'FATENE'),
('19f1f8279e0d3207554ec204abd045ba', 6.62646910000001, 46.5166584, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('1aabac6d068eef6a7bad3fdf50a05cc8', 0, 0, '', '', '', '', '', NULL, 'dd'),
('1acabdfb590965053f7666560cf36e30', 0, 0, '', '', '', '', '', NULL, 'spei'),
('1ae6cbe6914e8266423507365a321a0f', 0, 0, '', '', '', '', '', NULL, 'bonjour tu vas bie'),
('1afe98baacb59ad41ec120c76a5a2081', 6.62649069999998, 46.5166536, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('1b08b7c975e6cd24270ff560dcda91e3', -0.0131948000000648, 51.4872446, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('1b2204a67155b9b7a03b10eda941ac9a', 6.62646319999999, 46.5166597, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('1b398c20838f207e32534940c8f4f52a', -0.013312600000063, 51.4871506, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Ferry St', NULL, '19 Ferry St, Poplar, Londres E14 3, Royaume-U'),
('1b84d5495e52f8237c993176a3835394', 2.30743140000004, 48.7806742, '92330', 'Sceaux', 'France', 'FR', 'Rue de la Marne', NULL, '47 Rue de la Marne, 92330 Sceaux, France'),
('1c52bdae8bad70e82da799843bb4e831', 0, 0, '', '', '', '', '', NULL, 'est'),
('1c74722a302e2121e61e87913df3ba9b', 0, 0, '', '', '', '', '', NULL, 'specia'),
('1cc0cb07e4582c76ecffed6aa97f22ec', 0, 0, '', '', '', '', '', NULL, 'sé'),
('1ce81ddc23283076762f440bfcc36d37', 0, 0, '', '', '', '', '', NULL, 'Ma'),
('1d4916d175a57129cf475940bbfc2f94', 6.62645220000002, 46.5166621, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('1d6994ff6c19041f4fb937436f9ea7ef', 2.30743789999997, 48.780673, '92330', 'Sceaux', 'France', 'FR', 'Rue de la Marne', NULL, '47 Rue de la Marne, 92330 Sceaux, France'),
('1d78dc8ed51214e518b5114fe24490ae', 0, 0, '', '', '', '', '', NULL, 'map'),
('1daf7f36da494326b73301828b1df7ca', 0, 0, '', '', '', '', '', NULL, 'zoubie'),
('1de36db348b4adac31045736ba861480', -0.0133089999999356, 51.4871367, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Ferry St', NULL, '19-25 Ferry St, Poplar, Londres E14 3, Royaum'),
('1e1d4a6e7788cf1878b769594f9e21ac', 6.62644929999999, 46.5166627, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('1e524db13f67583e06d01156816f9852', 7.07704349999995, 46.1013773, '1920', 'Martigny', 'Suisse', 'CH', 'Rue du Grand-Verger', NULL, 'Rue du Grand-Verger 3, 1920 Martigny, Suisse'),
('1e52de644cce0e70ed2f6b9e8d956e8f', 7.44460849999996, 46.9479222, '', 'Bern', 'Schweiz', 'CH', '', NULL, 'Bern, Schweiz'),
('1e9fed367dadc83feb2371ae5a8cc40b', -0.0132877999999437, 51.4870917, 'E14', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '8 Ferry Street, London Borough of Tower Hamlets, E14, UK'),
('1f98b70d78de2513e3be8cf742f3b300', 2.30743010000003, 48.7806745, '92330', 'Sceaux', 'France', 'FR', 'Rue de la Marne', NULL, '47 Rue de la Marne, 92330 Sceaux, France'),
('2029dcc3ba06fa6fc79d9d847a9a1366', 0, 0, '', '', '', '', '', NULL, 'coiffure'),
('203fa78a6ae936dd5936e6251de5b9ea', 8.69556309999996, 47.4278013, '8307', 'Illnau-Effretikon', 'Switzerland', 'CH', 'Quellenstrasse', NULL, 'Quellenstrasse 2, 8307 Illnau-Effretikon, Switzerland'),
('20838a8df7cc0babd745c7af4b7d94e2', 0, 0, '', '', '', '', '', NULL, 'sdfdsf'),
('20ddf02b9bba01f993d7716ebd1b5ae2', 0, 0, '', '', '', '', '', NULL, 'virtuals j'),
('215b066b2bcb78c7edbc932d21ee0ebd', 0, 0, '', '', '', '', '', NULL, 'SELI'),
('2169af74730781404edadba7e2376bc4', -0.013195499999938, 51.4872446, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('21be010a7ee8be0e0d7fbe6a667ab396', -0.0132274000000052, 51.4872429, 'E14', 'London', 'United Kingdom', 'GB', 'Manchester Road', NULL, '3 Manchester Road, London Borough of Tower Hamlets, E14, UK'),
('21c06dfed2c54a425cd0e117714e8ab9', 38.7683024, 61.2948651, '', '', 'Russian Federation', 'RU', '', NULL, 'Lake Lacha, Arkhangelsk Oblast, Russia'),
('224c1d83438e111fca1cba9455e4b299', -0.013312199999973, 51.4871489, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Ferry St', NULL, '19 Ferry St, Poplar, Londres E14 3, Royaume-U'),
('22562fe034897b29353c2c4328d93612', -0.013167199999998, 51.4872469, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('225f818393fd2db03dc44d779ba198a4', 6.62645780000003, 46.5166608, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('22af645d1859cb5ca6da0c484f1f37ea', 0, 0, '', '', '', '', '', NULL, 'new'),
('22c953e292d0b115f613cad2db980dc7', 0, 0, '', '', '', '', '', NULL, 'new t'),
('22f75d966798ae7995aae100bcf80142', 0, 0, '', '', '', '', '', NULL, 'qwqwq'),
('230c06bb802da8b08228f757b74f8dbb', 2.30255299999999, 48.759255, '', 'Antony', 'France', 'FR', '', NULL, 'Antony, France'),
('233172bc6e0266bebc235ebd8bf6e39b', 0, 0, '', '', '', '', '', NULL, 'sous'),
('23d41704b5f09e389b15da4cf4540335', -0.0889469999999619, 51.51333, '', 'Londres', 'Royaume-Uni', 'GB', '', NULL, 'City of London, Cité de Londres, Royaume-Uni'),
('23e452613c6052c925d64c2b3f5906c9', 6.62649080000006, 46.5166536, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('2440c4edd452d6f687bbf3ec866e7986', -0.0132185999999592, 51.4872427, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('24eaaa52ecc9d051e92a9795a172b60c', 0, 0, '', '', '', '', '', NULL, 'béjour'),
('2510c39011c5be704182423e3a695e91', 0, 0, '', '', '', '', '', NULL, 'h'),
('2567a5ec9705eb7ac2c984033e06189d', 0, 0, '', '', '', '', '', NULL, 'web'),
('256939a205073f625482af3c39af9c75', 14.7238934, 67.5950028, '', '', 'Norvège', 'NO', '', NULL, 'Hella, Bodø, Norvège'),
('25b1902406e1629d19f07bba8b2f0cf0', 0, 0, '', '', '', '', '', NULL, 'salo'),
('264d508ef8cd0b1834465f532210f1a9', 10.6333333, 35.8333333, '', 'Sousse', 'Tunisie', 'TN', '', NULL, 'Sousse, Tunisie'),
('269bdc1fb1aadcc5b575a68220158602', 0, 0, '', '', '', '', '', NULL, 'SAR'),
('26ac252347d1d60a68902b0d5d8e8767', -0.0132836000000225, 51.4870737, 'E14', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '8 Ferry Street, London Borough of Tower Hamlets, E14, UK'),
('26c322652770620e64ac90682eb6504c', 0, 0, '', '', '', '', '', NULL, 'chan'),
('27369b3bf4483e8dcfd85ba9a39a947f', 0, 0, '', '', '', '', '', NULL, 'hot'),
('27c9d5187cd283f8d160ec1ed2b5ac89', 0, 0, '', '', '', '', '', NULL, 'mo'),
('287000ed12689b49a1962f4cb3e2ba3a', 0, 0, '', '', '', '', '', NULL, 'gfdgfdgf'),
('288563599778a46193872ab022a9ce0f', 0, 0, '', '', '', '', '', NULL, 'zoub'),
('28b662d883b6d76fd96e4ddc5e9ba780', 0, 0, '', '', '', '', '', NULL, 'tes'),
('29900a0589e792a7432aeee7cbb12cf3', 0, 0, '', '', '', '', '', NULL, 'wke'),
('2a75b0b5a65f200ab7913266030cd883', 0, 0, '', '', '', '', '', NULL, 'je suis ce qu'),
('2ad88e99886c3ff0058963a99fe78f70', -0.0133045000000038, 51.4871819, 'E14', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '8 Ferry Street, London Borough of Tower Hamlets, E14, UK'),
('2b072fabdd9d400e0d8314bec68b5c36', 6.62646589999997, 46.5166591, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('2b29c5739ec4158573c66d2124e2c7e9', 0, 0, '', '', '', '', '', NULL, 'Zurich'),
('2bdb9ae2b7ae9e5de1606c956e29f565', 0, 0, '', '', '', '', '', NULL, 'gadde'),
('2be4385f2b6c492a95f8ad1c71a19ff2', 0, 0, '', '', '', '', '', NULL, 'speciaiaon'),
('2bfc6ac1a89f13755c9a1b13828a4d10', -0.0131870000000163, 51.4872453, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('2c204d849495890a8fad6b44ee78ac73', 0, 0, '', '', '', '', '', NULL, 'wq'),
('2c61ebff5a7f675451467527df66788d', 0, 0, '', '', '', '', '', NULL, 'can'),
('2c789e34dc81d79feba6a005ad63902b', 0, 0, '', '', '', '', '', NULL, 'adsd'),
('2ccb76c7204ab46a922b3d5204831670', -0.013317700000016, 51.4870602, 'E14', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '6-12 Ferry Street, London Borough of Tower Hamlets, E14, UK'),
('2d1985bdf9a36a3da454b536a285d425', 0, 0, '', '', '', '', '', NULL, 'effretikon'),
('2db95e8e1a9267b7a1188556b2013b33', 0, 0, '', '', '', '', '', NULL, 'l'),
('2deb000b57bfac9d72c14d4ed967b572', 0, 0, '', '', '', '', '', NULL, 'ads'),
('2e49e6fd9611174c4065dc85c63da840', 0, 0, '', '', '', '', '', NULL, 'ahmas'),
('2e8bb9e1796f41fb149d11dc7bda3f6b', 0, 0, '', '', '', '', '', NULL, 'ville'),
('2f126e22938ba4e1c9a02e098f228ffe', -0.0131599999999708, 51.4872379, 'E14', 'London', 'United Kingdom', 'GB', 'Manchester Rd', NULL, '3 Manchester Rd, London Borough of Tower Hamlets, E14, UK'),
('2f6bad4277963ef8ee96e17ffefa848d', 2.35606830000006, 48.8662082, '75003', 'Paris', 'France', 'FR', 'Rue Vaucanson', NULL, '5 Rue Vaucanson, 75003 Paris, France'),
('2fa5d155fb6d2fdefffd2f8599bb813c', 6.62644290000003, 46.5166641, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('2feb99a62465778331a62e20b2dd291a', 6.62643530000003, 46.5166658, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('2ff603c183a026bf9b67b1033c52ae2b', 0, 0, '', '', '', '', '', NULL, 'zo'),
('300fd72d94299cf3b208e3f7b8973f7d', 0, 0, '', '', '', '', '', NULL, 'infor'),
('3042e8673fc9f1ef009630f89ca88e76', 0, 0, '', '', '', '', '', NULL, 'gfdgfdgfdgfd'),
('30471e1babfe84b68b3d611bdc586ae9', 6.62652320000007, 46.5166465, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('3047761d49b4375d222ca8cd69c59ac5', 0, 0, '', '', '', '', '', NULL, 'je suis ce'),
('30e60493175d5a7d7528c03241ed3b1c', 0, 0, '', '', '', '', '', NULL, 'zran'),
('31627c2faec6705f48d68ad1f25120a6', 0, 0, '', '', '', '', '', NULL, 'dksfdsk'),
('316b4feafca0a5704f13b97d6778464b', 0, 0, '', '', '', '', '', NULL, 'gadd'),
('31b461f5a5623f8f03646fd429cbe789', -90.5241256, 43.718909, '54651', '', 'United States', 'US', '', NULL, 'Z'),
('31c2a1f7b24da67975a6ed4581549be3', 2.3073703, 48.7806861, '92330', 'Sceaux', 'France', 'FR', 'Rue de la Marne', NULL, '47 Rue de la Marne, 92330 Sceaux, France'),
('31c2e81e9b09a0543c61af1a7123f6f7', 0, 0, '', '', '', '', '', NULL, 'COIF'),
('321078d0172883a731143184d50e38ed', -0.0132869999999912, 51.4870885, 'E14', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '8 Ferry Street, London Borough of Tower Hamlets, E14, UK'),
('323bccdddd22bdfd02f63721c8233f42', 2.30743689999997, 48.7806732, '92330', 'Sceaux', 'France', 'FR', 'Rue de la Marne', NULL, '47 Rue de la Marne, 92330 Sceaux, France'),
('3262d48df5d75e3452f0f16b313b7808', 0, 0, '', '', '', '', '', NULL, 'off'),
('3288f00666283d5928aeafaca8367f55', -0.0131469000000379, 51.4873188, 'E14 3BD', 'London', 'United Kingdom', 'GB', 'Manchester Road', NULL, '1 Manchester Road, London Borough of Tower Hamlets, London E14 3BD, UK'),
('328d6fde080b9845fb7fa3a612bea12f', 0, 0, '', '', '', '', '', NULL, 'gfdgfd'),
('32d7508fe69220cb40af28441ef746d9', 0, 0, '', '', '', '', '', NULL, 'ga'),
('33097f12513de2fe96922a4b3bcd26db', 0, 0, '', '', '', '', '', NULL, 'haki'),
('33e78d60bc1f9dcc7291c891e6f069e4', 0, 0, '', '', '', '', '', NULL, 'dsfsdf'),
('33f1b9ae82bf9e93bd6891b32fc56725', 6.62647659999993, 46.5166567, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('34b7ff742e2db662a42340e6d6029957', 0, 0, '', '', '', '', '', NULL, 'béjou'),
('34d1f91fb2e514b8576fab1a75a89a6b', 0, 0, '', '', '', '', '', NULL, 'go'),
('35b36b28916d38b34abddf832e286126', 0, 0, '', '', '', '', '', NULL, 'vi'),
('35ea51baf1fe7f0142ad5f950855dde0', 0, 0, '', '', '', '', '', NULL, 'ci'),
('3605c251087b88216c9bca890e07ad9c', 0, 0, '', '', '', '', '', NULL, 'ro'),
('360c4a579fd074694fc7b94dce9066a5', -0.013163899999995, 51.4872472, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('3691308f2a4c2f6983f2880d32e29c84', 0, 0, '', '', '', '', '', NULL, 'ss'),
('36be83453fe3a007320f37f5b9237252', 0, 0, '', '', '', '', '', NULL, 'doioigf'),
('36cbad85ed8dcd5fef63b3d3645c15cf', 2.3072813, 48.780687, '92330', 'Sceaux', 'France', 'FR', 'Rue de la Marne', NULL, '76 Rue de la Marne, 92330 Sceaux, France'),
('36eba1e1e343279857ea7f69a597324e', 0, 0, '', '', '', '', '', NULL, 'fd'),
('37673ca144f5de81be8b5a32ae54236a', -0.013312199999973, 51.487149, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Ferry St', NULL, '19 Ferry St, Poplar, Londres E14 3, Royaume-U'),
('37a6259cc0c1dae299a7866489dff0bd', 0, 0, '', '', '', '', '', NULL, 'null'),
('37e458bee68c51c48d4e58370eaf1665', 0, 0, '', '', '', '', '', NULL, 'salut les g'),
('385b1598ba2310a6cb7cccc8b0a42957', 0, 0, '', '', '', '', '', NULL, 'COIFFEU'),
('3876a9613aca040fb4c2b196668412ba', -0.0131802999999309, 51.4872459, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('38d7355701b6f3760ee49852904319c1', 0, 0, '', '', '', '', '', NULL, 'dfg'),
('38db09e706cc289cc09f0d50caf2e271', 0, 0, '', '', '', '', '', NULL, 'speciaiaone'),
('39fce1ceebb77262c80dbcdca8dcb120', -0.0132942999999841, 51.48712, 'E14', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '8 Ferry Street, London Borough of Tower Hamlets, E14, UK'),
('3a6d0284e743dc4a9b86f97d6dd1a3bf', 0, 0, '', '', '', '', '', NULL, 'val'),
('3bcce67a20e937f5a85a85e01fc37652', 0, 0, '', '', '', '', '', NULL, 'sou'),
('3c22fca6697dfcbd6114db02b0846a6d', 0, 0, '', '', '', '', '', NULL, 'béj'),
('3c5bf40a70168a691c240741de9a5c9b', 0, 0, '', '', '', '', '', NULL, 'salut les gar'),
('3c86598f52cdffedb742c6ed52252e42', 34.655314, 31.804381, '', 'Ashdod', 'Israël', 'IL', '', NULL, 'Ashdod, Israël'),
('3c9d2f09f85c65027d0da21a647d3bb2', 0, 0, '', '', '', '', '', NULL, 'tote'),
('3ce71cbb049dabb14c19a814bf9457b1', 6.62645259999999, 46.516662, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('3cf4046014cbdfaa7ea8e6904ab04608', 0, 0, '', '', '', '', '', NULL, 'ah'),
('3d4044d65abdda407a92991f1300ec97', 0, 0, '', '', '', '', '', NULL, 'fg'),
('3dd6b9265ff18f31dc30df59304b0ca7', 0, 0, '', '', '', '', '', NULL, 'SA'),
('3def8d49bda365e11eb3001624505fce', -0.01318839999999, 51.4872452, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('3dfe3d7a171097592cb00d6a57b6f845', 0, 0, '', '', '', '', '', NULL, 'ud'),
('3e3cde0064b5de79e57b07ea93628816', 6.62646140000004, 46.5166601, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('3e8885f35afb5a548ac4d2023db11a1f', 2.30743269999994, 48.780674, '92330', 'Sceaux', 'France', 'FR', 'Rue de la Marne', NULL, '47 Rue de la Marne, 92330 Sceaux, France'),
('3ed7dceaf266cafef032b9d5db224717', 0, 0, '', '', '', '', '', NULL, 'salut'),
('3f20d6b869e6e805d49b87386d44d304', -0.0131659999999556, 51.487247, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('3f25d1f596aead5531fd3724ef118c49', 6.62647849999996, 46.5166563, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('41895503f71f59ce931bd3590c577b3c', 0, 0, '', '', '', '', '', NULL, 'rie'),
('41f02b07e8e203d3260facb55b2f4b1b', 0, 0, '', '', '', '', '', NULL, 'mob'),
('4200e7d721ab1741a1af06f2c21bc291', 0, 0, '', '', '', '', '', NULL, 'bonjour tu vas bi'),
('420f03800a9eef2cbbf2f6c7e844050f', 0, 0, '', '', '', '', '', NULL, 'zuriv'),
('42154b5d0c577c0d0a34a195bf06b442', 0, 0, '', '', '', '', '', NULL, 'bonjour tu vas bien'),
('422475a1490ac87d27065e73feb4b5be', 0, 0, '', '', '', '', '', NULL, 'angeme'),
('4229d691b07b13341da53f17ab9f2416', 0, 0, '', '', '', '', '', NULL, 'hell'),
('4262e05af06ac84ff6540ba4da245ac0', 8.53918250000004, 47.3686498, '', 'Zurich', 'Switzerland', 'CH', '', NULL, 'Zurich, Switzerland'),
('428e68cdc37e15cae33de7b06ff0932b', 0, 0, '', '', '', '', '', NULL, 'je suis c'),
('42983b05e2f2cc22822e30beb7bdd668', 0, 0, '', '', '', '', '', NULL, 'CO'),
('42a50fc5fbc71faa08bd6646b317da5f', 2.30732510000007, 48.7806948, '92330', 'Sceaux', 'France', 'FR', 'Rue de la Marne', NULL, '47 Rue de la Marne, 92330 Sceaux, France'),
('42db99720fc041a7e8a7ca75534e1485', 0, 0, '', '', '', '', '', NULL, 'aesg'),
('4388eaf0a6b6fac5c6238d4f26b88267', -56.3289315, 5.8669482, '', 'Totness', 'Suriname', 'SR', '', NULL, 'Totness Airstrip (TOT), Totness, Suriname'),
('43b1cc1db7be63d899dd4280f578691a', 0, 0, '', '', '', '', '', NULL, 'va'),
('44061854e3f9e70995893a4f67ae5b72', -0.0131284999999934, 51.4872407, 'E14', 'London', 'United Kingdom', 'GB', 'Manchester Rd', NULL, '3 Manchester Rd, London Borough of Tower Hamlets, E14, UK'),
('44cc026eca4028b6bbec35aabc3457ec', 0, 0, '', '', '', '', '', NULL, 'doi'),
('46269562887cb7815d2c23a667c69c81', -0.0131493000000091, 51.4872484, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('46356afe55fa3cea9cbe73ad442cad47', 0, 0, '', '', '', '', '', NULL, 'hel'),
('46f4b5abc1f9a4fa0eca0520517e5730', 0, 0, '', '', '', '', '', NULL, 'tit'),
('474acacfeaf8cf94941b0510bfd28333', 6.62650880000001, 46.5166497, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('479e35ee3971b368a43a186c668d07bd', 6.62650940000003, 46.5166495, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('47b6e15a5eff1cdbfe9e998839779944', 0, 0, '', '', '', '', '', NULL, 'drd'),
('47d53612ab30838ea8949037426d891e', -0.0131691000000274, 51.4872468, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('4822833f8a6aed42c47b39a89d2dc901', -0.0131997999999385, 51.4872442, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('482935c4695a7b22a2d3aa8b950c9b6a', 0, 0, '', '', '', '', '', NULL, 'coiffe'),
('48fcd0611cc30cc8342c06b88671ff75', 6.62644380000006, 46.5166639, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('49f5087e716922083aeaa0ad7212a54d', 0, 0, '', '', '', '', '', NULL, 'coi'),
('4a0d964ce5d0ad898de685373751d421', 8.70168000000001, 47.42056, '', 'Illnau-Effretikon', 'Switzerland', 'CH', '', NULL, 'Illnau-Effretikon, Switzerland'),
('4a2783f34191b1abbffb8192cb6b509e', 6.62648730000001, 46.5166544, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('4a8a08f09d37b73795649038408b5f33', 0, 0, '', '', '', '', '', NULL, 'c'),
('4abae34c01aa612959bfbb3d63df569b', -0.0132063999999446, 51.4872437, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('4b8bc4e2f1cfd7a968a37d890ab1d320', -0.0131476999999904, 51.4872486, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('4ba5b5f66faf8bf73c23b558d9bbdee0', 0, 0, '', '', '', '', '', NULL, 'züri'),
('4bd04eea5ca94c078e8923ce8ce83e4d', 0, 0, '', '', '', '', '', NULL, 'COI'),
('4d4ba904b38d85f8001cd15526c82a56', 0, 0, '', '', '', '', '', NULL, 'pus'),
('4d66420d159409eccf5ccd1ef47af74a', 0, 0, '', '', '', '', '', NULL, 'virtual j'),
('4d71f4cefe897c442ca131013857f0a7', 8.73756460000004, 47.49995, '', 'Winterthur', 'Schweiz', 'CH', '', NULL, 'Winterthur, Schweiz'),
('4d9dfb9ce553af5b288551b46ec8628f', -0.0134689999999864, 51.4870923, 'E14 3WJ', 'London', 'United Kingdom', 'GB', 'Saint Davids Square', NULL, '7A Saint Davids Square, London, Greater London E14 3WJ, UK'),
('4de1b7a4dc53e4a84c25ffb7cdb580ee', 0, 0, '', '', '', '', '', NULL, 'et'),
('4e7e3e15740efe4c7b6b13fac1dd5a47', -66.58973, 6.42375, '', '', 'Venezuela', 'VE', '', NULL, 'Venezuela'),
('4ed6a88f746092cc49f53ad5ee66e841', -0.0132175999999617, 51.4872427, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('4f2aff017aa7649389202436fc1f9b0b', -74.0290831, 45.6834084, 'J7N 3C6', 'Mirabel', 'Kanada', 'CA', '', NULL, 'AÃ©roport international MontrÃ©al-Mirabel (YM'),
('4f570de305fa0465060cd302ed8e2ce0', 2.30742310000005, 48.7806758, '92330', 'Sceaux', 'France', 'FR', 'Rue de la Marne', NULL, '47 Rue de la Marne, 92330 Sceaux, France'),
('4f58717d04d064075004df663c273307', 6.62644699999998, 46.5166632, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('4fb3b68e84149f91bcfd0102f95d3731', 0, 0, '', '', '', '', '', NULL, 'ang'),
('4fba10beb480f5dbb26253e32bfaa58b', -0.0132142999999587, 51.487243, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('5038b0ceff1027b507339338d7e4bbdb', -0.0133144999999786, 51.487158, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Ferry St', NULL, '19 Ferry St, Poplar, Londres E14 3, Royaume-U'),
('508c75c8507a2ae5223dfd2faeb98122', 0, 0, '', '', '', '', '', NULL, 'news'),
('50fa609d34037930e379e7e7ef6ea4d5', 6.62649609999994, 46.5166524, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('5164dddbfabfabfea88b1f856deb6405', -0.0130603999999721, 51.4872467, 'E14', 'London', 'United Kingdom', 'GB', 'Manchester Rd', NULL, '3 Manchester Rd, London Borough of Tower Hamlets, E14, UK'),
('51d90dae154a3d655bcfb4c3f14068f8', 0, 0, '', '', '', '', '', NULL, 'SELIM'),
('51eb9f5c111b91c79add2b1efb896ec3', 0, 0, '', '', '', '', '', NULL, 'offre'),
('51ef959c960c57912b18620b26883e86', 6.62644939999996, 46.5166627, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('522748524ad010358705b6852b81be4c', 0, 0, '', '', '', '', '', NULL, 'ds'),
('523af537946b79c4f8369ed39ba78605', 0, 0, '', '', '', '', '', NULL, 'ad'),
('52b4eda5c493f65681c1d7a401af67c1', -0.013298299999974, 51.4871439, 'E14', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '8 Ferry Street, London Borough of Tower Hamlets, E14, UK'),
('52ca7ba95a93c317d61de653aa8a4460', 2.30738429999997, 48.7806834, '92330', 'Sceaux', 'France', 'FR', 'Rue de la Marne', NULL, '47 Rue de la Marne, 92330 Sceaux, France'),
('52e0d01f5a0dc7ac50ccc9b3d9b9339d', 6.62641080000003, 46.5166711, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('52ed40b671867ae100201ad6599fdab1', 6.62640980000003, 46.5166713, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('52fe691e00f65d7ef8f79066cc7feaea', 0, 0, '', '', '', '', '', NULL, 'sdsdds'),
('53313f4567d4348f224c33b8f964bf4a', -0.0132274999999709, 51.4872419, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('534b9a3588bdd87bf7c3b9d650e43e46', 0, 0, '', '', '', '', '', NULL, 'pu'),
('541159a120223e12cdc112e6da7e41dc', 0, 0, '', '', '', '', '', NULL, 'gfdgfdgfd'),
('5435c69ed3bcc5b2e4d580e393e373d3', 0, 0, '', '', '', '', '', NULL, 'ca'),
('545673b33caa4d86b8499eca03e9a0a7', 0, 0, '', '', '', '', '', NULL, 'specai'),
('545953106d5ba5ec3b209e08f447ce09', 0, 0, '', '', '', '', '', NULL, '8 av'),
('54a2bf8c09ace67d3513aaa1aa7aa0f3', 0, 0, '', '', '', '', '', NULL, 'sl'),
('54dd11685d504aa2eff075007900b41f', 0, 0, '', '', '', '', '', NULL, 'eff'),
('5515eca9ae3535e124a39285ab8720d2', 2.45557199999996, 48.790367, '', 'Créteil', 'France', 'FR', '', NULL, 'Créteil, France'),
('555b6ea0d91f1f981181ad1e46e3fe04', 0, 0, '', '', '', '', '', NULL, '8 a'),
('5587589cf53494a572438ece3df8cb44', 0, 0, '', '', '', '', '', NULL, 'pous'),
('569ef72642be0fadd711d6a468d68ee1', 0, 0, '', '', '', '', '', NULL, 'te'),
('56a89d6c683e59884af0cef5bc503d3f', 0, 0, '', '', '', '', '', NULL, 'udf'),
('56d2fbad5b3993d787c0154e6693412a', 0, 0, '', '', '', '', '', NULL, 'sdsdsdss'),
('56f18397b7dac937b43c7c883ae953bc', 6.62643920000005, 46.5166649, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('5700c8bd5187b31676075f4ca5b9bd02', 6.626485, 46.5166549, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('57110b6c71a419d864fb267433081565', 6.62643619999994, 46.5166656, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('5794523d52626a7ec05d091b7759f3d7', -0.0131897999999637, 51.4872451, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('57b54dd6f13a12b0252eca94a06f5fcc', 0, 0, '', '', '', '', '', NULL, 'dfhsdj'),
('587e40a4196ca41161fe9cf63e1b93a7', -0.013309100000015, 51.4871369, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Ferry St', NULL, '19-25 Ferry St, Poplar, Londres E14 3, Royaum'),
('590f35821fbed7b2ab58a9dbaf36c42d', 0, 0, '', '', '', '', '', NULL, 'vir'),
('5914349cc30af2a73a5acb4a7a8380ac', -0.0133117000000311, 51.4871471, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Ferry St', NULL, '19 Ferry St, Poplar, Londres E14 3, Royaume-U'),
('5b0bdabac6b05c2e37cd904ce2c6fadf', 0, 0, '', '', '', '', '', NULL, 'mobil'),
('5b7548c9e5118f6ec5a3c91b9e5120df', -0.0132929000000104, 51.4871141, 'E14', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '8 Ferry Street, London Borough of Tower Hamlets, E14, UK'),
('5ca2aa845c8cd5ace6b016841f100d82', 0, 0, '', '', '', '', '', NULL, 'da'),
('5cc5b1f5c30f45235806982a169953e9', 6.62644799999998, 46.516663, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('5cd1a2c6812a26f4af0bfe8eaf6422d7', 0, 0, '', '', '', '', '', NULL, 'gad'),
('5d2bf8e6622cb88ca16a745dcf8153a0', 0, 0, '', '', '', '', '', NULL, 'wk'),
('5d41402abc4b2a76b9719d911017c592', 0, 0, '', '', '', '', '', NULL, 'hello'),
('5da6ac32131c9dc23f51683ddf6fba1a', 6.62642000000005, 46.5166691, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('5df2c4e826d03571557f9309c0620738', -0.0131911999999375, 51.4872449, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('5dfd50d39a85512b1ba573dd952dd01a', -0.0133173000000397, 51.4871688, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Ferry St', NULL, '19 Ferry St, Poplar, Londres E14 3, Royaume-U'),
('5e52133a1842f12bd02cc93e92cbfbb8', 2.31623039999999, 48.7880858, '92340', 'Bourg-la-Reine', 'France', 'FR', 'Rue du Pré Hilduin', NULL, '11 Rue du Pré Hilduin, 92340 Bourg-la-Reine, France'),
('5e9ce3770ee9ffb054eecccd6fe3b3af', -0.0132283000000371, 51.4872418, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('5f346bdb2901609da889528ad790ecf0', -37.4681396, -10.6738878, '', '', 'Brasilien', 'BR', '', NULL, 'Sergipe, Brasilien'),
('5f397a1e588cfe96b4aa4bab7a5b1d44', 0, 0, '', '', '', '', '', NULL, 'rom'),
('5f573139d08e7ae72dec93e49b052b9e', -0.0132112000000006, 51.4872433, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('5fd93c7e669909fa3f6fc7083d5b8e09', 0, 0, '', '', '', '', '', NULL, 'zoube'),
('60d31eb37595dd44584be5ef363283e3', 0, 0, '', '', '', '', '', NULL, 'sf'),
('60d99e58d66a5e0f4f89ec3ddd1d9a80', 0, 0, '', '', '', '', '', NULL, 'rome'),
('61243c7b9a4022cb3f8dc3106767ed12', 0, 0, '', '', '', '', '', NULL, 'ahmad'),
('61266b977f245ddb9b49630fd699f229', 6.62643209999999, 46.5166665, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('6226f7cbe59e99a90b5cef6f94f966fd', 0, 0, '', '', '', '', '', NULL, 'sd'),
('63c293ad6ad82be5fcee129231db147f', 2.30737840000006, 48.7806845, '92330', 'Sceaux', 'France', 'FR', 'Rue de la Marne', NULL, '47 Rue de la Marne, 92330 Sceaux, France'),
('63cf32c5d074a46310a7c005b66c396e', 6.62645369999996, 46.5166617, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('6489431930785a19e2dd4da7ebb73dde', 2.35610020000001, 48.8662584, '75003', 'Paris', 'France', 'FR', 'Rue Vaucanson', NULL, '5 Rue Vaucanson, 75003 Paris, France'),
('6505853b4a8fb31d5b66eaa8896c0c35', -0.0132135000000062, 51.4872431, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('6545a7ca8eb3bc492bb4948c728e3913', 0, 0, '', '', '', '', '', NULL, 'toti'),
('65513c59c5f5055b561e61b89d2da3df', 0, 0, '', '', '', '', '', NULL, 'bejou'),
('6605fd61ab31fa64963ca8e3d7697983', 12.4942486, 41.8905198, '', 'Rome', 'Italy', 'IT', '', NULL, 'Rome, Italy'),
('660b5dc813826a7599c88e99afb1db32', 6.62649250000004, 46.5166532, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('660bf73e8e91594fecb4ccd6a90e38a5', 6.62643939999998, 46.5166649, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('6656d251fa8a1e21da8c547ce82201fa', 0, 0, '', '', '', '', '', NULL, 'coifur'),
('665faa4f8435eb13fe47d837116fc399', 6.62647570000002, 46.5166569, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('67270c6b9718c5554b7b60d7968b8c5b', 0, 0, '', '', '', '', '', NULL, 'seli'),
('6737eda29c1f8a6f1dfececa8984ce49', 0, 0, '', '', '', '', '', NULL, 'bonj'),
('67fbcd2ff41efe735ba85d9c3c592dff', -0.0132436000000098, 51.4872182, 'E14', 'London', 'United Kingdom', 'GB', 'Manchester Road', NULL, '80 Manchester Road, London Borough of Tower Hamlets, E14, UK'),
('680efc1ed7db1d0acbb993d38d3152b0', 0, 0, '', '', '', '', '', NULL, 'zü'),
('6848d756da66e55b42f79c0728e351ad', 0, 0, '', '', '', '', '', NULL, 'baby'),
('688582cd15bac0d86c58af25fb935d86', 0, 0, '', '', '', '', '', NULL, 'ahmad gebri'),
('69fb8e8b1120a85302bf91ba1abd3ed4', 0, 0, '', '', '', '', '', NULL, 'inform'),
('6a5b4d7eaecee4db464012a81c177187', 0, 0, '', '', '', '', '', NULL, 'marseille'),
('6a6c2d73ea179254849f04ee523e8df7', 0, 0, '', '', '', '', '', NULL, 'bonjour tu v'),
('6ab1d6984c968a8bee69dc8afeed9c36', 2.35610989999998, 48.8662735, '75003', 'Paris', 'France', 'FR', 'Rue Vaucanson', NULL, '5 Rue Vaucanson, 75003 Paris, France'),
('6abcc70c065bd4d3571b9a86a9ced809', -0.0133104999999887, 51.4871423, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Ferry St', NULL, '19-25 Ferry St, Poplar, Londres E14 3, Royaum'),
('6caa043da7e51d5405f87641de724439', 0, 0, '', '', '', '', '', NULL, 'ahma'),
('6ce809eacf90ba125b40fa4bd903962e', 0, 0, '', '', '', '', '', NULL, 'c++'),
('6d3c5993ca017d0ff169b425d3193f02', 0, 0, '', '', '', '', '', NULL, 'aes'),
('6d707e94677358c13086172ded0ad33e', 0, 0, '', '', '', '', '', NULL, 'vill'),
('6da0649ce8616117d2f38581ae77f6bf', 6.62645520000001, 46.5166614, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('6db116e9f494c90c9ce4483bb172f1c5', 6.62648990000002, 46.5166538, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('6dce800665b001d65d6f6129a30180b5', -0.0133189000000584, 51.4873577, 'E14', 'London', 'United Kingdom', 'GB', 'East Ferry Road', NULL, '224 East Ferry Road, London Borough of Tower Hamlets, E14, UK'),
('6e8574ca6c7e6d4b9d32c20c73a1689b', 0, 0, '', '', '', '', '', NULL, 'zurich'),
('6ec5dbe0c53114247dd799bafc240c58', 0, 0, '', '', '', '', '', NULL, 'ahm'),
('6f8f57715090da2632453988d9a1501b', 0, 0, '', '', '', '', '', NULL, 'm'),
('6f96cfdfe5ccc627cadf24b41725caa4', 0, 0, '', '', '', '', '', NULL, 'he'),
('6fbfd5e68d3306e51350bea0232f8fa5', 0, 0, '', '', '', '', '', NULL, 'sdfds'),
('707800073f95cb227a5d4d7d421f384b', -0.013291400000071, 51.4871076, 'E14', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '8 Ferry Street, London Borough of Tower Hamlets, E14, UK'),
('71028752a3cb76ea6b0dc58d556853e2', 0, 0, '', '', '', '', '', NULL, 'bé'),
('718b6dd54c8d1d3ad19eb99cb12f13e2', 0, 0, '', '', '', '', '', NULL, 'sdsds'),
('7215ee9c7d9dc229d2921a40e899ec5f', 0, 0, '', '', '', '', '', NULL, ' '),
('723a9ddacf017ff14ff24deb779fd7f4', 0, 0, '', '', '', '', '', NULL, 'aesgd'),
('7270c80c6ba1e7d7ba3b4b8b9c70aebd', 0, 0, '', '', '', '', '', NULL, 'COIFFEUR'),
('72b5b0df9c09ba746155abc5297c1ed2', -0.01330710000002, 51.4871291, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Ferry St', NULL, '19-25 Ferry St, Poplar, Londres E14 3, Royaum'),
('7311ef5f1311cce7cdab232d62735ae5', 0, 0, '', '', '', '', '', NULL, 'poussse'),
('733540828109ecc5c86ff7fb515e6c4c', 0, 0, '', '', '', '', '', NULL, 'sdfdsfds'),
('73833c0bcce69472f7f0b153de829f9b', 2.35604360000002, 48.8661695, '75003', 'Paris', 'France', 'FR', 'Rue Vaucanson', NULL, '5 Rue Vaucanson, 75003 Paris, France'),
('745c829de279c2298cd360be230de907', 0, 0, '', '', '', '', '', NULL, 'shing'),
('75375c4bd65ab9c0c030f68b39b26809', 0, 0, '', '', '', '', '', NULL, 'cheu'),
('7606517b6f62538f9ad5d84832bf0930', 0, 0, '', '', '', '', '', NULL, 'dfh'),
('765de9cc4106832d8c4b391189f2f194', 0, 0, '', '', '', '', '', NULL, 'Mast'),
('771b37b6b2de52831953534c8e989346', -0.0132866999999806, 51.4870873, 'E14', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '8 Ferry Street, London Borough of Tower Hamlets, E14, UK'),
('7794fc517590053809f758b7e16d87ed', 0, 0, '', '', '', '', '', NULL, 'sal'),
('7795be94dc5a46e023674494d328e7de', 0, 0, '', '', '', '', '', NULL, 'pouss'),
('77963b7a931377ad4ab5ad6a9cd718aa', 0, 0, '', '', '', '', '', NULL, 'ddd'),
('7799d11f31e6d84dd9edc44c27c6d7d0', -0.0133091999999806, 51.4871372, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Ferry St', NULL, '19-25 Ferry St, Poplar, Londres E14 3, Royaum'),
('77cbc257e66302866cf6191754c0c8e3', 0, 0, '', '', '', '', '', NULL, 'sh'),
('7815696ecbf1c96e6894b779456d330e', 0, 0, '', '', '', '', '', NULL, 'asd'),
('78bb6813815a6bdc700fdfece63ce0b9', 5.36977999999999, 43.296482, '', 'Marseilles', 'Frankreich', 'FR', '', NULL, 'Marseille, Frankreich'),
('78d6f760d3a202c4d080135ec39627a8', -0.0133131000000049, 51.4871524, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Ferry St', NULL, '19 Ferry St, Poplar, Londres E14 3, Royaume-U'),
('7932f0988d5bd36afd3a18a8fd465f7b', -0.0133085999999594, 51.4871349, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Ferry St', NULL, '19-25 Ferry St, Poplar, Londres E14 3, Royaum'),
('79524dc548226cb4a95992d4076c68c8', -86.698071, 41.2594853, '46534', '', 'États-Unis', 'US', '', NULL, 'Toto, Center, Indiana 46534, États-Unis'),
('79563e90630af3525dff01b6638b0886', 0, 0, '', '', '', '', '', NULL, 'je'),
('79a44cb8008d1032171a87d213fe2335', 0, 0, '', '', '', '', '', NULL, 'offr'),
('79a5b472754611bf66e55cff78eff078', -0.013292999999976, 51.4871143, 'E14', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '8 Ferry Street, London Borough of Tower Hamlets, E14, UK'),
('79a628b2d968cfe1a7f9c5e398f6b96a', 0, 0, '', '', '', '', '', NULL, 'ew'),
('79aa9ef11e7bcebd49c6837a16c89859', 0, 0, '', '', '', '', '', NULL, 'azr'),
('79d6c7f25edbf1ea5b5601bcbbb29073', 0, 0, '', '', '', '', '', NULL, 'coifyr'),
('79dc9a222e7abc2e8eb418d9b5e92bda', 0, 0, '', '', '', '', '', NULL, 'zrann'),
('7a2ec8bf58ef75ff11ed4e4e24f28cee', 0, 0, '', '', '', '', '', NULL, 'bonjour tu'),
('7af4f4dabe24e51f889d8cd369a9da93', 6.62648779999995, 46.5166543, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('7b6205be3b26946773c378b804223c38', 6.62645079999993, 46.5166624, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('7b774effe4a349c6dd82ad4f4f21d34c', 0, 0, '', '', '', '', '', NULL, 'u'),
('7b8b965ad4bca0e41ab51de7b31363a1', 0, 0, '', '', '', '', '', NULL, 'n'),
('7bafb2e4eeefe2b09c302e63326673fe', 0, 0, '', '', '', '', '', NULL, 'sdfdsfd'),
('7be472982031fbcbefb5fbfc5f7f9aa7', 6.62648050000007, 46.5166559, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('7ca5e45ad6eb60f61b3545b653f5fe83', 6.62648420000005, 46.5166551, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('7cd8770cec71a195bba03cc1a341303d', -0.0131661000000349, 51.487247, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('7ce8636c076f5f42316676f7ca5ccfbe', 0, 0, '', '', '', '', '', NULL, 'lo'),
('7e25b972e192b01004b62346ee9975a5', 0, 0, '', '', '', '', '', NULL, 'wind'),
('7e4ac15a4adaced5d9c4e3c6fd18b210', 7.07679359999997, 46.1020062, '1920', 'Martigny', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 12, 1920 Martigny, Schweiz'),
('7e6c3c2f3335548e7b840c10069db5d8', -0.0132883999999649, 51.4870944, 'E14', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '8 Ferry Street, London Borough of Tower Hamlets, E14, UK'),
('7e94476d62556cc8501e3df5b8d6470d', 0, 0, '', '', '', '', '', NULL, 'maps'),
('7eb13b767d502047b76aa6be68a3d319', 2.30741620000003, 48.7806772, '92330', 'Sceaux', 'France', 'FR', 'Rue de la Marne', NULL, '47 Rue de la Marne, 92330 Sceaux, France'),
('7ecd236e923ab1f29b840c91c5efad19', 6.62642470000003, 46.5166681, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('7ed201fa20d25d22b291dc85ae9e5ced', 0, 0, '', '', '', '', '', NULL, 'con'),
('7f3c1ae38e1687965056c3834c48b343', 0, 0, '', '', '', '', '', NULL, 'SARA'),
('7f49f47887ad454d285b0cba3ef619e2', 0, 0, '', '', '', '', '', NULL, 'informat'),
('7f93ee7123d7dc7205bfb98115d41c0f', -0.0132509000000027, 51.4872408, 'E14', 'London', 'United Kingdom', 'GB', 'Manchester Road', NULL, '3 Manchester Road, London Borough of Tower Hamlets, E14, UK'),
('803a2ddd82fb114e8866575376985ab5', -0.0131708999999773, 51.4872466, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('804dd993a935e1392e9bafeb8202aef2', 2.35609109999996, 48.866244, '75003', 'Paris', 'France', 'FR', 'Rue Vaucanson', NULL, '5 Rue Vaucanson, 75003 Paris, France'),
('80b26140430853b8d5fa49c56d132f12', -0.0132178000000067, 51.4872427, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('80da3f50f1737950bab3a8207708cc0d', 0, 0, '', '', '', '', '', NULL, 'züric'),
('81200d17fd53818ef119240afc6da7eb', 2.31620929999997, 48.7880521, '92340', 'Bourg-la-Reine', 'France', 'FR', 'Rue du Pré Hilduin', NULL, '11 Rue du Pré Hilduin, 92340 Bourg-la-Reine, France'),
('81625dda4b3050cc87b2e8c9801ee100', -0.0131549000000177, 51.4872371, 'E14', 'London', 'United Kingdom', 'GB', 'Manchester Rd', NULL, '80 Manchester Rd, London Borough of Tower Hamlets, E14, UK'),
('817a54bf1aeb91092d4e7f3f45c9b921', -0.126236199999994, 51.5001524, '', 'Londres', 'Royaume-Uni', 'GB', '', NULL, 'Cité de Westminster, Londres, Royaume-Uni'),
('81fd540cae04764c58cd8317c529f8ad', 2.37163529999998, 48.7844782, '94800', 'Villejuif', 'Frankreich', 'FR', 'Avenue des Chardons', NULL, '8 Avenue des Chardons, 94800 Villejuif, Frank'),
('8277e0910d750195b448797616e091ad', 0, 0, '', '', '', '', '', NULL, 'd'),
('82cc921c6a5c6707e1d6e6862ba3201a', 0, 0, '', '', '', '', '', NULL, 'sdsdsd');
INSERT INTO `spot` (`id_spt`, `long_spt`, `lat_spt`, `zip_spt`, `city_spt`, `country_spt`, `state_spt`, `street_spt`, `no_street_spt`, `address_spt`) VALUES
('82d5984c2a2ad4c62caf1dd073b1c91c', 0, 0, '', '', '', '', '', NULL, 'sds'),
('837a502d6d0bb6e5c54b0204148eff40', 0, 0, '', '', '', '', '', NULL, 'sdsdsds'),
('83878c91171338902e0fe0fb97a8c47a', 0, 0, '', '', '', '', '', NULL, 'p'),
('838c136a395fd1bc06774981730abdd8', -0.0131682999999612, 51.4872469, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('83b331b726ca6e9a7fdb427772a11c13', 6.62646280000001, 46.5166597, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('846eb9fdc6623c0f017a984adce8bd4a', 0, 0, '', '', '', '', '', NULL, 'effre'),
('84d9cfc2f395ce883a41d7ffc1bbcf4e', 0, 0, '', '', '', '', '', NULL, 'sdfsd'),
('84f072cdcf4174e8a035c678ab0a59dd', 6.56192529999998, 46.5177733, '1015', 'Lausanne', 'Suisse', 'CH', 'PSE', NULL, 'PSE B, 1015 Lausanne, Suisse'),
('84f3a8e563320c44310325870b532c8c', 6.62646570000004, 46.5166591, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('852ade3f94a15e9e65cfa0f117612c46', 0, 0, '', '', '', '', '', NULL, 'coify'),
('857efce819cf28136bea456d780a702d', -0.0132850999999619, 51.4870803, 'E14', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '8 Ferry Street, London Borough of Tower Hamlets, E14, UK'),
('85da74688f9d57bd011ea71e1b2e8815', -0.0132141999999931, 51.487243, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('85fbbe9379d9a42241b756819d0d5b08', 6.62645350000003, 46.5166618, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('86f951e76b54fa55d51010aa54c9023f', 0, 0, '', '', '', '', '', NULL, 'ahmad gebr'),
('86f9b00298cf1f43436143887bb3fce5', -0.0132969000000003, 51.487135, 'E14', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '8 Ferry Street, London Borough of Tower Hamlets, E14, UK'),
('87406eef8352f58a9ba96bfc0f04b5ea', -0.0132954000000609, 51.4870443, 'E14 3DT', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '8 Ferry Street, London, Greater London E14 3DT, UK'),
('874095461971985109507e6337e576a3', 0, 0, '', '', '', '', '', NULL, 'Sadsad'),
('87484e2842b4fd7656b7a15a91dfb18e', 0, 0, '', '', '', '', '', NULL, 'zra'),
('8828220116bc2107b54a8e100a436961', 0, 0, '', '', '', '', '', NULL, 'hotmai'),
('88327dbb341321147fc7dde8e7c733d7', -0.0133098999999675, 51.4871398, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Ferry St', NULL, '19-25 Ferry St, Poplar, Londres E14 3, Royaum'),
('88c140be77c481bc9e848aecd9942e03', 0, 0, '', '', '', '', '', NULL, 'hak'),
('88e131830ae63fc1d2281ce900fe78f9', 0, 0, '', '', '', '', '', NULL, 'Ds'),
('89b23717131313aa43a4fe5bc8b538eb', 0, 0, '', '', '', '', '', NULL, 'fksd'),
('89f25685515117d9ef631697df123bf9', 0, 0, '', '', '', '', '', NULL, 'dfgdf'),
('8a180d4edd32b395da3d3e29ecea4f8e', 0, 0, '', '', '', '', '', NULL, 'salut l'),
('8a3869ac22d5b29cd2725a748e4181f6', 6.62644780000005, 46.516663, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('8a727d4effd2a757a1d15156d08735a1', 0, 0, '', '', '', '', '', NULL, 'je su'),
('8aa8fe544ffd61fcd897b52825b9d1e5', 6.62644950000004, 46.5166627, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('8b01dce92eacf2ea5e58b5637b98e9d2', 0, 0, '', '', '', '', '', NULL, 'news#'),
('8b47ac9d032236bfce35661e62f85cb3', 8.53331479999997, 47.3831448, '8005', 'Zürich', 'Schweiz', 'CH', 'Limmatstrasse', NULL, 'Limmatstrasse 93, 8005 Zürich, Schweiz'),
('8b7fe5118bd300b3ef38ac00db8f61ba', -0.013223499999981, 51.4872422, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('8be74552df93e31bbdd6b36ed74bdb6a', 0, 0, '', '', '', '', '', NULL, 'sel'),
('8bf8854bebe108183caeb845c7676ae4', 0, 0, '', '', '', '', '', NULL, 'of'),
('8c1d34fac07799db425111ff1ab43a45', -0.013309100000015, 51.4871034, 'E14 3DT', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '6 Ferry Street, London, Greater London E14 3DT, UK'),
('8d1417c7cf935754916b7daf7be4d096', 0, 0, '', '', '', '', '', NULL, 'bonjour tu va'),
('8d6fa868857bad50023cd586bf159042', 0, 0, '', '', '', '', '', NULL, 'je s'),
('8d9cafbdba16e54bc75952984ed08b24', 6.84692999999993, 0, '', 'Vevey', 'Switzerland', 'CH', '', NULL, 'Vevey'),
('8dda99b909a45e922dae4af966e8e0b2', 0, 0, '', '', '', '', '', NULL, 'rien'),
('8df68743b9875904b98645b2f2ec3974', -0.013310600000068, 51.4871426, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Ferry St', NULL, '19-25 Ferry St, Poplar, Londres E14 3, Royaum'),
('8e458cf2e11c248276734b0b209151cb', 6.6264572, 46.516661, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('8e5366d49d527c38a44bd47f9d41cded', -0.0132885000000442, 51.4870949, 'E14', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '8 Ferry Street, London Borough of Tower Hamlets, E14, UK'),
('8f47b32643babe5f229794f87e4f98df', 0, 0, '', '', '', '', '', NULL, 'selim pou'),
('8f7608eae2a491f5030e3ba4365514fa', 0, 0, '', '', '', '', '', NULL, 'zür'),
('8f91895794095c892213bf6c297082e4', 6.62646410000002, 46.5166594, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('8fa14cdd754f91cc6554c9e71929cce7', 0, 0, '', '', '', '', '', NULL, 'f'),
('8fa1812e49ee4e678a5289f71d09f2da', 0, 0, '', '', '', '', '', NULL, 'pousss'),
('8fac809ea84bf5adbc389a7712b290fb', 0, 0, '', '', '', '', '', NULL, 'selm'),
('8fccb283c810ada0e486543208d223a4', 0, 0, '', '', '', '', '', NULL, 'udfdf'),
('90047c13b07740ac8992903931b791d5', -0.0133111999999755, 51.4871451, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Ferry St', NULL, '19 Ferry St, Poplar, Londres E14 3, Royaume-U'),
('906252292f0a4628ab76569e8099a862', 0, 0, '', '', '', '', '', NULL, 'specialon'),
('90ed0e4696ca879c2ee9efaf73614bbd', 0, 0, '', '', '', '', '', NULL, 'adsdt'),
('910955a907e739b81ec8855763108a29', 0, 0, '', '', '', '', '', NULL, 'be'),
('9181ab10cc2003eaa38dd19a0603ab2d', 0, 0, '', '', '', '', '', NULL, 'fks'),
('91e8c1d11b626f99cfaa414da7f6d0ce', -0.013289699999973, 51.4871002, 'E14', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '8 Ferry Street, London Borough of Tower Hamlets, E14, UK'),
('921a43588501d58278d140fe5809eb31', 6.6264347, 46.5166659, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('9221adbcbf108d61f9626a4dabad56f9', 0, 0, '', '', '', '', '', NULL, 'villej'),
('922583aa023fcb0a5fc494a6277a6eca', -0.0133164999999735, 51.4871657, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Ferry St', NULL, '19 Ferry St, Poplar, Londres E14 3, Royaume-U'),
('925cc8d2953eba624b2bfedf91a91613', 0, 0, '', '', '', '', '', NULL, 'ha'),
('92c3fe476770c7c97cc368ee576b1a74', -0.0132140000000618, 51.487243, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('92c77660051d445f8fe387ef6cb5134a', 0, 0, '', '', '', '', '', NULL, 'bonjo'),
('9301f8dcc62edb90c3eb4b41ea0923db', 6.62652049999997, 46.5166471, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('936f8be9b84767a06cb9a53bbb281bcd', 0, 0, '', '', '', '', '', NULL, 'coifyre'),
('93ae74cc6dd088ff59db121a7f0bee51', 2.36624830000005, 48.7949315, '94800', 'Villejuif', 'France', 'FR', '', NULL, '94800 Villejuif France'),
('945364a2510a902e781beaf8df6fbf6a', 6.62643909999997, 46.5166649, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('947af30fc5fd1aaf1e0d8899d5d5baee', 0, 0, '', '', '', '', '', NULL, 'wwe'),
('94f466c8cb26834a4d3c527412a2e21d', 0, 0, '', '', '', '', '', NULL, 'bonjou'),
('950155ae8abf775a4a8735ba62bb62cc', 0, 0, '', '', '', '', '', NULL, 'je suis'),
('95687afb5d9a2a9fa39038f991640b0c', 0, 0, '', '', '', '', '', NULL, 'dp'),
('958d66e8e20fa32574f6aba305e9d173', 0, 0, '', '', '', '', '', NULL, 'dksf'),
('95bf8da9720489cf7014584511e2f373', 2.189617, 48.697161, '', 'Orsay', 'France', 'FR', '', NULL, 'Orsay, France'),
('96529cc41f57efda7fd21ab5f2e0d97e', 6.62647100000004, 46.5166579, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('9678a676dd5b0b115a8a1678e8aeba12', 29.9652397, 31.2272851, '', '', 'Ã„gypten', 'EG', '', NULL, 'Al Uoesf, Zerebana We El Hamam, Qism El-raml,'),
('9682932f37e415cbb376564cb332b1b8', 0, 0, '', '', '', '', '', NULL, 'sdfsdff'),
('968cb343fa8803230d99e48cca75950f', 6.6264645, 46.5166594, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('96ade413e16eca9516d799f7351cf442', 2.30730249999999, 48.7806829, '92330', 'Sceaux', 'France', 'FR', 'Rue de la Marne', NULL, '76 Rue de la Marne, 92330 Sceaux, France'),
('971dd9cb9b9467b0fa85fe61ba1640e9', 0, 0, '', '', '', '', '', NULL, 'puss'),
('97282b278e5d51866f8e57204e4820e5', 0, 0, '', '', '', '', '', NULL, 'al'),
('972d0204e975f563c95271f685ffc1fe', -0.0131311000000096, 51.48725, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('978017277c67a18e381f1b6ee257d2f0', 6.62649409999995, 46.5166529, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('98133ccfee21f6c09917f52f345201e3', 0, 0, '', '', '', '', '', NULL, 'speca'),
('985381c33336302a93bec8a7aa2082bf', 6.62645139999995, 46.5166622, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('9858912552485b24ce66a8d1547d3933', 7.07750650000003, 46.1017566, '1920', 'Martigny', 'Suisse', 'CH', 'Rue du Grand-Verger', NULL, 'Rue du Grand-Verger 6, 1920 Martigny, Suisse'),
('985a937eef1b492f14b8d790d3df6fd6', 0, 0, '', '', '', '', '', NULL, 'salut le'),
('986f71ff988797fc83c6f8c8de9a7f79', 6.62645699999996, 46.516661, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('988287f7a1eb966ffc4e19bdbdeec7c3', 0, 0, '', '', '', '', '', NULL, 'ki'),
('98ae61736ef6a5dcdec9587bee919500', 2.30743510000002, 48.7806735, '92330', 'Sceaux', 'France', 'FR', 'Rue de la Marne', NULL, '47 Rue de la Marne, 92330 Sceaux, France'),
('98b9fadb95e25483a22dc2c2ae900eea', 2.35606780000001, 48.8662074, '75003', 'Paris', 'France', 'FR', 'Rue Vaucanson', NULL, '5 Rue Vaucanson, 75003 Paris, France'),
('98ea8b0b3f21b0ebab95150f70942dfe', 0, 0, '', '', '', '', '', NULL, 'speciaia'),
('98fe3f7f5aa9e0d57866ea8a0474dc72', 0, 0, '', '', '', '', '', NULL, 'FATE'),
('993560a792e622201090d67041f7882e', 0, 0, '', '', '', '', '', NULL, 'wi'),
('997c08347b7a6ac8e315d7394a1a47d7', 0, 0, '', '', '', '', '', NULL, 'ldsf'),
('9992d09227a4ce59907285dec5c9cc7b', -0.0133163000000422, 51.4873125, 'E14', 'London', 'United Kingdom', 'GB', 'East Ferry Road', NULL, '224 East Ferry Road, London Borough of Tower Hamlets, E14, UK'),
('99f8dafa1f965b3b6692a598e1443527', -0.0131992999999966, 51.4872443, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('9a17d384d40280c631820243ca7a0266', 6.84692999999993, 46.4589, '', 'Vevey', 'Schweiz', 'CH', '', NULL, 'Vevey, Schweiz'),
('9a820eb5a66aebf77500fb00aa51183c', 0, 0, '', '', '', '', '', NULL, 'plus?'),
('9bbcaf657af38d0eb994f658c4063186', 6.62647119999997, 46.5166579, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('9c1dd1900282a69f96c6fb420e957e08', 0, 0, '', '', '', '', '', NULL, 'pei'),
('9caf6f94c6498e7f5ae38d285fb0045b', 8.69538220000004, 47.4279872, '8307', 'Illnau-Effretikon', 'Suisse', 'CH', 'Müslistrasse', NULL, 'Müslistrasse, 8307 Illnau-Effretikon, Suisse'),
('9cc00524cd7645cc68ab3c262ef03538', 0, 0, '', '', '', '', '', NULL, 'hotma'),
('9cd72c0fc412775d81bbd2398179894c', -0.0132909999999811, 51.4871056, 'E14', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '8 Ferry Street, London Borough of Tower Hamlets, E14, UK'),
('9e2691922175825e05edc890f563c1cf', 0, 0, '', '', '', '', '', NULL, 'pousse'),
('9e3669d19b675bd57058fd4664205d2a', 0, 0, '', '', '', '', '', NULL, 'v'),
('9f7eaed74d4abc2104ca96e29bdf5bd0', 0, 0, '', '', '', '', '', NULL, 'je sui'),
('9fabdd011821d70efce9288617dd8465', 0, 0, '', '', '', '', '', NULL, 'dfhsdjf'),
('9fdaabb63ef4776a3a0549f3aeca5983', 0, 0, '', '', '', '', '', NULL, 'angemen'),
('a074e40078438e4ee79d45ee719c73ec', -0.0133190999999897, 51.4873611, 'E14', 'London', 'United Kingdom', 'GB', 'East Ferry Road', NULL, '224 East Ferry Road, London Borough of Tower Hamlets, E14, UK'),
('a134366e3b7ac52226597192dc0eddd1', -0.12800500000003, 51.508129, '', 'London', 'Großbritannien', 'GB', '', NULL, 'London, Vereinigtes Königreich'),
('a181a603769c1f98ad927e7367c7aa51', 0, 0, '', '', '', '', '', NULL, 'all'),
('a20b5f78a025eda020578bd929199619', 2.30711610000003, 48.7806333, '92330', 'Sceaux', 'France', 'FR', 'Rue de la Marne', NULL, '70 Rue de la Marne, 92330 Sceaux, France'),
('a257ed39313a3027f3d394f775733dd1', 0, 0, '', '', '', '', '', NULL, 'salut les ga'),
('a2de10db79fd76302abb5c812a820b41', 0, 0, '', '', '', '', '', NULL, 'gaddes'),
('a3001bcf26630130f2d920c4243564e0', -0.0133109999999306, 51.4871441, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Ferry St', NULL, '19-25 Ferry St, Poplar, Londres E14 3, Royaum'),
('a385e96c9dcb7d1865a718934a8798fc', 0, 0, '', '', '', '', '', NULL, 'virt'),
('a3ccfb1a1f9026fd8342746cca6c34f9', 6.62644790000002, 46.516663, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('a4ec7d3459f8ba7e2c302d9fe70e21ee', 0, 0, '', '', '', '', '', NULL, 'informa'),
('a4f73b46ceef5de0ab08eb8d547f314d', -0.0131287000000384, 51.4872394, 'E14', 'London', 'United Kingdom', 'GB', 'Manchester Rd', NULL, '80 Manchester Rd, London Borough of Tower Hamlets, E14, UK'),
('a5f06a5693ffa372f187b651ea3910eb', 0, 0, '', '', '', '', '', NULL, 'gfdgfdgfdg'),
('a69a809c3642d117316fd851e16d0cfc', -0.0132059000000027, 51.4872437, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('a6ed2b7033a44688f0b5aae4fa868f2e', 0, 0, '', '', '', '', '', NULL, 'coiffeur'),
('a765406faf3028d3e98ad2b0a09b3685', 0, 0, '', '', '', '', '', NULL, 'coiff'),
('a7a246a12fef4f3019807a927ffd3c75', 8.73750080000002, 47.5000848, '8400', 'Winterthur', 'Switzerland', 'CH', 'Palmstrasse', NULL, 'Palmstrasse 27, 8400 Winterthur, Switzerland'),
('a7bc1ad1c147dbc4667201f231d1d7fa', 0, 0, '', '', '', '', '', NULL, 'lon'),
('a7f1bbc90496ca91cfd4c4fd6a33d161', 0, 0, '', '', '', '', '', NULL, 'dsfs'),
('a7f1f2c46c62415198e0884b827bd2d2', 0, 0, '', '', '', '', '', NULL, 'virtuals'),
('a834c7fc8e18098d09e8f4866a7d0648', 0, 0, '', '', '', '', '', NULL, 'selim p'),
('a9170cf24b7cfa2ebaa39bb475871e57', 0, 0, '', '', '', '', '', NULL, 'ahmad ge'),
('aa393bafe2a029c59dd678b73cc9eba1', 0, 0, '', '', '', '', '', NULL, 'drdrt'),
('aa3c6a175d52a827a0e28e0d69d24631', -0.0131797000000233, 51.4872459, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('aa7c2f8b74458aeae4e388c376197581', 0, 0, '', '', '', '', '', NULL, 'sle'),
('aaa695a8e1330cfb372c3b7d4f72b4ac', 0, 0, '', '', '', '', '', NULL, 'wkew'),
('aadfafb116d4db62cb0cf7feb4740ff0', -0.0132270999999946, 51.4872419, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('ab6c040066603ef2519d512b21dce9ab', 0, 0, '', '', '', '', '', NULL, 'co'),
('abd1720e13e4d59ec7f0a7a42bc64677', -0.0131751999999778, 51.4872463, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('acc801aaf80d6f8f8e8b542102ea9e78', 0, 0, '', '', '', '', '', NULL, 'lds'),
('ad57484016654da87125db86f4227ea3', 0, 0, '', '', '', '', '', NULL, 'ww'),
('ad666f681c62603180c14e43d126f56e', 6.62647070000003, 46.516658, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('ad7532d5b3860a408fbe01f9455dca36', 0, 0, '', '', '', '', '', NULL, 'bo'),
('adab7b701f23bb82014c8506d3dc784e', 0, 0, '', '', '', '', '', NULL, 'hr'),
('addc3dc2b19fc38f288f0ee9b90cba8c', 0, 0, '', '', '', '', '', NULL, 'new tec'),
('ae16c65fb03b2a5da4269c0e144c0872', 23.0313733, 40.3246838, '63080', 'Kallikrateia', 'Greece', 'GR', 'Villi', NULL, 'Villi, Kallikrateia 63080, Greece'),
('ae3616a00f2500ae8986e4e337bd9551', 6.62644299999999, 46.5166641, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('ae7268a515c971a7f2813d7c008cc92a', 0, 0, '', '', '', '', '', NULL, 'gfdgf'),
('ae9c2a2ad569bad6d74256cc62f4d1b5', 6.62646180000002, 46.51666, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('af101b3424ecdeadd0fa75e9e1d304de', 0, 0, '', '', '', '', '', NULL, 'dddf'),
('afaf665116a124f27756b12ca01cd0a8', -0.0133068000000094, 51.4871279, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Ferry St', NULL, '19-25 Ferry St, Poplar, Londres E14 3, Royaum'),
('b033f6849985d5e6a378caa6be39a0ed', 6.62644409999996, 46.5166638, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('b05cb6c6a284c90a61355d2871dda51e', 0, 0, '', '', '', '', '', NULL, 'zoubeid'),
('b0e473b1d540b2dd9b5a3e4eb3a4ff50', 6.62649420000002, 46.5166529, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('b11a29b759a40cd6b0f430e6cbaf9498', 0, 0, '', '', '', '', '', NULL, 'Recherche...'),
('b136a8ddf2bf5c03fbeb605281893394', 2.30741739999996, 48.7806769, '92330', 'Sceaux', 'France', 'FR', 'Rue de la Marne', NULL, '47 Rue de la Marne, 92330 Sceaux, France'),
('b1bd49922e29a4955f40570a461722b4', 0, 0, '', '', '', '', '', NULL, 'zou'),
('b1ef1d4969c3df2e8cf5c77ffc751831', 0, 0, '', '', '', '', '', NULL, 'adsdte'),
('b2145aac704ce76dbe1ac7adac535b23', 0, 0, '', '', '', '', '', NULL, 'var'),
('b2e8638513ec6cc8b68b253be6665d10', 0, 0, '', '', '', '', '', NULL, 'bonjour tu vas b'),
('b2f5ff47436671b6e533d8dc3614845d', 0, 0, '', '', '', '', '', NULL, 'g'),
('b325496930a78617bb86dc102a3ce242', -0.0131787000000259, 51.487246, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('b37a461bd1cdf97cb5f24ba90e1d333d', -0.0132082000000082, 51.4872435, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('b4688aaaaf17fad03225929fe56ad458', 0, 0, '', '', '', '', '', NULL, 'dr'),
('b48917eeed6fec3c431f59975018ddf5', 0, 0, '', '', '', '', '', NULL, 'fgdf'),
('b4dd6658e2032a79cb015bbc3b8f8e22', 6.62642500000004, 46.516668, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('b58c2d4a810e07b2d853f8b6f565c630', 0, 0, '', '', '', '', '', NULL, 'Mas'),
('b5abb09057933e91b759b9ad74e5a08f', 0, 0, '', '', '', '', '', NULL, 'coifure'),
('b5d9b59113086d3f9f9f108adaaa9ab5', 0, 0, '', '', '', '', '', NULL, 'ho'),
('b5fddf4814652b168b2b5c6524f68e7f', 6.63359709999998, 46.5199617, '', 'Lausanne', 'Schweiz', 'CH', '', NULL, 'Lausanne, Schweiz'),
('b6bb43df4525b928a105fb5741bddbea', 0, 0, '', '', '', '', '', NULL, 'ae'),
('b7119c70ce0801d140c938643659d586', -0.0132877999999437, 51.4870919, 'E14', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '8 Ferry Street, London Borough of Tower Hamlets, E14, UK'),
('b742db58b16f1d7de716d5e8a8afabbb', 0, 0, '', '', '', '', '', NULL, 'MODE'),
('b74df323e3939b563635a2cba7a7afba', 0, 0, '', '', '', '', '', NULL, 'ma'),
('b7831dcd734288134ee6f3b899ebc5c0', 0, 0, '', '', '', '', '', NULL, 'bonjour tu vas'),
('b7cf3b40bb6c821e6ef46ce313f18c4a', 6.62642019999998, 46.5166691, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('b807023f87e63b8ada92f79f546ff9cc', 0, 0, '', '', '', '', '', NULL, 'so'),
('b81496035eb5936189ccb9d77b2839aa', -0.0132889999999861, 51.4870972, 'E14', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '8 Ferry Street, London Borough of Tower Hamlets, E14, UK'),
('b8317c4f153123800fd2a39c96afe28d', 6.62644690000002, 46.5166632, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('b842d467b38f384fa564e50d0fd21f12', -0.0133140000000367, 51.4871558, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Ferry St', NULL, '19 Ferry St, Poplar, Londres E14 3, Royaume-U'),
('b843d15eb702ff722ad842dde7007864', -0.0131737000000385, 51.4872464, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('b9592df35f185c74a76288cde093aa5d', 8.69529209999996, 47.4275524, '8307', 'Illnau-Effretikon', 'Suisse', 'CH', 'Illnauerstrasse', NULL, 'Illnauerstrasse 27, 8307 Illnau-Effretikon, Suisse'),
('b95eb64f8511691abc77da22d152e0db', -0.0132317999999714, 51.4872416, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('b979c2934ac0b4ba3f08dabfdd1b2299', 0, 0, '', '', '', '', '', NULL, 'spec'),
('b9c30e7bcb976a361b555ff194239774', 6.62649139999996, 46.5166535, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('b9fe1eea57ddefdf36c4193bd2eb869f', 0, 0, '', '', '', '', '', NULL, 'slei'),
('ba40bf59e82432e19b35232b4089be20', 0, 0, '', '', '', '', '', NULL, 'gfdgfdgfdgfdg'),
('ba7893e62fc5e3cb5324626c2f332847', 0, 0, '', '', '', '', '', NULL, 'dfsd'),
('ba7a96eb437d17f8a0535b53b7643238', -0.013317700000016, 51.4873366, 'E14', 'London', 'United Kingdom', 'GB', 'East Ferry Road', NULL, '224 East Ferry Road, London Borough of Tower Hamlets, E14, UK'),
('bb1351ebf58f0ec2549e70a628332596', -0.0132899999999836, 51.4871014, 'E14', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '8 Ferry Street, London Borough of Tower Hamlets, E14, UK'),
('bb59e4f574c63b9e061713f0e5dead4d', -0.0132029999999759, 51.487244, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('bb68d3fe6620484b9b73009a7fe47474', 2.31652320000001, 48.7888799, '92220', 'Bagneux', 'France', 'FR', 'Résidence du Port Galand', NULL, 'Résidence du Port Galand, 92220 Bagneux, Fran'),
('bc180dbc583491c00f8a1cd134f7517b', 0, 0, '', '', '', '', '', NULL, 'london'),
('bc41833a99884e4d8524c921a708884b', -0.0133134000000155, 51.4871537, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Ferry St', NULL, '19 Ferry St, Poplar, Londres E14 3, Royaume-U'),
('bd2a1a2a2263953269a08071b3f4254d', -0.0133189000000584, 51.4873576, 'E14', 'London', 'United Kingdom', 'GB', 'East Ferry Road', NULL, '224 East Ferry Road, London Borough of Tower Hamlets, E14, UK'),
('bd31ff782fcf862e8725823dac0bf320', -0.0133171999999604, 51.4873274, 'E14', 'London', 'United Kingdom', 'GB', 'East Ferry Road', NULL, '224 East Ferry Road, London Borough of Tower Hamlets, E14, UK'),
('bd3fe7132e6fb5084d34d651a25eaa64', 6.62648149999995, 46.5166557, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('bd475455d0da5e6f27dd37fed0ab1699', 0, 0, '', '', '', '', '', NULL, 'coiffeu'),
('bd8eb28b69a31a28d85f71a30a29a3cb', -0.0131794999999784, 51.4872459, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('bd90da3b7ef214d7db8e4063d2f23b09', 0, 0, '', '', '', '', '', NULL, 'c+'),
('be39a77d4471c80a52ae133680af6a3b', 0, 0, '', '', '', '', '', NULL, 'FATNE'),
('beba4ec6f22390735cf4f39572afe8b2', 0, 0, '', '', '', '', '', NULL, 'selim pous'),
('bf1715c9b687cccb2fec05afd9a24e6a', 0, 0, '', '', '', '', '', NULL, 'speciaa'),
('bf22a1d0acfca4af517e1417a80e92d1', 0, 0, '', '', '', '', '', NULL, 'fdg'),
('bf9017d04f72c1b5ba407971fbf61289', 0, 0, '', '', '', '', '', NULL, 'chang'),
('bfafd813d7ea65ee4db1f09d7c8ffbf4', 0, 0, '', '', '', '', '', NULL, 'console'),
('c041f6859c3d052345652f2bdff92e7a', 0, 0, '', '', '', '', '', NULL, 'wwew'),
('c0435c3c5d948bd5d9d2635e05732071', -0.0131907999999612, 51.487245, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('c12e01f2a13ff5587e1e9e4aedb8242d', 0, 0, '', '', '', '', '', NULL, 'sa'),
('c14405a94c63499d02662e798f910c23', 2.33261500000003, 48.833864, '75014', 'Paris', 'France', 'FR', '', NULL, 'Denfert-Rochereau, 75014 Paris, France'),
('c1f97fd1d06136d7a18c044b436566ea', -0.0122926000000234, 51.4873359, 'E14', 'London', 'United Kingdom', 'GB', 'Manchester Road', NULL, '80 Manchester Road, London Borough of Tower Hamlets, E14, UK'),
('c2477f223c3c4ca19a5029e0cd91fda8', 0, 0, '', '', '', '', '', NULL, 'cha'),
('c3aa06cabfff0b92bbe2014e4a84bba3', -0.0131910999999718, 51.487245, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('c3bf26db16183dd7bd0903b9def79bf3', 0, 0, '', '', '', '', '', NULL, 'zr'),
('c42de610f77abe047697ad3cc3cba0e3', 0, 0, '', '', '', '', '', NULL, 'salut les gars'),
('c480726a836d5b786c1f22d1b2c7d2c7', 0, 0, '', '', '', '', '', NULL, 'COIFFE'),
('c534ac35a7627def234016fb9549c852', 7.56529839999996, 46.9305476, '', 'Worb', 'Schweiz', 'CH', '', NULL, 'Worb, Schweiz'),
('c5a28f4b35a2884fa3277150ac5d0967', 0, 0, '', '', '', '', '', NULL, 'MOD'),
('c5d3e619937d3c3f8af300ce7c798ec6', 0, 0, '', '', '', '', '', NULL, 'coifu'),
('c5d6260e310a12b93ae2703b695fbb5c', 0, 0, '', '', '', '', '', NULL, 'SEL'),
('c6746b9e654affb188d414aa8c9864bb', 6.62645329999998, 46.5166618, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('c7118ecd9b05a4f9ac7ad82fa493c0c9', 0, 0, '', '', '', '', '', NULL, 'coiffu'),
('c7463795f8569241b24723661fdd0f8f', 0, 0, '', '', '', '', '', NULL, 'salu'),
('c793dee9bd4f6b084cb78b3a6590a48e', 6.6264443, 46.5166638, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('c7cc8b122b4074e8048023ec92d2abb7', 0, 0, '', '', '', '', '', NULL, 'virtu'),
('c7f86e8cf8f01309853411133e764fe9', 0, 0, '', '', '', '', '', NULL, 'bon'),
('c8a79c888a25005fc6266aadd96e3a11', 0, 0, '', '', '', '', '', NULL, 'speciaiao'),
('c8adf70451e1908dc7cd79bf93c103ce', 7.44744, 46.9481, '-', 'Bern', 'Switzerland', 'CH', '', NULL, ''),
('c90cf6392759b084567b8fd44eda247b', 0, 0, '', '', '', '', '', NULL, 'effreti'),
('c96041081de85714712a79319cb2be5f', 0, 0, '', '', '', '', '', NULL, 'hakim'),
('c9a1e864647d10569f013d1cf7a73e10', 6.62645939999993, 46.5166605, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('c9b6f8f5abef1f52dbe68debe18ce80d', 9.01696909999998, 51.7360867, '33014', 'Bad Driburg', 'Germany', 'DE', '', NULL, '33014 Bad Driburg, Germany'),
('c9fedf43460997594c3cd56c47cdd6ee', 0, 0, '', '', '', '', '', NULL, 'ber'),
('ca1b595f2f84b21398b359b4617b76c5', 0, 0, '', '', '', '', '', NULL, 'conso'),
('ca40a3662b665025ba2412ea641b13e9', -0.0132320000000163, 51.4872415, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('caf9b6b99962bf5c2264824231d7a40c', 0, 0, '', '', '', '', '', NULL, 'info'),
('cb08793c9cc6805b4203297ca6725a1b', 0, 0, '', '', '', '', '', NULL, 'pouse'),
('cb2e4722cf192db3523c59eff43b6450', 0, 0, '', '', '', '', '', NULL, 'drdr'),
('cb4d14cc8190d64b70ab60bc23a812da', 0, 0, '', '', '', '', '', NULL, 'zur'),
('cc2bd8f09bb88b5dd20f9b432631b8ca', 0, 0, '', '', '', '', '', NULL, 'sdsd'),
('cc5e06b8c15ff0eb65fba33198f510f5', 2.35222190000002, 48.856614, '', 'Paris', 'France', 'FR', '', NULL, 'Paris, France'),
('cc8c0a97c2dfcd73caff160b65aa39e2', 0, 0, '', '', '', '', '', NULL, 'az'),
('cc91e646ffef196e61f25dce2ada9ae5', 0, 0, '', '', '', '', '', NULL, 'spa'),
('ccbee73cd81c7f42405e1920409247ec', 0, 0, '', '', '', '', '', NULL, 'paris'),
('ccde7ca690cc5f27a006853a6e947981', 10.6333333, 35.8333333, '', 'Sousse', 'Tunisia', 'TN', '', NULL, 'Sousse, Tunisia'),
('ce217db9d214528164ff6ac89065e10b', 0, 0, '', '', '', '', '', NULL, 'angem'),
('ceaaf344427537ca0d8f1dbd83dcb44b', 0, 0, '', '', '', '', '', NULL, 'FA'),
('cec60bf8a867045fad0a6e9b142e224b', 6.62647240000001, 46.5166577, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('cefb8e5bbc6f4a13eb045d57939332af', -0.0132905000000392, 51.4871036, 'E14', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '8 Ferry Street, London Borough of Tower Hamlets, E14, UK'),
('cefd573c75ef3e8eee5ae1ffe4243497', 0, 0, '', '', '', '', '', NULL, 'shi'),
('cf297e613a7f7892a3bf348ee526abad', 0, 0, '', '', '', '', '', NULL, 'ddj'),
('cf3de2c8147c2d376d613bd654b9a458', -0.0132393999999749, 51.4872409, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('d005876357a19b75b53aaed20a85680b', -0.0133178999999473, 51.4873401, 'E14', 'London', 'United Kingdom', 'GB', 'East Ferry Road', NULL, '224 East Ferry Road, London Borough of Tower Hamlets, E14, UK'),
('d0091378d6b97279218e2c037ea2e710', 6.62650229999997, 46.5166511, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('d0201c3b09d2cc34b18486d32b2f99a2', 6.62649680000004, 46.5166523, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('d0c70b95543473398798959e0bbed884', 0, 0, '', '', '', '', '', NULL, 'udfd'),
('d0fa06cd93335c8cae357ffe5cd1c4e9', 0, 0, '', '', '', '', '', NULL, 'lk'),
('d0fa644bf6f985bf21fa53b9b457a3c6', 0, 0, '', '', '', '', '', NULL, 'bej'),
('d1a6e761b90f4fa6003280983e00c0fa', 0, 0, '', '', '', '', '', NULL, 'Maste'),
('d224291756293618a18dc4e7b97db381', 0, 0, '', '', '', '', '', NULL, 'informati'),
('d22dc2f89729f57e53d0c40816650902', 0, 0, '', '', '', '', '', NULL, 'angement'),
('d28077e9520003b29d012171b41eadc3', -0.0132042000000183, 51.4872439, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('d29b95c2a54d407b2eaa6c1c016f54eb', 0, 0, '', '', '', '', '', NULL, 'virtual jo'),
('d2c75a26973a1888f241125717b166cf', 0, 0, '', '', '', '', '', NULL, 'mobi'),
('d2feb2b7f896a0addb35d9ee5a775d4d', 0, 0, '', '', '', '', '', NULL, 'hotm'),
('d35aae4005101968b4eb309829a69b2e', 0, 0, '', '', '', '', '', NULL, 'lkds'),
('d3b37b2468cc601625328e63dd228e58', 0, 0, '', '', '', '', '', NULL, 'béjo'),
('d3fd8f303df6429318204e258f184ff9', 0, 0, '', '', '', '', '', NULL, 'souss'),
('d41d8cd98f00b204e9800998ecf8427e', 0, 0, '', '', '', '', '', NULL, ''),
('d4576b3b305e1df6f8ef4517ec2f9615', 0, 0, '', '', '', '', '', NULL, 'ssd'),
('d4579b2688d675235f402f6b4b43bcbf', 0, 0, '', '', '', '', '', NULL, 'do'),
('d46ce9f7f82d10c59bafe9ef403ac65f', 6.6264774, 46.5166565, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('d47fdc511d5080316ca1c61b5ffdc9db', 6.6264142, 46.5166704, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('d4a478b8e5029dfef514e12203bdaeb6', 0, 0, '', '', '', '', '', NULL, 'totit'),
('d4b2758da0205c1e0aa9512cd188002a', 0, 0, '', '', '', '', '', NULL, 'dsf'),
('d4c01b1d3471a1b41ad485918d2298cb', 0, 0, '', '', '', '', '', NULL, 'bejo'),
('d4f917633649a3c47c7ab917fa990146', 0, 0, '', '', '', '', '', NULL, 'ne'),
('d53eb3659fd6885d81c327f6e9a449a1', 0, 0, '', '', '', '', '', NULL, 'effret'),
('d58e3582afa99040e27b92b13c8f2280', 0, 0, '', '', '', '', '', NULL, 'sdfsdf'),
('d5d630d4355544115ee3ade77a6141ee', 0, 0, '', '', '', '', '', NULL, 'hotmail'),
('d60437a5e87f5c143b415c6ea7df15e6', 0, 0, '', '', '', '', '', NULL, 'ahmad ga'),
('d696cd382bd1441771a4a5ec5a5441ce', 6.62648560000002, 46.5166547, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('d6c94b3266593fdce73ac90d9eeeff0f', 0, 0, '', '', '', '', '', NULL, 'ddsf'),
('d6e1c05c8a81c2ae74c7aedea5ec92c1', 0, 0, '', '', '', '', '', NULL, 'poi'),
('d76b086c43f3d15f267c0a899c8b8877', 8.53532540000003, 47.3817911, '', 'District de Zurich', 'Suisse', 'CH', '', NULL, 'District de Zurich Suisse'),
('d7859e67d644fd959b797af82848a11d', 12.4942486, 41.8905198, '', 'Rom', 'Italien', 'IT', '', NULL, 'Rom, Italien'),
('d7aae5c60b38f13b28041357e25438fb', 6.28646739999999, 46.6389382, '', '', 'Schweiz', 'CH', '', NULL, 'Lac de Joux, Schweiz'),
('d7ad286391027c47ab4c3dd088db1d6b', 6.62645989999999, 46.5166604, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('d7c452e8a32fb7bf4f7371a279e783d5', 0, 0, '', '', '', '', '', NULL, 'specialo'),
('d83c2285ff40997398e4d7feaf49e0aa', 0, 0, '', '', '', '', '', NULL, 'FATN'),
('d88fc6edf21ea464d35ff76288b84103', 0, 0, '', '', '', '', '', NULL, 'ch'),
('d8dc47744387478fa6daf4705c788feb', 6.62646300000006, 46.5166597, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('d90ee789bc512f0d7edbdf8a881e8f10', 0, 0, '', '', '', '', '', NULL, 'FATEN'),
('d9729feb74992cc3482b350163a1a010', 0, 0, '', '', '', '', '', NULL, 'sdf'),
('d9d7dbddc29177b121a6aa1bb09d15fd', 0, 0, '', '', '', '', '', NULL, 'bab'),
('d9e1803aceaacf991e595a5472b41174', 8.50167, 47.5587, '-', 'Glattfelden', 'Switzerland', 'CH', '', NULL, ''),
('da210c2e58649a7852c1e9884adb0efe', 0, 0, '', '', '', '', '', NULL, 'dfhsd'),
('daedc925bf2d7751d972300635f6d076', 0, 0, '', '', '', '', '', NULL, 'sdsdsdssds'),
('db109db005bf4bba5f812414f9962b0d', 0, 0, '', '', '', '', '', NULL, 'pousee'),
('db4893abea0f7d55c775dd7c0cfc09de', 0, 0, '', '', '', '', '', NULL, 'sdsdsdssd'),
('db76a112f4c1019996f0d124fa60d4ee', -0.0132002999999941, 51.4872442, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('db8857b420665169e36ad60c8dfc23a5', 0, 0, '', '', '', '', '', NULL, 'virtual'),
('dc2c08544983fca22df1f77ccf2e73f5', -0.0133173000000397, 51.4873295, 'E14', 'London', 'United Kingdom', 'GB', 'East Ferry Road', NULL, '224 East Ferry Road, London Borough of Tower Hamlets, E14, UK'),
('dc87fc79575d5c3430f4b05347540df1', -0.0133021999999983, 51.4871678, 'E14', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '8 Ferry Street, London Borough of Tower Hamlets, E14, UK'),
('dcf01249263bab1e2bb7c5c267dee1f5', 0, 0, '', '', '', '', '', NULL, 'coif'),
('dd03dc1a0d28ab7d82eef2cc13f6bb35', 6.6264784, 46.5166563, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('dd07de8561395a7c37f8fcc1752d45e1', 0, 0, '', '', '', '', '', NULL, 'pe'),
('ddfc6035985ae134c1d5e9db6ddf4e6d', -0.0131805999999415, 51.4872458, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('df3f079de6961496f0460dcfdbf9bca3', 0, 0, '', '', '', '', '', NULL, 'by'),
('df8341cdaf8419ff6ef4779cc970d24b', -0.1262362, 51.5001524, '', 'London', 'United Kingdom', 'GB', '', NULL, 'Westminster, London, UK'),
('dfa62860eda56a82771f5ee45887526f', 6.6264582, 46.5166607, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('dfb3ff383b6a9339d0cf228447df8d62', -0.0132922999999892, 51.4871114, 'E14', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '8 Ferry Street, London Borough of Tower Hamlets, E14, UK'),
('dfcaa537a779db79ec8cc56768bd1120', -0.0133170000000291, 51.4873236, 'E14', 'London', 'United Kingdom', 'GB', 'East Ferry Road', NULL, '224 East Ferry Road, London Borough of Tower Hamlets, E14, UK'),
('dfd538bdad9cce5a90716eb0317b127a', 0, 0, '', '', '', '', '', NULL, 'dfhs'),
('e00fba6fedfb8a49e13346f7099a23fc', 0, 0, '', '', '', '', '', NULL, 'ti'),
('e023bb6fbc685ef73eac2e917942e8e1', -0.0131671000000324, 51.487247, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('e08a6b32071bc38a8432496aba6195f6', 0, 0, '', '', '', '', '', NULL, 'new ch'),
('e110fb45bc4f7cc5d367b06bfbc8e5c3', 0, 0, '', '', '', '', '', NULL, 'qwqw'),
('e113a38355ed45892a2d3b2d385c48f2', 0, 0, '', '', '', '', '', NULL, 'nne'),
('e165d4f2174b66a7d1a95cb204d296eb', 0, 0, '', '', '', '', '', NULL, 'france'),
('e1a929093aed4308da31b13481bb8644', 0, 0, '', '', '', '', '', NULL, 'zürich'),
('e1bcc47786bf69f085b15becba52bd15', 0, 0, '', '', '', '', '', NULL, 'zoubi'),
('e1d1e52efff6a41554db6eafd7f7123e', 8.70689909999999, 57.0686458, '7730', 'Hanstholm', 'Denmark', 'DK', '', NULL, 'Thisted Airport (TED), 7730 Hanstholm, Denmar'),
('e2203d735b01fce50df9b55c8c7ce7d8', 10.63875, 35.8329809, '', 'Sousse', 'Tunisie', 'TN', '', NULL, 'Sousse, Tunisie'),
('e22930fc99fa340efe01b81f1d49cc02', -0.0133173000000397, 51.4873288, 'E14', 'London', 'United Kingdom', 'GB', 'East Ferry Road', NULL, '224 East Ferry Road, London Borough of Tower Hamlets, E14, UK'),
('e2a81396d93f6d7a1c0e7bdb5f791e62', 7.44815, 46.948, '-', 'Berne', 'Switzerland', 'CH', '', NULL, ''),
('e2d215a2b9fbfa6518b1a9d06fa27b26', 2.30734489999998, 48.780691, '92330', 'Sceaux', 'France', 'FR', 'Rue de la Marne', NULL, '47 Rue de la Marne, 92330 Sceaux, France'),
('e358efa489f58062f10dd7316b65649e', 0, 0, '', '', '', '', '', NULL, 't'),
('e37d1f0276193bd2b58ecf43f816e117', 0, 0, '', '', '', '', '', NULL, 'consol'),
('e3de3ec3324fed81c73e0585c43e1138', 0, 0, '', '', '', '', '', NULL, 'slein'),
('e41b1049214f05ae40add8ddd58ad347', 8.5391825, 47.3686498, '', 'Zurich', 'Switzerland', 'CH', '', NULL, 'Zurich, Switzerland'),
('e4557e8ebc120a051393bbe394915621', -0.0133134000000155, 51.4871535, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Ferry St', NULL, '19 Ferry St, Poplar, Londres E14 3, Royaume-U'),
('e5dc7812c2dc7ca4fb5c57687d66c35e', 0, 0, '', '', '', '', '', NULL, 'ahmad gabri'),
('e699d74eb2f54beec6a0d79674f0ff27', 6.62648669999999, 46.5166545, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('e69bc3a931c6d64a5b7e169bad7cf654', 6.62646089999998, 46.5166602, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('e6d43314727e3a872d1abcacb0e795e7', 0, 0, '', '', '', '', '', NULL, 'ahmad geb'),
('e7880f4be5b280cb33e4148d01e10192', 0, 0, '', '', '', '', '', NULL, 'ange'),
('e7be7f20cb84de057a6f144193c7f772', 37.6176330000001, 55.755786, '', 'Moskau', 'Russland', 'RU', '', NULL, 'Moskau, ????? ??????, Russland'),
('e8d3e02425a244530468ed7c81acd829', 5.37169760000006, 43.3087193, '13003', 'Marseilles', 'Frankreich', 'FR', 'Rue Lanthier', NULL, 'Hamadi Zoubida, 16 Rue Lanthier, 13003 Marsei'),
('e983173cb8dcefe876f9c70dcbd9b4a7', 0, 0, '', '', '', '', '', NULL, '>ME<'),
('eab71244afb687f16d8c4f5ee9d6ef0e', 0, 0, '', '', '', '', '', NULL, 'nn'),
('ead731c1b50267a7bed51b13b3506a34', 0, 0, '', '', '', '', '', NULL, 'virtua'),
('eb0459bfce4185888ecf61fb07987581', 0, 0, '', '', '', '', '', NULL, 'MO'),
('eb232b363238f52fa21f8bf7d57aab43', 0, 0, '', '', '', '', '', NULL, 'pou'),
('eb642ff24fd55bbc1aa3b89975bf5241', 0, 0, '', '', '', '', '', NULL, 'wkewf'),
('eb6e026b0ad8fcb99abb3d209e9536f6', -0.0131880000000137, 51.4872452, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('eba330c720ba08dca60f5723ba15c125', 2.31584169999996, 48.7889735, '92220', 'Bagneux', 'France', 'FR', 'Rue du Port Galand', NULL, '1 Rue du Port Galand, 92220 Bagneux, France'),
('ebd4db804c8b8acf78846a7beb06ff57', 10.1663063999999, 36.8193488, '', 'Gouvernorat de Tunis', 'Tunisie', 'TN', 'Rue Mouaouia Ibn Houdaij', NULL, 'Rue Mouaouia Ibn Houdaij, Gouvernorat de Tuni'),
('ec058c2f364b88af54daa4212cc66439', 8.55000250000001, 47.367347, '', 'Zürich', 'Schweiz', 'CH', '', NULL, 'Zürich, Schweiz'),
('ec0613768bddca7dd4c875c049970234', 0, 0, '', '', '', '', '', NULL, 'je suis ce que'),
('ec19891d7a140fd75a6cdb4989e0dd41', 6.62645859999998, 46.5166607, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('ec9c7ad879d51c22d917f2b77be4c800', 0, 0, '', '', '', '', '', NULL, 'effr'),
('ed5c597bc35dae77d04ce30ba774c990', 12.6983522, 41.9037527, '00132', 'Rome', 'Italy', 'IT', 'Via Sante Marie', NULL, 'Via Sante Marie, 00132 Rome, Italy'),
('ed75f7fe635f2b999cdc69a8da723b9d', 0, 0, '', '', '', '', '', NULL, 'specialone'),
('edbe43326e09fc41597c23863d442937', 6.62648530000001, 46.5166548, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('ee79c921e4b2b8dd053ba8745a9bce08', 6.62648020000006, 46.5166559, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('ee7b630995e7a36b6420696989441e2d', 0, 0, '', '', '', '', '', NULL, 'inf'),
('eeaa78e0b07d543e9adf81312e611fad', 6.62646440000003, 46.5166594, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('eec38a6d10735a91d1247a80b5e213a6', 0, 0, '', '', '', '', '', NULL, 'cons'),
('eeea18d9e4f6beb6d105e1ce56e62830', -0.0132194000000254, 51.4872426, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Manchester Rd', NULL, '2-74 Manchester Rd, Poplar, Londres E14 3, Ro'),
('ef1cb6e72d149b184cc241037203f60b', 0, 0, '', '', '', '', '', NULL, 'fk'),
('ef2eba38320b8a74c7ca0edacf5b8200', 0, 0, '', '', '', '', '', NULL, 'ahmad gab'),
('efad7abb323e3d4016284c8a6da076a1', 0, 0, '', '', '', '', '', NULL, 'se'),
('eff7d5dba32b4da32d9a67a519434d3f', 0, 0, '', '', '', '', '', NULL, 'df'),
('f003c44deab679aa2edfaff864c77402', 0, 0, '', '', '', '', '', NULL, 'SE'),
('f0097575b83ed7d572554a791f9c25c1', 2.35606940000002, 48.86621, '75003', 'Paris', 'France', 'FR', 'Rue Vaucanson', NULL, '5 Rue Vaucanson, 75003 Paris, France'),
('f01d198551e75d0985e58c465b739e57', 8.69573360000004, 47.4277275, '8307', 'Effretikon', 'Switzerland', 'CH', 'Quellenstrasse', NULL, 'Quellenstrasse 4, 8307 Effretikon, Switzerland'),
('f02368945726d5fc2a14eb576f7276c0', 0, 0, '', '', '', '', '', NULL, 'bonjour'),
('f03bde11d261f185cbacfa32c1c6538c', 0, 0, '', '', '', '', '', NULL, 'Master'),
('f04ee461abcdcd63b91215f836d877d1', 0, 0, '', '', '', '', '', NULL, 'adsa'),
('f059097d60ffa8eaa4d19bdf10005a72', 2.16397699999993, 48.696893, '', 'Bures-sur-Yvette', 'France', 'FR', '', NULL, 'Bures-sur-Yvette, France'),
('f0d67af14e4a846bf21b6b9d60aee973', -0.0133089999999356, 51.4871365, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Ferry St', NULL, '19-25 Ferry St, Poplar, Londres E14 3, Royaum'),
('f10b82b06b692c3caec3d0c4a625bb3d', 2.35606380000002, 48.8662011, '75003', 'Paris', 'France', 'FR', 'Rue Vaucanson', NULL, '5 Rue Vaucanson, 75003 Paris, France'),
('f148706390f82e8c19a659a2a2be2bf2', 2.31002000000001, 48.796696, '', 'Bagneux', 'France', 'FR', '', NULL, 'Bagneux, France'),
('f16b4d23206e42575e9bd347ebf9ffdf', 2.35611429999994, 48.8662805, '75003', 'Paris', 'France', 'FR', 'Rue Vaucanson', NULL, '5 Rue Vaucanson, 75003 Paris, France'),
('f2a7e899b5af7365d70d252f3fd387dd', 0, 0, '', '', '', '', '', NULL, 'gfd'),
('f2cd7d3cd57c9769a3336b4aa3c57dcb', 0, 0, '', '', '', '', '', NULL, 'windo'),
('f31a81e91afdcf0b84dfee82ec2fb196', 0, 0, '', '', '', '', '', NULL, 'sdfd'),
('f359bdeb202a6041df62b234953cb897', 0, 0, '', '', '', '', '', NULL, 'selim pouss'),
('f3d9b6b6edb554b7d0d5e37e86e686ab', 0, 0, '', '', '', '', '', NULL, 'bonjour t'),
('f445e0417d46b3561ff4dd4fdf3bb83b', 0, 0, '', '', '', '', '', NULL, 'speci'),
('f48ac822376a54dbe8667a5b3a649058', 0, 0, '', '', '', '', '', NULL, 'selim'),
('f50c302a1a8debe65114240c4c4ef4ff', -0.0133181999999579, 51.4873445, 'E14', 'London', 'United Kingdom', 'GB', 'East Ferry Road', NULL, '224 East Ferry Road, London Borough of Tower Hamlets, E14, UK'),
('f521d6fd57ec97e4fae7ae5be85ba537', 6.62646580000001, 46.5166591, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('f56b40bdf2b86db78078763f873622a3', 12.69866, 41.9040543, '00132', 'Rome', 'Italy', 'IT', 'Via Sante Marie', NULL, 'Via Sante Marie, 00132 Rome, Italy'),
('f5f6de19cb14519cc29ecb2695feb61e', -0.0119627000000264, 51.4872826, 'E14', 'Poplar', 'Royaume-Uni', 'GB', '', NULL, 'Tower Hamlets, Londres E14 3BE, Royaume-Uni'),
('f5f942a3dab358445e8ea21e262b9b22', -0.0133171999999604, 51.4873273, 'E14', 'London', 'United Kingdom', 'GB', 'East Ferry Road', NULL, '224 East Ferry Road, London Borough of Tower Hamlets, E14, UK'),
('f6122c971aeb03476bf01623b09ddfd4', 0, 0, '', '', '', '', '', NULL, 'po'),
('f631d031b0f2cd369d3ba6ce20eeb910', 0, 0, '', '', '', '', '', NULL, 'selim po'),
('f68de34abe87aeb901a8c98b891f3be3', 0, 0, '', '', '', '', '', NULL, 'effretiko'),
('f69e83f278f07765a4bebae3bcebd4ac', 2.35927900000002, 48.792716, '', 'Villejuif', 'France', 'FR', '', NULL, 'Villejuif, France'),
('f6cb2deae9f057d287e4b500ce2fffe7', -0.0130641000000651, 51.4872451, 'E14', 'London', 'United Kingdom', 'GB', 'Manchester Rd', NULL, '80 Manchester Rd, London Borough of Tower Hamlets, E14, UK'),
('f71dbe52628a3f83a77ab494817525c6', 0, 0, '', '', '', '', '', NULL, 'toto'),
('f81e986ee4c9f80d6002bf5302b3ea87', 0, 0, '', '', '', '', '', NULL, 'che'),
('f83396c814362a599264e7e2837d10a6', -0.0133140000000367, 51.4871559, 'E14 3', 'Poplar', 'Royaume-Uni', 'GB', 'Ferry St', NULL, '19 Ferry St, Poplar, Londres E14 3, Royaume-U'),
('f882ad0673883d11d0deb5892837d50a', 6.62647600000003, 46.5166569, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('f8878bbc26688db088d833a89ee6235a', 8.5353254, 47.3817911, '', 'Zurich', 'Switzerland', 'CH', '', NULL, 'ZÃ¼rich District, Switzerland'),
('f8cb9cacc277da91877140ab6d5a873d', 0, 0, '', '', '', '', '', NULL, 'wwewe'),
('f8e5724555a217ceb479ae5628185059', -0.0133012999999664, 51.4870698, 'E14 3DT', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '19 Ferry Street, London, Greater London E14 3DT, UK'),
('f970e2767d0cfe75876ea857f92e319b', 0, 0, '', '', '', '', '', NULL, 'as'),
('f9945d1f15157214a536babdacced070', -0.013317700000016, 51.487337, 'E14', 'London', 'United Kingdom', 'GB', 'East Ferry Road', NULL, '224 East Ferry Road, London Borough of Tower Hamlets, E14, UK'),
('f9da1723e6fd4c585e0fd54d2dd140c1', 0, 0, '', '', '', '', '', NULL, 'selim pousse'),
('fa5177f0e75022538d2fc0e73b977f68', -0.753280899999936, 39.4840108, '', '', 'Spanien', 'ES', '', NULL, 'Provinz Valencia, Spanien'),
('fafb775433f845faaa405bc0e4013288', 6.62633970000002, 46.5165772, '1006', 'Lausanne', 'Schweiz', 'CH', 'Avenue William-Fraisse', NULL, 'Avenue William-Fraisse 1, 1006 Lausanne, Schw'),
('fb1eaf2bd9f2a7013602be235c305e7a', 0, 0, '', '', '', '', '', NULL, 'kim'),
('fb2429584d982a07b3461d2fc3d1458f', 0, 0, '', '', '', '', '', NULL, 'vali'),
('fb4acdb12dcdfaca1902445d59d3e8fe', 0, 0, '', '', '', '', '', NULL, 'zoubeida'),
('fbade9e36a3f36d3d676c1b808451dd7', 0, 0, '', '', '', '', '', NULL, 'z'),
('fbc505fdd41323244f77012f44549af1', 38.7683024, 0, '', '', 'Russian Federation', 'RU', '', NULL, 'Lake Lacha'),
('fc4e538768663a15c58b38d3f0017ca6', 2.30740630000003, 48.7806791, '92330', 'Sceaux', 'France', 'FR', 'Rue de la Marne', NULL, '47 Rue de la Marne, 92330 Sceaux, France'),
('fc7082657b4c0a08b6af159fda641af7', 6.62645229999998, 46.516662, '1006', 'Lausanne', 'Schweiz', 'CH', 'Rue du Simplon', NULL, 'Rue du Simplon 47, 1006 Lausanne, Schweiz'),
('fd07267cfd151e141d685d4e4da17794', 0, 0, '', '', '', '', '', NULL, 'zoubei'),
('fe8bd275abb1d26445d25734d35e13e6', 7.44459589999997, 46.9479793, '3011', 'Berne', 'Switzerland', 'CH', 'Marktgasse', NULL, 'Marktgasse 55, 3011 Berne, Switzerland'),
('feb78cc258bdc76867354f01c22dbe43', 0, 0, '', '', '', '', '', NULL, 'ef'),
('fed244bc2b5eabf19ab462ae631c3e7a', -0.0132922000000235, 51.4871108, 'E14', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '8 Ferry Street, London Borough of Tower Hamlets, E14, UK'),
('ff1ccf57e98c817df1efcd9fe44a8aeb', 0, 0, '', '', '', '', '', NULL, 'we'),
('ff3a041881020878b54fd94cbb554568', 0, 0, '', '', '', '', '', NULL, 'vil'),
('ff8919e4dd5870a1fe17d6df58f3cd44', -0.0133018999999877, 51.4871665, 'E14', 'London', 'United Kingdom', 'GB', 'Ferry Street', NULL, '8 Ferry Street, London Borough of Tower Hamlets, E14, UK'),
('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', 0, 0, '', '', '', '', '', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id_tag` varchar(32) NOT NULL,
  `id_parent_tag` varchar(32) DEFAULT NULL,
  `type_tag` enum('skill','degree','service','personality','other') NOT NULL DEFAULT 'other',
  `title_tag` varchar(50) NOT NULL,
  `lang_tag` varchar(2) NOT NULL DEFAULT 'fr',
  `order_tag` int(11) DEFAULT '0',
  `deleted_tag` int(1) DEFAULT '0',
  PRIMARY KEY (`id_tag`,`lang_tag`),
  KEY `title_tag` (`title_tag`),
  KEY `id_parent_tag` (`id_parent_tag`,`type_tag`),
  KEY `type_tag` (`type_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id_tag`, `id_parent_tag`, `type_tag`, `title_tag`, `lang_tag`, `order_tag`, `deleted_tag`) VALUES
('1a37c93c4d000ea63255147931bbc233', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Electrical work', 'en', 3, 0),
('1a37c93c4d000ea63255147931bbc233', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Electricité', 'fr', 3, 0),
('27936cd368c9748649022b4e04cbd4f2', 'd2ffb970ba1b3700f8ea9baa32bffd74', 'service', 'Cleaning', 'en', 1, 0),
('27936cd368c9748649022b4e04cbd4f2', 'd2ffb970ba1b3700f8ea9baa32bffd74', 'service', 'Nettoyage', 'fr', 1, 0),
('2975beb12d5230722d41c4ded4a9c889', '49aea376bb5a51fa034d8963e2ea815d', 'service', 'Moving', 'en', 1, 0),
('2975beb12d5230722d41c4ded4a9c889', '49aea376bb5a51fa034d8963e2ea815d', 'service', 'Transport biens', 'fr', 1, 0),
('37936cd368c9748649022b4e04cbd4f2', 'd2ffb970ba1b3700f8ea9baa32bffd74', 'service', 'Washing', 'en', 2, 0),
('37936cd368c9748649022b4e04cbd4f2', 'd2ffb970ba1b3700f8ea9baa32bffd74', 'service', 'Lavage', 'fr', 2, 0),
('44802920f148815df53cf900297fda72', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Woodwork', 'en', 4, 0),
('44802920f148815df53cf900297fda72', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Menuiserie', 'fr', 4, 0),
('46f149a7a0e47d2c8d02b9c76d07873c', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Decoration', 'en', 9, 0),
('46f149a7a0e47d2c8d02b9c76d07873c', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Décoration', 'fr', 9, 0),
('46f149a7a0e47d2c8d02b9c76d07873e', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Sewing', 'en', 10, 0),
('46f149a7a0e47d2c8d02b9c76d07873e', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Couture', 'fr', 10, 0),
('47936cd368c9748649022b4e04cbd4f2', 'd2ffb970ba1b3700f8ea9baa32bffd74', 'service', 'Ironing', 'en', 3, 0),
('47936cd368c9748649022b4e04cbd4f2', 'd2ffb970ba1b3700f8ea9baa32bffd74', 'service', 'Repassage', 'fr', 3, 0),
('49aea376bb5a51fa034d8963e2ea815d', NULL, 'service', 'Mobility', 'en', 7, 0),
('49aea376bb5a51fa034d8963e2ea815d', NULL, 'service', 'Mobilité', 'fr', 7, 0),
('4a6d13d111d321b7968d2cde64eb0986', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Building work', 'en', 2, 0),
('4a6d13d111d321b7968d2cde64eb0986', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Construction', 'fr', 2, 0),
('4b5a841bfcf00950657b827d6eb6f9af', '9657daa44260bb346d8baaed5f865607', 'service', 'Device', 'en', 4, 0),
('4b5a841bfcf00950657b827d6eb6f9af', '9657daa44260bb346d8baaed5f865607', 'service', 'Appareil', 'fr', 4, 0),
('4f1c6a961dec28865c792b5b2514120c', NULL, 'service', 'Beauty', 'en', 4, 0),
('4f1c6a961dec28865c792b5b2514120c', NULL, 'service', 'Entretien & Beauté', 'fr', 4, 0),
('4f423aa5c8dbeb87377805c80ec52772', '4f1c6a961dec28865c792b5b2514120c', 'service', 'Body care', 'en', 1, 0),
('4f423aa5c8dbeb87377805c80ec52772', '4f1c6a961dec28865c792b5b2514120c', 'service', 'Soin du corps', 'fr', 1, 0),
('59aea376bb5a51fa034d8963e2ea815d', NULL, 'personality', 'Relational feature', 'en', 1, 0),
('59aea376bb5a51fa034d8963e2ea815d', NULL, 'personality', 'Trait relationel', 'fr', 1, 0),
('5e1c6a961dec28865c792b5b2514120c', NULL, 'service', 'Food & Dining', 'en', 5, 0),
('5e1c6a961dec28865c792b5b2514120c', NULL, 'service', 'Alimentation', 'fr', 5, 0),
('5f1c6a961dec28865c792b5b2514120c', NULL, 'personality', 'Practice feature', 'en', 2, 0),
('5f1c6a961dec28865c792b5b2514120c', NULL, 'personality', 'Trait pratique', 'fr', 2, 0),
('671c9eca7f36118e0e336a9def3fdee0', NULL, 'service', 'Technical & Manual work', 'en', 1, 0),
('671c9eca7f36118e0e336a9def3fdee0', NULL, 'service', 'Travail Technique & Manuel', 'fr', 1, 0),
('6aed04e0205cd728549b730a49eabb02', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Plombing', 'en', 7, 0),
('6aed04e0205cd728549b730a49eabb02', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Plomberie', 'fr', 7, 0),
('6c9cb0273e586fc0b513fe63a706ea01', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Assembly', 'en', 5, 0),
('6c9cb0273e586fc0b513fe63a706ea01', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Montage', 'fr', 5, 0),
('9657daa44260bb346d8baaed5f865606', NULL, 'service', 'Keeping & Assistance', 'en', 3, 0),
('9657daa44260bb346d8baaed5f865606', NULL, 'service', 'Garde & Assistance', 'fr', 3, 0),
('9657daa44260bb346d8baaed5f865607', NULL, 'service', 'Repair', 'en', 6, 0),
('9657daa44260bb346d8baaed5f865607', NULL, 'service', 'Réparation', 'fr', 6, 0),
('9c84b22c3b0b033c5f7afe89b1789bad', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Painting', 'en', 6, 0),
('9c84b22c3b0b033c5f7afe89b1789bad', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Peinture', 'fr', 6, 0),
('a1ae798de07d71156d4a55d1ca422a0f', '9657daa44260bb346d8baaed5f865607', 'service', 'Car', 'en', 1, 0),
('a1ae798de07d71156d4a55d1ca422a0f', '9657daa44260bb346d8baaed5f865607', 'service', 'Auto', 'fr', 1, 0),
('b1ae798de07d71156d4a55d1ca422a0f', '9657daa44260bb346d8baaed5f865607', 'service', 'Motorbike', 'en', 2, 0),
('b1ae798de07d71156d4a55d1ca422a0f', '9657daa44260bb346d8baaed5f865607', 'service', 'Moto', 'fr', 2, 0),
('b565159e4697c29c630c41b1293c0633', '5e1c6a961dec28865c792b5b2514120c', 'service', 'Pastry', 'en', 2, 0),
('b565159e4697c29c630c41b1293c0633', '5e1c6a961dec28865c792b5b2514120c', 'service', 'Patisserie', 'fr', 2, 0),
('b565159e4697c29c630c41b1293c063c', '9657daa44260bb346d8baaed5f865606', 'service', 'Nanny', 'en', 2, 0),
('b565159e4697c29c630c41b1293c063c', '9657daa44260bb346d8baaed5f865606', 'service', 'Nounou', 'fr', 2, 0),
('c1ae798de07d71156d4a55d1ca422a0f', '9657daa44260bb346d8baaed5f865607', 'service', 'Bicycle', 'en', 3, 0),
('c1ae798de07d71156d4a55d1ca422a0f', '9657daa44260bb346d8baaed5f865607', 'service', 'Vélo', 'fr', 3, 0),
('c522a59862309cc5dea2f3e8349d8a3f', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'DYS', 'en', 1, 0),
('c522a59862309cc5dea2f3e8349d8a3f', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Bricolage', 'fr', 1, 0),
('c565159e4697c29c630c41b1293c0633', '5e1c6a961dec28865c792b5b2514120c', 'service', 'Cooking', 'en', 1, 0),
('c565159e4697c29c630c41b1293c0633', '5e1c6a961dec28865c792b5b2514120c', 'service', 'Cuisine', 'fr', 1, 0),
('c565159e4697c29c630c41b1293c063c', '9657daa44260bb346d8baaed5f865606', 'service', 'Baby-sitting', 'en', 1, 0),
('c565159e4697c29c630c41b1293c063c', '9657daa44260bb346d8baaed5f865606', 'service', 'Baby-sitting', 'fr', 1, 0),
('d27f7bd17e303ff756d721803a91e98f', '4f1c6a961dec28865c792b5b2514120c', 'service', 'Makeup', 'en', 3, 0),
('d27f7bd17e303ff756d721803a91e98f', '4f1c6a961dec28865c792b5b2514120c', 'service', 'Maquillage', 'fr', 3, 0),
('d2ffb970ba1b3700f8ea9baa32bffd74', NULL, 'service', 'Housekeeping & Laundry', 'en', 2, 0),
('d2ffb970ba1b3700f8ea9baa32bffd74', NULL, 'service', 'Ménage & Linge', 'fr', 2, 0),
('d522a59862309cc5dea2f3e8349d8a3f', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Gardening', 'en', 8, 0),
('d522a59862309cc5dea2f3e8349d8a3f', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Jardinage', 'fr', 8, 0),
('e410d9b44ebf8d8f7135bcc21a07ed48', '4f1c6a961dec28865c792b5b2514120c', 'service', 'Hair', 'en', 2, 0),
('e410d9b44ebf8d8f7135bcc21a07ed48', '4f1c6a961dec28865c792b5b2514120c', 'service', 'Coiffure', 'fr', 2, 0),
('fd9bd79b93a8fd84e1d3ce1956092be0', '9657daa44260bb346d8baaed5f865606', 'service', 'Support to Individuals', 'en', 3, 0),
('fd9bd79b93a8fd84e1d3ce1956092be0', '9657daa44260bb346d8baaed5f865606', 'service', 'Assistance Personne', 'fr', 3, 0),
('fd9bd79b93a8fd84e1d3ce1956092be1', '9657daa44260bb346d8baaed5f865606', 'service', 'Keeping of pets', 'en', 4, 0),
('fd9bd79b93a8fd84e1d3ce1956092be1', '9657daa44260bb346d8baaed5f865606', 'service', 'Garde animaux', 'fr', 4, 0),
('fd9bd79b93a8fd84e1d3ce1956092be3', '5e1c6a961dec28865c792b5b2514120c', 'service', 'Balenced nutrition', 'en', 3, 0),
('fd9bd79b93a8fd84e1d3ce1956092be3', '5e1c6a961dec28865c792b5b2514120c', 'service', 'Nutrition équilibrée', 'fr', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tag_act`
--

CREATE TABLE `tag_act` (
  `id_act_tagact` varchar(32) NOT NULL,
  `id_tag_tagact` varchar(32) NOT NULL,
  `profil_tagact` enum('B') NOT NULL DEFAULT 'B',
  PRIMARY KEY (`id_act_tagact`,`id_tag_tagact`,`profil_tagact`),
  KEY `tag_act_ibfk_1` (`id_tag_tagact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tag_act`
--

INSERT INTO `tag_act` (`id_act_tagact`, `id_tag_tagact`, `profil_tagact`) VALUES
('199b798e0ccfa9fe5657e7808e6d38e5', '0', 'B'),
('36a003c982af3dff6a92228d85b22b43', '0', 'B'),
('6d5808332cea03c4ce075b42ac9962af', '0', 'B'),
('a247c85cc118b5f9196f52e614cf96e7', '0', 'B'),
('b8dd2a347b9f9320f9a96867bcc2f963', '0', 'B'),
('cb23349d906d3428d4203abe61dfda19', '0', 'B'),
('d731529c5649cdb281211c388532d970', '0', 'B'),
('34daf30f74017772c8b68a12e7b70810', '01b6e20344b68835c5ed1ddedf20d531', 'B'),
('da7241a50949e47946e6a8230c6e1222', '0253c4a012e0d32bc73b0ad2a2832762', 'B'),
('08d6efb10305f2090292dab279eecf2b', '09482dfda978eabea0ded7f57235aa43', 'B'),
('82f86c3ac00dba7f1982bbfd72374b0b', '098f6bcd4621d373cade4e832627b4f6', 'B'),
('95cbf505f9cb52ef254cd064e964af26', '098f6bcd4621d373cade4e832627b4f6', 'B'),
('199b798e0ccfa9fe5657e7808e6d38e5', '1', 'B'),
('36a003c982af3dff6a92228d85b22b43', '1', 'B'),
('6d5808332cea03c4ce075b42ac9962af', '1', 'B'),
('a247c85cc118b5f9196f52e614cf96e7', '1', 'B'),
('b8dd2a347b9f9320f9a96867bcc2f963', '1', 'B'),
('cb23349d906d3428d4203abe61dfda19', '1', 'B'),
('d731529c5649cdb281211c388532d970', '1', 'B'),
('e2b0fdab45045ddf77ebeddd5a8898d0', '18c3878a6c21adc3e4d52b95afca7145', 'B'),
('31c121e061edabb6609ab85abaa1c522', '1a37c93c4d000ea63255147931bbc233', 'B'),
('fae8c41b9f97670fad332eb081733396', '1a37c93c4d000ea63255147931bbc233', 'B'),
('cf7091ba40f9506c73147d286492c410', '27936cd368c9748649022b4e04cbd4f2', 'B'),
('749b033ecbb568fd068f6097f1e3da38', '434990c8a25d2be94863561ae98bd682', 'B'),
('cdee1f8f6d42295a8f9b25c08c6b6d8b', '4985411d2d86b8f953f28316559043a2', 'B'),
('06faa1dd5921a3dce73d188930cf4d3e', '49aea376bb5a51fa034d8963e2ea815d', 'B'),
('0ceead01e302b49382ce22688eb022a1', '49aea376bb5a51fa034d8963e2ea815d', 'B'),
('4cc6412835cd25a5d18214ba8456df50', '4a6d13d111d321b7968d2cde64eb0986', 'B'),
('06faa1dd5921a3dce73d188930cf4d3e', '4b7c90409368b88999cf9f69c02da6e6', 'B'),
('577e2644405566381b5b301a94bd3fa7', '4b7c90409368b88999cf9f69c02da6e6', 'B'),
('5a55be7fc390e2b1e389f64b057b705f', '4b7c90409368b88999cf9f69c02da6e6', 'B'),
('635dddb049aa5b2d10643a50a0ab2199', '4b7c90409368b88999cf9f69c02da6e6', 'B'),
('86139c87f6edc9169aa116a4173be3b5', '4b7c90409368b88999cf9f69c02da6e6', 'B'),
('b842a75c0218f60ff6d790f4a39ab7a5', '4b7c90409368b88999cf9f69c02da6e6', 'B'),
('cdee1f8f6d42295a8f9b25c08c6b6d8b', '4b7c90409368b88999cf9f69c02da6e6', 'B'),
('ee91b06daf243a32ade42abff1e289b1', '4b7c90409368b88999cf9f69c02da6e6', 'B'),
('a3d1c5be22f2572d3695e7b0da54cc31', '57336afd1f4b40dfd9f5731e35302fe5', 'B'),
('12d26cc674652e848a7019d569e80c4b', '5d933eef19aee7da192608de61b6c23d', 'B'),
('1ef53e492ed25d7a9b6b4527a33b12e2', '5d933eef19aee7da192608de61b6c23d', 'B'),
('97cc9f5fc79a69668012955a2ef54991', '5d933eef19aee7da192608de61b6c23d', 'B'),
('ab2c7513099b5e3beeb11110bc09c280', '5d933eef19aee7da192608de61b6c23d', 'B'),
('12d26cc674652e848a7019d569e80c4b', '6ce809eacf90ba125b40fa4bd903962e', 'B'),
('86139c87f6edc9169aa116a4173be3b5', '7eec51a9923ac92a792300ccbd541e17', 'B'),
('cf7091ba40f9506c73147d286492c410', '86cc6accc7f00c023fe1cce850686223', 'B'),
('749b033ecbb568fd068f6097f1e3da38', '87a4f89dbcdda862656068534d7005a9', 'B'),
('25e6bb5942c8d358ad6c3ab7825df8f1', '8be74552df93e31bbdd6b36ed74bdb6a', 'B'),
('3d849300bcda33ea9d5b47936d606ceb', '92ad06424bb2dd63c21f2da9b79cd4e7', 'B'),
('3d849300bcda33ea9d5b47936d606ceb', '97c8fb3d83a001d411c7afb097fdc411', 'B'),
('4cc6412835cd25a5d18214ba8456df50', '9c84b22c3b0b033c5f7afe89b1789bad', 'B'),
('5eb6dd0eed8c9057298b7feda95fb67d', '9c84b22c3b0b033c5f7afe89b1789bad', 'B'),
('d3faa2fb6cc9e4bfb5295a974d0403b4', '9c84b22c3b0b033c5f7afe89b1789bad', 'B'),
('dfd5fda3f017aef57404e3b5cd9dfbca', '9c84b22c3b0b033c5f7afe89b1789bad', 'B'),
('f8331425f3a89d15c6b5d298b112ceaa', '9c84b22c3b0b033c5f7afe89b1789bad', 'B'),
('34daf30f74017772c8b68a12e7b70810', '9e05f1aa551fc0427f4eaa2c034e7c5d', 'B'),
('da7241a50949e47946e6a8230c6e1222', 'a6ed2b7033a44688f0b5aae4fa868f2e', 'B'),
('f3a13e51d22d8ad2a2ffb43d3c61abc0', 'a7a44f6d5f0ad2c4c507acc1c4039318', 'B'),
('98fe9524d671d1883b7475333b369f24', 'b6a2b7feefc9f04b05fb3069a28f18f4', 'B'),
('12e0449213c3a96b3a815851e29dd321', 'c1f49b9b3701a71d7cf5d01741795602', 'B'),
('4cc6412835cd25a5d18214ba8456df50', 'c522a59862309cc5dea2f3e8349d8a3f', 'B'),
('ce90f495c8b0d7d8becf553b1b320914', 'c565159e4697c29c630c41b1293c0633', 'B'),
('cf7091ba40f9506c73147d286492c410', 'c565159e4697c29c630c41b1293c063c', 'B'),
('3d4901382a054db417162e9dbf59660c', 'cb7e0f3ec835a213b005c4424c8d5775', 'B'),
('577e2644405566381b5b301a94bd3fa7', 'd2ffb970ba1b3700f8ea9baa32bffd73', 'B'),
('5a55be7fc390e2b1e389f64b057b705f', 'd2ffb970ba1b3700f8ea9baa32bffd73', 'B'),
('749b033ecbb568fd068f6097f1e3da38', 'd2ffb970ba1b3700f8ea9baa32bffd73', 'B'),
('a3d1c5be22f2572d3695e7b0da54cc31', 'd2ffb970ba1b3700f8ea9baa32bffd73', 'B'),
('cdee1f8f6d42295a8f9b25c08c6b6d8b', 'd2ffb970ba1b3700f8ea9baa32bffd73', 'B'),
('749b033ecbb568fd068f6097f1e3da38', 'd8a8b8859ded3e4f2825031c06066fbb', 'B'),
('12d26cc674652e848a7019d569e80c4b', 'e1bfd762321e409cee4ac0b6e841963c', 'B'),
('25e6bb5942c8d358ad6c3ab7825df8f1', 'f02368945726d5fc2a14eb576f7276c0', 'B'),
('12d26cc674652e848a7019d569e80c4b', 'f48ac822376a54dbe8667a5b3a649058', 'B'),
('12d26cc674652e848a7019d569e80c4b', 'f71dbe52628a3f83a77ab494817525c6', 'B'),
('1ef53e492ed25d7a9b6b4527a33b12e2', 'f71dbe52628a3f83a77ab494817525c6', 'B'),
('235013987bee37c027e768a763acd918', 'f71dbe52628a3f83a77ab494817525c6', 'B'),
('3d4901382a054db417162e9dbf59660c', 'f71dbe52628a3f83a77ab494817525c6', 'B'),
('95cbf505f9cb52ef254cd064e964af26', 'f71dbe52628a3f83a77ab494817525c6', 'B'),
('97cc9f5fc79a69668012955a2ef54991', 'f71dbe52628a3f83a77ab494817525c6', 'B'),
('ab2c7513099b5e3beeb11110bc09c280', 'f71dbe52628a3f83a77ab494817525c6', 'B'),
('da17140ff413ee4d8a6e8538579c4d62', 'f71dbe52628a3f83a77ab494817525c6', 'B'),
('fd5483e85bf532ea6d857806e56dd541', 'f71dbe52628a3f83a77ab494817525c6', 'B'),
('a3d1c5be22f2572d3695e7b0da54cc31', 'f9fa10ba956cacf91d7878861139efb9', 'B');

-- --------------------------------------------------------

--
-- Table structure for table `tag_grp`
--

CREATE TABLE `tag_grp` (
  `id_grp_taggrp` varchar(32) NOT NULL,
  `id_tag_taggrp` varchar(32) NOT NULL,
  PRIMARY KEY (`id_grp_taggrp`,`id_tag_taggrp`),
  KEY `tag_grp_ibfk_2` (`id_tag_taggrp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tag_net`
--

CREATE TABLE `tag_net` (
  `id_net_tagnet` varchar(32) NOT NULL,
  `id_tag_tagnet` varchar(32) NOT NULL,
  PRIMARY KEY (`id_net_tagnet`,`id_tag_tagnet`),
  KEY `tag_net_ibfk_2` (`id_tag_tagnet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tag_usr`
--

CREATE TABLE `tag_usr` (
  `id_tag_tagusr` varchar(32) NOT NULL,
  `id_usr_tagusr` varchar(32) NOT NULL,
  `profil_tagusr` enum('P','C') NOT NULL DEFAULT 'P',
  PRIMARY KEY (`id_tag_tagusr`,`id_usr_tagusr`,`profil_tagusr`),
  KEY `tag_usr_ibfk_1` (`id_usr_tagusr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tag_usr`
--

INSERT INTO `tag_usr` (`id_tag_tagusr`, `id_usr_tagusr`, `profil_tagusr`) VALUES
('49aea376bb5a51fa034d8963e2ea815d', '00', 'P'),
('49aea376bb5a51fa034d8963e2ea815d', '0fbef09a987b7a2f6f5aad18a31a5c43', 'P'),
('1a37c93c4d000ea63255147931bbc233', '5a6097a8f128c86769da4e977927a78d', 'P'),
('671c9eca7f36118e0e336a9def3fdee0', '6b2e63b1fd55069fb7cb35fb60f61ed7', 'P'),
('49aea376bb5a51fa034d8963e2ea815d', '7613d36b2c3ba668fb03d2bd2cc6b3cc', 'P'),
('87ad04504d9bb72d6fe445061d3486aa', '7613d36b2c3ba668fb03d2bd2cc6b3cc', 'C'),
('f71dbe52628a3f83a77ab494817525c6', '7613d36b2c3ba668fb03d2bd2cc6b3cc', 'P'),
('671c9eca7f36118e0e336a9def3fdee0', '79b1b9dc1b338006650c78d3b4919b04', 'C'),
('9c84b22c3b0b033c5f7afe89b1789bad', '79b1b9dc1b338006650c78d3b4919b04', 'P'),
('49aea376bb5a51fa034d8963e2ea815d', '7d6653aaa16976e12b6cf7c774f83c1f', 'P'),
('4b7c90409368b88999cf9f69c02da6e6', '7d6653aaa16976e12b6cf7c774f83c1f', 'C'),
('7eec51a9923ac92a792300ccbd541e17', '7d6653aaa16976e12b6cf7c774f83c1f', 'P'),
('f71dbe52628a3f83a77ab494817525c6', '7d6653aaa16976e12b6cf7c774f83c1f', 'P'),
('4a6d13d111d321b7968d2cde64eb0986', '941af2c99f4f7895b481ab9c3261e4ee', 'P'),
('9c84b22c3b0b033c5f7afe89b1789bad', '941af2c99f4f7895b481ab9c3261e4ee', 'P'),
('c522a59862309cc5dea2f3e8349d8a3f', '941af2c99f4f7895b481ab9c3261e4ee', 'P'),
('7eec51a9923ac92a792300ccbd541e17', 'a3cefde48284f70b2098d7015e987148', 'P'),
('9c84b22c3b0b033c5f7afe89b1789bad', 'a530b55030587b46519449c39181d1b8', 'C'),
('09482dfda978eabea0ded7f57235aa46', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'P'),
('09482dfda978eabea0ded7f57235aa47', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'C'),
('365a1ad341a0bb6e49308c5fbe121626', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'P'),
('3dda443ae06935b84a7c2859c519e664', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'P'),
('4197188c2c1bdcf8e1770dce1a603f61', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'P'),
('55517f295b6fbe6320cad82e663b60ca', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'P'),
('70fe200dd6539876e98c827571b1b072', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'P'),
('7603c845d58acb3cc5de704ad25cc6c1', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'P'),
('7eec51a9923ac92a792300ccbd541e17', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'P'),
('8a8429234a5dd01bae9123dd3b2ed0f4', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'P'),
('a4f88dbaef9549da27b4e42a82fe4f6c', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'P'),
('b19eaa6a1e6ce34879e0f6075813e8e2', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'P'),
('d10af457daa1deed54e2c36b5f295e7e', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'P'),
('d21680866f56203dd74cc7c346dba53a', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'P'),
('d2ffb970ba1b3700f8ea9baa32bffd74', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'P'),
('d31ff8ef88f907b2a2bc67ed4ca87735', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'P'),
('dc3d90da3b69b00ffda4099f89d214d6', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'P'),
('e512fd70aa45c2d8d842c593bbcc73cf', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'P'),
('f1a41f239896dc63a6eaeba863f0e7ce', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'P'),
('fa202a546ccf359253d99553bc929b28', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'P'),
('fcdfb93840b23043f40c97a83b0f0b61', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'P');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `pid_usr` int(11) NOT NULL AUTO_INCREMENT,
  `id_usr` varchar(32) CHARACTER SET utf8 NOT NULL,
  `profil_usr` enum('P','C','B','N') CHARACTER SET utf8 NOT NULL DEFAULT 'N' COMMENT 'P =>presta, C=>customer/employer',
  `status_usr` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0 = not activate, 1 = new user, 2 = available, 3 = busy, 4= unavailable, -1 = invisible',
  `level_usr` enum('JUNIOR','INTERMEDIATE','EXPERT') CHARACTER SET utf8 NOT NULL DEFAULT 'JUNIOR',
  `activate_code_usr` varchar(32) CHARACTER SET utf8 NOT NULL,
  `regdate_usr` datetime NOT NULL,
  `url_usr` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `privacy_usr` enum('P','R') CHARACTER SET utf8 NOT NULL DEFAULT 'P',
  `fullname_usr` varchar(120) CHARACTER SET utf8 DEFAULT NULL,
  `lang_usr` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'FR',
  `gender_usr` enum('M','F') CHARACTER SET utf8 DEFAULT 'M',
  `birthdate_usr` date DEFAULT NULL,
  `shortdesc_usr` varchar(700) CHARACTER SET utf8 DEFAULT 'Description non renseignée.',
  `email_usr` varchar(45) CHARACTER SET utf8 NOT NULL,
  `phone_usr` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `mobile_usr` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `password_usr` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `nation_usr` varchar(124) CHARACTER SET utf8 NOT NULL,
  `id_spt_usr` varchar(32) CHARACTER SET utf8 NOT NULL,
  `activ_nby` tinyint(1) NOT NULL DEFAULT '0',
  `mode_nby` enum('A','S','R') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A' COMMENT 'A=> automatic,S=>static,R=>refuse',
  `id_spt_nby` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `radius_nby` enum('5','25','50','100','XX') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'XX',
  `views_usr` int(11) unsigned NOT NULL DEFAULT '0',
  `id_img_usr` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `fb_id_usr` varchar(20) CHARACTER SET utf8 NOT NULL,
  `last_activity_usr` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pid_usr`),
  UNIQUE KEY `id_usr` (`id_usr`),
  KEY `level` (`level_usr`),
  KEY `status` (`status_usr`),
  KEY `privacy` (`privacy_usr`),
  KEY `firstname` (`fullname_usr`),
  KEY `shortdesc` (`shortdesc_usr`(255)),
  KEY `im_notification_usr` (`nation_usr`),
  KEY `user_ibfk_1` (`id_spt_usr`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table des utilisateurs' AUTO_INCREMENT=22 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`pid_usr`, `id_usr`, `profil_usr`, `status_usr`, `level_usr`, `activate_code_usr`, `regdate_usr`, `url_usr`, `privacy_usr`, `fullname_usr`, `lang_usr`, `gender_usr`, `birthdate_usr`, `shortdesc_usr`, `email_usr`, `phone_usr`, `mobile_usr`, `password_usr`, `nation_usr`, `id_spt_usr`, `activ_nby`, `mode_nby`, `id_spt_nby`, `radius_nby`, `views_usr`, `id_img_usr`, `fb_id_usr`, `last_activity_usr`) VALUES
(1, '00', 'P', 2, 'JUNIOR', '', '0000-00-00 00:00:00', 'Team', 'P', 'Yoomken', 'fr', NULL, NULL, 'Je suis ce que je suis.', 'no-reply@yoomken.com', NULL, NULL, NULL, '', 'cc5e06b8c15ff0eb65fba33198f510f5', 0, 'A', NULL, 'XX', 0, '75cd20767c0c22e0431a7683bf14bfa2', '', '2012-11-04 05:03:53'),
(2, '178cd2f3df2d88613b46bb6e96a77f3a', 'C', 2, 'JUNIOR', '', '2012-11-25 09:30:02', 'sara', 'P', 'Sara', 'fr', NULL, NULL, 'Je suis ce que je suis.', 'sara@yoomken.com', NULL, NULL, 'f69e83f278f07765a4bebae3bcebd4ac', '', 'f148706390f82e8c19a659a2a2be2bf2', 0, 'S', '203fa78a6ae936dd5936e6251de5b9ea', 'XX', 0, NULL, '', '2013-05-31 08:34:19'),
(3, '2bd8063bffa0986bfbe7e265cfba8a63', 'P', 2, 'JUNIOR', 'e207b1b4e584160ccdac2c6a80c324d1', '2012-07-13 11:21:58', 'zoubeidapousse02', 'P', 'Zoubeida', 'FR', NULL, NULL, 'Je suis ce que je suis.', 'zoub@yoomken.com', NULL, NULL, 'f69e83f278f07765a4bebae3bcebd4ac', '', 'f69e83f278f07765a4bebae3bcebd4ac', 0, 'A', NULL, 'XX', 0, NULL, '', '2013-05-30 08:58:33'),
(4, '48ae9648a43e3633ae647c2583d84116', 'B', 2, 'JUNIOR', '3e21c6def0e8b15fbd0d88cf0aed94d8', '2011-11-26 23:38:07', 'fateneZrann', 'P', 'Fatene', 'FR', NULL, NULL, 'Je suis ce que je suis.', 'fatene@yoomken.com', NULL, NULL, '5e52133a1842f12bd02cc93e92cbfbb8', '', '5e52133a1842f12bd02cc93e92cbfbb8', 0, 'A', NULL, 'XX', 0, NULL, '', '2013-05-30 09:16:18'),
(5, '53fa70efac048b82ca1f1c2cc8811b49', 'C', 2, 'JUNIOR', '', '0000-00-00 00:00:00', 'gaddes.salem', 'P', 'Gaddes', 'FR', 'F', NULL, NULL, 'gades@yoomken.com', NULL, NULL, '922d17239d90f0930906beb3057ebe6fbf3f6011', 'N', '6605fd61ab31fa64963ca8e3d7697983', 0, 'A', NULL, 'XX', 0, NULL, '1052896554', '2012-11-04 05:03:53'),
(6, '6b2e63b1fd55069fb7cb35fb60f61ed7', 'B', 2, 'JUNIOR', '', '2011-11-26 20:01:47', 'specialone', 'P', 'Ahmad Gabriel', 'fr', 'M', NULL, 'Je suis ce que je suis.', 'yoomken.test@gmail.com', NULL, NULL, '8dda369b75eb715d71c047ee092dd084ecb7232e', '', '03bd16f1fff98aa59ee7a6e59462654e', 0, 'S', 'f01d198551e75d0985e58c465b739e57', 'XX', 0, '8f92bf76c33e582879e2f28db12dc778', '', '2013-05-30 14:50:05'),
(7, '79b1b9dc1b338006650c78d3b4919b04', 'P', 2, 'INTERMEDIATE', '', '2011-11-23 20:40:02', 'Kim', 'R', 'Hakim Pousse', 'fr', 'M', '1981-07-27', 'Peintre indépendant depuis 4 ans cherche missions de courtes ou longes durées, pour tous types de travaux dans la peinture. Travail seul et propre. Devis gratuit sur r.d.v, region Iles de France.', 'kim@yoomken.com', NULL, NULL, '71c693162120c30081793dc18fe09d2df9c27b11', '', '03e6f0dba7369437497b38cb168220fa', 0, 'S', '203fa78a6ae936dd5936e6251de5b9ea', 'XX', 0, '3f5a116725f716f30b605fa138b666ef', '100000421441918', '2013-05-31 08:58:17'),
(10, 'a3cefde48284f70b2098d7015e987148', 'B', 2, 'JUNIOR', '', '2011-09-13 13:01:02', 'shingo', 'P', 'shingo', 'fr', NULL, '2012-09-15', 'Je suis ce que je suis.', 'yoomken@gmail.com', NULL, NULL, 'bc605c49f519507865aaea3551d0c56040e5b058', '', 'f059097d60ffa8eaa4d19bdf10005a72', 0, 'S', NULL, 'XX', 0, NULL, '', '2013-05-31 08:32:06'),
(11, 'a530b55030587b46519449c39181d1b8', 'C', 2, 'JUNIOR', '', '2011-10-09 00:49:26', 'charlotte', 'P', 'Charlotte', 'fr', 'F', NULL, 'Je suis ce que je suis.', 'shingo@yoomken.com', NULL, NULL, 'f8d532cd56547c0ce941d237894a253cc4e481e8', '', '230c06bb802da8b08228f757b74f8dbb', 0, 'S', NULL, 'XX', 0, NULL, '546504178', '2013-05-30 15:08:50'),
(17, 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'B', -1, 'JUNIOR', '', '2012-11-27 21:57:35', 'Ahmadgabrielalkotob', 'P', 'Ahmad Gabriel Al Kotob', 'fr', 'M', NULL, 'Description non renseignée.', 'alkotobmail@gmail.com', NULL, NULL, '53649f6e45138ef119c955d04bf042562f6e2946', '', 'cc5e06b8c15ff0eb65fba33198f510f5', 0, 'A', '96ade413e16eca9516d799f7351cf442', 'XX', 0, NULL, '', '2013-05-31 07:13:50'),
(18, '5a6097a8f128c86769da4e977927a78d', 'N', 2, 'JUNIOR', '', '2010-11-28 16:59:59', 'ShingoPousse', 'P', 'Shingo Pousse', 'fr', '', '1981-12-21', 'Description non renseignée.', 'selim.pousse@gmail.com', NULL, NULL, '8bb602040e108f9a839a56fc51855a467160fa96', '', 'e41b1049214f05ae40add8ddd58ad347', 0, 'A', '84f072cdcf4174e8a035c678ab0a59dd', 'XX', 0, NULL, '100002045064352', '2013-11-24 14:13:09'),
(19, '941af2c99f4f7895b481ab9c3261e4ee', 'P', 2, 'JUNIOR', '', '2013-05-25 15:44:49', 'Samy', 'R', 'Hakim Pousse', 'fr', 'M', NULL, 'Description non renseignée.', 'hakim.pousse@gmail.com', NULL, NULL, '71c693162120c30081793dc18fe09d2df9c27b11', '', 'c14405a94c63499d02662e798f910c23', 0, 'S', '203fa78a6ae936dd5936e6251de5b9ea', 'XX', 0, NULL, '', '2013-05-30 15:03:21'),
(21, '871aafc5183b46241b988e1ae13f3501', 'N', 2, 'JUNIOR', '', '2013-11-23 07:28:45', 'SlimPousse', 'P', 'Sélim Pousse', 'fr', '', NULL, 'Description non renseignée.', 'selim_pousse@hotmail.com', NULL, NULL, 'd50338555566eb6d9eb4ca4a3ed4febabd05fef3', '', 'c14405a94c63499d02662e798f910c23', 0, 'R', NULL, 'XX', 0, NULL, '787174439', '2013-11-24 14:57:52');

-- --------------------------------------------------------

--
-- Table structure for table `user_custo`
--

CREATE TABLE `user_custo` (
  `id_usr_custo` varchar(32) CHARACTER SET utf8 NOT NULL,
  `job_custo` varchar(124) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_usr_custo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_custo`
--

INSERT INTO `user_custo` (`id_usr_custo`, `job_custo`) VALUES
('00', ''),
('7d6653aaa16976e12b6cf7c774f83c1f', ''),
('a3cefde48284f70b2098d7015e987148', ''),
('f7a5c01ea63f9176ff7352da1b5dcaa5', 'Secrétariat');

-- --------------------------------------------------------

--
-- Table structure for table `user_event`
--

CREATE TABLE `user_event` (
  `id_usr_usrevt` varchar(32) NOT NULL,
  `id_act_usrevt` varchar(32) NOT NULL,
  PRIMARY KEY (`id_usr_usrevt`,`id_act_usrevt`),
  KEY `user_event_ibfk_2` (`id_act_usrevt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_log`
--

CREATE TABLE `user_log` (
  `id_usrlog` varchar(32) NOT NULL,
  `id_usr_usrlog` varchar(32) DEFAULT NULL,
  `date_usrlog` datetime DEFAULT NULL,
  `os_usrlog` varchar(45) DEFAULT NULL,
  `browser_usrlog` varchar(45) DEFAULT NULL,
  `language_usrlog` varchar(45) DEFAULT NULL,
  `ip_usrlog` varchar(32) NOT NULL,
  PRIMARY KEY (`id_usrlog`),
  KEY `id_usr_usrlog` (`id_usr_usrlog`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_log`
--

INSERT INTO `user_log` (`id_usrlog`, `id_usr_usrlog`, `date_usrlog`, `os_usrlog`, `browser_usrlog`, `language_usrlog`, `ip_usrlog`) VALUES
('00ac8958b5f04ea8f8fb37369e75093a', '5a6097a8f128c86769da4e977927a78d', '2013-11-24 10:48:22', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('010c4872d60155c77394444a6498b6cd', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2012-02-01 17:32:32', 'unknown', 'Default Browser - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('0117be8932e7a7924459f845248d4a5e', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-14 11:22:39', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('0143be4a104f2e813b2eabfd79dcb630', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2012-02-22 23:37:05', 'unknown', 'Default Browser - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('02c0b25f113e529da3f08b846e173ce8', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2012-01-04 13:22:51', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('030bc44eaf1dc9f399a05d73fd5d653e', 'a3cefde48284f70b2098d7015e987148', '2012-09-17 13:28:53', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('04d1c97aef4c94eb986805eac1081183', '1df9e06e56cdc06289a2068cf52cd611', '2012-11-27 21:25:18', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '90.46.103.138'),
('04dcedd3df56bab0cbbf02a5ed9a6f38', '871aafc5183b46241b988e1ae13f3501', '2013-11-22 14:54:33', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '10.8.0.6'),
('06a26da163296e8ba2c889926389ef17', '3318afc1fce28f4e567658e60fec9da2', '2012-09-12 14:00:29', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('06cd4f13ca8b9dd4ae3169e956cedabc', '5a6097a8f128c86769da4e977927a78d', '2013-11-24 11:09:35', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('07037ca61588e36de9c300aa552e9c81', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2012-02-03 09:35:28', 'Win7', 'IE - JS=1- Cookies=1', 'fr-ch', '::1'),
('07587440135898e75ea507d69d493079', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-09-30 01:26:56', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('07c15f3fb18a1f3a9fd845e08fad9447', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-27 05:28:44', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('0966d77d5aaa32d9d10d4185f27c0463', 'a3cefde48284f70b2098d7015e987148', '2012-09-16 06:06:14', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('09c8d6a251f9d4c91a8e808a4f2c8c57', '00', '2011-11-23 09:49:40', 'unknown', 'Default Browser - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('0a131e93533ac0cdc349947f79b6d935', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 16:37:49', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('0a7a5a9b20ed7d1616986e50550b4a72', '00c28b25326d55eeb28a5ced60a51925', '2012-09-13 06:19:27', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('0ab90f7b7ee3060f8b74ffdaf9e7bc1d', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-25 11:45:24', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '90.46.103.138'),
('0b21b1f04df60162a8bd3b6ace634ec2', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-12-03 23:18:32', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '217.162.205.43'),
('0b9f40be160d2ef8ed2c1c37b12deab4', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-31 10:52:54', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('0c022b2524d698a8dfee4d4b1ba93b0b', '1dd06812b3511f17e047e96d61f66106', '2012-09-12 13:37:19', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('0eac9734eca9ea61700a1ce8b4c5fa08', 'a3cefde48284f70b2098d7015e987148', '2013-10-23 22:38:10', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('0f28eff0e4e4931624219669084fad73', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2012-01-23 14:21:37', 'unknown', 'Default Browser - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('0f961e0f73c7b892d391d7b50e80f5ca', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-31 05:13:20', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('0fc774019fc8771c798b11f9586ff4c3', '5a6097a8f128c86769da4e977927a78d', '2013-11-24 10:48:44', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('102967fe6547fab977cd2d5008e08260', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-27 15:41:51', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '82.236.198.1'),
('10b83f52a9feb92a4a7d8911afece837', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2011-11-26 21:39:50', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '88.174.111.174'),
('11c225fd8b1c5f726d4ab64a32abed7f', '1d7ce9781d74c05bc3782f4c06eabdcd', '2012-09-12 15:31:37', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('14db9d1f4001dc00afaa45e0f77b966a', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-18 07:51:57', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '217.162.205.43'),
('158895d59edc5b2021971349f0267fe0', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-23 12:24:00', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('167975e61272bfb2506eb21050c97d30', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-09 03:40:31', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '217.162.205.43'),
('167da74f48fc1cc73093ed971f2c8c03', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-14 15:20:21', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '217.162.205.43'),
('1782055ebab80321a474ef5c3d3198ef', '97b2c140029b110a0b9dc00a7bd4481a', '2012-09-13 06:38:41', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('17d1f4d5278a6a3339bb16749818926c', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-27 06:07:59', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('187f9bb1de46627af3ef2686d5befbc8', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-08-26 01:37:25', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('19d4b30ac5916720fe22af14ab5f1187', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2012-04-14 14:25:26', 'unknown', 'Default Browser - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('1b5a2408e059905fee705cd57a486b5b', 'a3cefde48284f70b2098d7015e987148', '2012-09-19 15:49:01', 'Win7', 'IE - JS=1- Cookies=1', 'fr-CH', '::1'),
('1b81d6ff05948fc5c82c243946c9548b', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-30 16:45:35', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('1b931382e7575f180b4b53a48a9bbf19', '5a6097a8f128c86769da4e977927a78d', '2013-04-28 02:30:46', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('1bb2fb2be07e8ed660a1f6ad26b72ddb', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-26 12:30:40', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '217.162.205.43'),
('1be8ba636b2401deb16ab715625eca8a', '841ef8a50591e500450e46b20f0071cd', '2012-09-13 12:32:08', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('1e84dde35be1fd8e1e25563c7551dba9', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-11 18:14:19', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '217.162.205.43'),
('1f7e73a4d6625bcd79c44baf63ca925b', '178cd2f3df2d88613b46bb6e96a77f3a', '2013-05-30 14:55:56', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('1fb96fd4b30a615a350019907d62918e', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2012-02-22 23:37:07', 'unknown', 'Default Browser - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('1fef5aaf30cabbd5f0bdbc9ff2566983', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-16 11:44:15', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('20d7e74d87b672c77007ec1045e47c88', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-25 11:28:13', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '90.46.103.138'),
('2602afb806515fe8e8119da3ead592fa', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-19 16:23:44', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('26b464a93f7ceb6bee8c494491cdc9fe', '5fb94b57d704fa3bb4bbe279634c757c', '2012-09-13 08:39:01', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('26c21fbbac50004e21bc704c289d9374', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-15 23:17:45', '', ' - JS=- Cookies=', 'en-GB,en;q=0.8,en-US;q=0.6,fr;q=0.4', '86.149.206.17'),
('27019eb5b4082dcf4127975f3db751d7', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 14:04:46', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('27059602ce0de036242478a8bc0fb21c', '5a6097a8f128c86769da4e977927a78d', '2013-11-24 10:49:16', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('2798c839d3c995553f610f8773da7acd', '3acb3e030860b5ac415d226b9907d0e7', '2012-09-12 14:39:56', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('27ff560cbcda4901bdfd12d4c4bc9741', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-16 11:34:42', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('293d9582b6cb5d0ef7dcabcd4a867107', 'a3cefde48284f70b2098d7015e987148', '2012-09-16 10:57:33', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('299df7285c63271c72974dacd027f841', '687c9e9af6d058338b2af10b93a4e596', '2012-09-12 16:35:48', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('2ac63d801abde10fc3a60f10eefc1de8', '941af2c99f4f7895b481ab9c3261e4ee', '2013-06-02 17:38:23', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('2c1dec9ea4ac4e705a8085c647fbfc2f', 'a530b55030587b46519449c39181d1b8', '2013-05-31 10:59:42', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('2c6a127f82d766ee503ea79366b6386b', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 20:51:25', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('2e7d53fe4a250ea1c434267f907428e9', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-16 11:47:31', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('2fbd07368a8dbec93f0909353f6af227', 'e1cf51966342cda9d6d505dff4e2a50a', '2012-09-12 15:39:19', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('311d85950b172f4bc43b1968972139c6', 'a3cefde48284f70b2098d7015e987148', '2012-09-16 05:26:42', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('3122a01ed0017f4ccf9bf6a890d323dd', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 15:28:55', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('322c9605f14db78d7db64ee9990e4187', '5a6097a8f128c86769da4e977927a78d', '2013-04-28 09:25:53', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('3333c1745e89b6343884d278d63e4dea', '00', '2011-10-14 06:24:43', 'unknown', 'Default Browser - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('33c6c6e5f283a41b6dbeb8d0739e6ef6', 'a3cefde48284f70b2098d7015e987148', '2013-05-30 13:07:46', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('3410967cfaa9db0142106a000f254f4f', 'a530b55030587b46519449c39181d1b8', '2013-05-30 17:06:32', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('3459eced171c71aad575caca1dc7b801', 'c002af25af2ff1c0466f8c70f549b0af', '2012-09-12 13:50:49', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('3566447f59e4b585b9b33bf9082ab345', '756a38308099191deffe566cc572d1ea', '2012-09-12 14:47:42', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('356d77c58ca9f80071908d9f60f9ca1e', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-16 11:44:51', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('3571016354f085ebcb7e799eb6a1cb7d', '871aafc5183b46241b988e1ae13f3501', '2013-11-22 14:55:23', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '10.8.0.6'),
('363f8bef40da527a443b00a0a17593b9', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2011-11-28 13:32:56', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '90.84.146.234'),
('365ab079ad4af1b8cbc195db6438dd44', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-25 11:29:16', '', ' - JS=- Cookies=', 'en-GB,en;q=0.8,en-US;q=0.6,fr;q=0.4', '81.157.52.55'),
('378567d3a7a8417478027028c6665b78', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 16:47:32', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('3859d1b146ec11b29a8e0b66666ffa1d', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-09 10:37:46', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('391cc88b65a08ef41f7604c6cc664895', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2012-04-14 11:57:17', 'Win7', 'IE - JS=1- Cookies=1', 'fr-ch', '::1'),
('395f0078b0e8f75c143a0236fa026307', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-03 10:11:23', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('39ced15d485be2f0b07a03ea1e5b0f2c', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2011-11-26 20:01:49', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '90.46.243.158'),
('3a7fba2d1af966be54e64c4da8c59a88', '5a6097a8f128c86769da4e977927a78d', '2013-11-24 15:33:18', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('3b251d51751bab54206afba77de199f8', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-13 23:17:45', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '217.162.205.43'),
('3b437e26c2b22cd6f9c0576c3a503c47', '586671f519ce766cc5bfaffe8c4c0963', '2012-09-13 11:30:08', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('3b8f79e260f542311b9ebaa6d43cf919', '48ae9648a43e3633ae647c2583d84116', '2011-11-26 23:39:31', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '86.145.229.247'),
('3eb97ba6096994201699fcba544ba0d9', '09cdd8739a3bc234ad974818e3a67c31', '2012-09-13 09:42:04', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('3ed51d9b119550a55aee0dc3a3edf39e', 'e04541f717da39b450f4155282287e77', '2012-09-13 08:37:14', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('4089183e62615b5fc29c591caecde50b', 'db63cb36f363ff16141f9893a0590683', '2012-09-13 08:18:33', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('4102afd00ac5753e18a00b9c74b7376f', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2011-11-26 21:38:18', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '88.174.111.174'),
('4178a17308cbdadd7e6df4ec23a70714', '5a6097a8f128c86769da4e977927a78d', '2013-11-24 10:51:42', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('418f66f9b9dc9bafe1d98a978c8bae8f', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-17 18:01:17', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '217.162.205.43'),
('41f6ef94a5579cbfb2ad09d2c9a224ec', 'c3471df50ab74b88119f5c7d5327131d', '2012-09-13 06:07:19', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('420c27b84701e44b9e734593c441f403', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2012-01-04 13:28:50', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('430992137c3b1c0b6b6d2e8223b7fd27', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-16 11:49:15', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('44759e721211c9f1ce2132788d2ec74b', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2012-02-03 09:28:17', 'unknown', 'Default Browser - JS=- Cookies=', 'en-US', '::1'),
('447cbe3a0da493f4817b34d12b2da2f8', 'd1e3e6d21ed317e2d0495f946c5c1019', '2011-12-31 21:04:41', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '41.226.199.12'),
('448aa8bc3ed99d6277a2ce8f2bc26069', '178cd2f3df2d88613b46bb6e96a77f3a', '2013-05-31 08:02:25', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('449ebf930626d1aa90943d5038577b17', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-28 22:22:59', '', ' - JS=- Cookies=', 'en-GB,en;q=0.8,en-US;q=0.6,fr;q=0.4', '81.157.52.55'),
('458476cdb64694391e1dc59b722e657b', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2011-11-26 20:53:13', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '88.174.111.174'),
('45c36219a733c78ca75740472e08ce12', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-08-20 05:56:55', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('45d4cb8c34268f70fb0036a43a15da8e', 'ae510ee1e62c1fd7f0235bc13ae89cf1', '2012-09-13 09:09:20', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('467831b0453e19d169b7e67af54c3f97', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 17:04:53', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('479a676fd6ac515f64fe657851597f9e', 'a3cefde48284f70b2098d7015e987148', '2013-05-30 13:40:18', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('49752fade33aa5626c39172a517f088d', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-16 11:44:31', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('49b033e28ddb807cea8da9488257d931', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 14:57:33', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('4a7638c3a7468dc05d3492dd78117e10', '871aafc5183b46241b988e1ae13f3501', '2013-11-22 14:53:30', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '10.8.0.6'),
('4a8ad608a92a673e23594b5f77745b77', '5a6097a8f128c86769da4e977927a78d', '2013-11-24 10:47:34', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('4aac29c11e1643ff37288701abdd7622', '941af2c99f4f7895b481ab9c3261e4ee', '2013-05-25 15:44:55', '', ' - JS=- Cookies=', 'en-GB,en-US;q=0.8,en;q=0.6', '31.97.102.242'),
('4d1bb4b22180f3f21b095bc501ce33b6', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-08-22 12:52:53', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('4e412a1d6720ed6fd892ca8b1de1753d', '053e1c1062668611cc02ab393ad000fd', '2012-09-12 16:49:28', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('4e6fb4b866faa5c4462988030d5951d6', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2012-01-11 11:21:48', 'Win7', 'IE - JS=1- Cookies=1', 'fr-CH', '::1'),
('4f8138ec1151dbca79faede0cb1f388e', 'a530b55030587b46519449c39181d1b8', '2013-05-31 09:06:44', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('4fb5c8e3e66b1445f7598d6fccbaf309', '5a6097a8f128c86769da4e977927a78d', '2013-11-24 10:47:52', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('4fe7207d518abea52d6ec11eb5eea07d', 'a3cefde48284f70b2098d7015e987148', '2013-11-22 09:23:07', '', ' - JS=- Cookies=', 'en-US,en;q=0.8', '10.8.0.6'),
('4ffcaa1157cb72f7359c924d07d0b5f2', '841ef8a50591e500450e46b20f0071cd', '2012-09-13 12:22:24', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('50f5e4e88fd6fd67108dad1c0c756f08', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-26 20:06:33', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '217.162.205.43'),
('524092978563ee5597165a48905065a4', '5a6097a8f128c86769da4e977927a78d', '2013-11-24 10:06:44', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('52fb5bf7ddadf42961ba87dbf1eabc6f', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-12-05 13:41:55', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '109.164.218.48'),
('53612ac11ad06c10acb0a905b3b541eb', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 15:10:26', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('53c3b5937f410790285a2187a4e89406', 'a0e2839bbd082ad194f217d364e5a4df', '2012-09-13 08:58:09', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('5426132e4405cf2291e35adc08743c0a', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2012-04-14 12:18:27', 'unknown', 'Default Browser - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('5435615d3a108633303a35fbc3777808', '40a43df941ecc410777728437cd60fe3', '2012-09-12 15:42:35', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('54cae023d66fa7781e48a295fd650bae', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 15:28:04', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('55017354553f41512de2589785fd30db', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2012-01-21 09:56:40', 'unknown', 'Default Browser - JS=- Cookies=', 'en-US', '::1'),
('55fc700deea1d1951eb9798397437c0c', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-08-27 08:23:04', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('562d320e9d97f03f0e24dc736ca5485c', 'a3cefde48284f70b2098d7015e987148', '2012-09-19 12:15:38', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('5692680221366a67d4700963c7be5fd8', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-13 23:23:28', '', ' - JS=- Cookies=', 'en-GB,en;q=0.8,en-US;q=0.6,fr;q=0.4', '86.149.206.17'),
('56b2c4b516c6c060fc5e168ddacc1daa', '5a6097a8f128c86769da4e977927a78d', '2013-04-28 09:46:01', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('58f535943787e529aef1a13d89b73199', '5a6097a8f128c86769da4e977927a78d', '2013-11-24 10:50:10', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('5938e0b5256d2bbfbe54fc6be45dd9ee', '0bbb73aee8d860d39c05663c10e55bc8', '2012-09-12 16:37:02', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('59a555ecece4cd7a84fa49ca6a554e14', '871aafc5183b46241b988e1ae13f3501', '2013-11-23 07:26:00', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('5a2f83d15f04be9acf20e3ec01bacd62', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-16 11:44:33', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('5b20852623f36a0a11e10d517e173564', '5a6097a8f128c86769da4e977927a78d', '2013-11-24 10:33:29', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('5ce3b3533af076de49b5adfecba20031', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-14 16:39:29', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '217.162.205.43'),
('5d1c32896f5d6141f01c050ec47ff7c8', 'ffc2fbe41eb237d7e9dd25d974185119', '2012-09-12 13:31:31', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('5e007c294d11f9eb1fa6848abc61fdad', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-16 11:52:57', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('5fb6216f4e59e6f68d554b2ba066b59b', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 13:28:28', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('606f8946196378305c5b77149202d880', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 14:03:52', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('61394113b28208a37662d758425939b3', '5a6097a8f128c86769da4e977927a78d', '2013-11-24 11:13:03', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('6342c2f8f2f9b01d181eeb5424292169', 'd6c71a2943a2a206a8397c7d2756bac7', '2012-09-13 08:13:22', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('6445e1ab6ad3b86bda049edf74dda241', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 14:04:31', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('65e60e37e99267be6dd37f530adea661', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2012-01-11 12:29:15', 'unknown', 'Default Browser - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('660b1f3004afbc56748f20096c1ceafa', 'a3cefde48284f70b2098d7015e987148', '2013-10-24 00:00:19', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('668ff37f46190ca8d88371309ea42d11', 'f7a5c01ea63f9176ff7352da1b5dcaa5', '2012-12-02 11:21:15', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '88.174.111.174'),
('66b4f8cbf5dd37a71572a9099eb02042', '5a6097a8f128c86769da4e977927a78d', '2013-11-24 10:47:00', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('675a9a7be1f7d2942adf387a7b7b6d09', 'a3cefde48284f70b2098d7015e987148', '2012-09-13 13:01:03', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('69a0f281bd707da9035369b5ad1da9ac', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-25 11:44:15', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '90.46.103.138'),
('6a1508378a7525fc56ab92f5d64417b4', '33fba81e5307a519b225c97c018ebb80', '2012-09-12 13:36:45', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('6a4aaf16dd941bfd86ebd810f4126854', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2012-01-04 13:26:14', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('6b009e6d276f316c6e7bbdc1c6d86365', '871aafc5183b46241b988e1ae13f3501', '2013-11-23 07:25:54', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('6b85c5d2d041454b80c5886fcdbd1935', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-21 12:51:32', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('6ba8629871b5ad151d0591f56e54bc32', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-09-30 01:07:14', 'Win7', 'IE - JS=1- Cookies=1', 'fr-CH', '::1'),
('6bc97aec278282f2c669f7df38d8d671', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2012-01-04 13:30:09', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('6bd1854826093c07618e885e2b93c148', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 15:27:44', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('6d74eedbb602c280631fe585ff1aceb3', '00', '2011-11-23 09:24:39', 'unknown', 'Default Browser - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('6d854cb90a1f1251bcfde4abb9974dd0', '178cd2f3df2d88613b46bb6e96a77f3a', '2013-05-30 11:22:39', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('6d8e7b3e770f8a96aedd7410b10833ac', '00c28b25326d55eeb28a5ced60a51925', '2012-09-13 06:19:14', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('6edb885e00187a667c90c85312efbd62', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2011-11-28 13:36:13', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '90.84.146.234'),
('7003e2a27f7af2690b7441c2553e64ab', '5a6097a8f128c86769da4e977927a78d', '2012-11-28 17:00:04', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '217.162.205.43'),
('70cb4e8bec5c5bf3d6f8eeec7f2bfa8e', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-30 01:42:55', 'Win7', 'IE - JS=1- Cookies=1', 'fr-ch', '::1'),
('7312984c4987e40ed33d74abd8a930e8', 'd5499164a40b3cd4bdbcdc3de63f5dd7', '2012-09-13 06:32:38', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('7313303c2d042d975a099f36b632680d', '86703a439447287a739e3600a3669d29', '2012-09-12 13:15:49', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('733f57bbc3e30a9aa583908401cc333b', 'ce8e22375753b799f049231ed83562a1', '2012-09-12 16:23:28', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('74df130a5081e47af2f9586dc4542107', '5a6097a8f128c86769da4e977927a78d', '2013-04-18 08:48:49', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '128.179.67.69'),
('74e0768f5daaced49d52499b773e5ee5', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-11 11:06:53', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('74ee00ea2d6fa38e036bc7232afac7a3', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 14:00:22', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('7546a349513e5d9ca0fc96d6427ac876', '941af2c99f4f7895b481ab9c3261e4ee', '2013-05-30 17:00:31', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('757c0d3dcf4ed785423eb323e0054425', 'd45e4bc08f17fb3d692394c277e60281', '2012-09-12 13:18:18', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('778384d3bcec69a6d76347e864a2b49b', '871aafc5183b46241b988e1ae13f3501', '2013-11-23 07:26:56', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('7808f1da5d969f223cd100524e2ac63d', 'a3cefde48284f70b2098d7015e987148', '2013-11-22 09:23:02', '', ' - JS=- Cookies=', 'en-US,en;q=0.8', '10.8.0.6'),
('7903c32a844103d7963bfb591e5dd197', '5a6097a8f128c86769da4e977927a78d', '2013-11-24 12:33:45', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('79371ef620a0e8f7960d62c0959a40c7', '5a6097a8f128c86769da4e977927a78d', '2013-06-02 13:23:05', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('79af4a6656591fee281afc087c34524d', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 15:27:34', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('7a059f05fbb90ca4729619ef839ef852', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2012-01-11 11:21:52', 'Win7', 'IE - JS=1- Cookies=1', 'fr-ch', '::1'),
('7a0c34728893641a5899043884c68bb5', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-08-27 13:01:03', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('7bb57f22d49294ff790b809aceea9f69', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 15:28:47', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('7c291a09d5c23373a018fbe0d177d113', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-11 17:36:35', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '217.162.205.43'),
('7c45180e2ddb4512ee252f62951c4d27', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-09 10:27:16', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('7c4b457ae07fe6551f31bb53e0d09e40', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-12-14 15:02:23', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('7d96317577fc47da27ca56246a9473c9', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-03 21:25:22', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('7e7b23fdf44effa750c79857e45ae118', 'e8f894a87f4ee15835cfd6eede3119c6', '2012-09-12 13:52:09', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('7e8732f3005295916e0a9866e1dfb033', '871aafc5183b46241b988e1ae13f3501', '2013-11-22 16:00:26', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '10.8.0.6'),
('7f68bdba9ed52f74d31dc08c997091ea', '79b1b9dc1b338006650c78d3b4919b04', '2013-04-17 20:12:51', '', ' - JS=- Cookies=', 'en-GB,en;q=0.8,en-US;q=0.6,fr;q=0.4', '86.178.221.129'),
('805e236fb91a93178789674de0a22733', '871aafc5183b46241b988e1ae13f3501', '2013-11-23 18:39:50', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('8121d1abe969f975749323154deed489', '00', '2012-09-19 15:11:18', 'Win7', 'IE - JS=1- Cookies=1', 'fr-ch', '::1'),
('81db0249416970b29c672c2bbdda9fe5', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-26 15:07:19', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('820b2c1910861d19ca08a82dafa975d4', 'b039e473e2ddc2af6a2e045dde934913', '2012-09-12 13:45:10', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('823dff621edd99dcae8cb51e441a25ae', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-08-22 12:13:34', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('82b781a8ba261e6a62d82048c1c2abd7', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-30 01:26:35', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('844139f965a2d4ab1c5e9da21340980b', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-14 23:47:31', '', ' - JS=- Cookies=', 'en-GB,en;q=0.8,en-US;q=0.6,fr;q=0.4', '86.149.206.17'),
('8488989d87911e3c085a6a79c22437c6', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 14:03:58', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('84b7c7599414dfcdbae68489d125494a', 'a530b55030587b46519449c39181d1b8', '2013-05-30 10:15:34', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('85382e0144930e36a12fe6af21eda2e5', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2012-01-11 11:18:31', 'unknown', 'Default Browser - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('85a6ac2b0e44c08dcaf9beb3f77ff3fb', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-19 09:24:55', '', ' - JS=- Cookies=', 'en-GB,en;q=0.8,en-US;q=0.6,fr;q=0.4', '81.151.22.143'),
('862db56ac4db6764f5bd62a2d1999202', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2012-04-14 15:08:57', 'Win7', 'IE - JS=1- Cookies=1', 'fr-ch', '::1'),
('86520258d6db0b0285f1fc68ab373315', '7c36b9595f48cba88c52edeeee42af8d', '2012-09-13 08:12:04', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('86da840a3179bc71b9714f35a9467440', '5a6097a8f128c86769da4e977927a78d', '2013-09-14 17:42:36', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '197.27.6.181'),
('87d709cb7135c4b9596d70a701a2740c', '09cdd8739a3bc234ad974818e3a67c31', '2012-09-13 12:54:52', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('8832ea2c074b23fe83ddb5f7b0bfce8f', '5a6097a8f128c86769da4e977927a78d', '2013-11-24 10:47:09', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('88840105f00632a2c9b26fe8b0078927', '2116684d8de4ecf5cf21d4c6ad668f98', '2012-09-12 15:36:58', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('8889d4ad295a6d1a2b586c3e5908024e', '79b1b9dc1b338006650c78d3b4919b04', '2011-11-23 20:40:04', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '86.145.229.247'),
('894ba3a4aa459be535eabf8dd2695b20', '5a6097a8f128c86769da4e977927a78d', '2013-04-17 01:40:02', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('8ad95ac94d585dbb995998f6f4c9eefb', '0cb6a9fe5ecbce4fdd89aa56e1fe5ac5', '2012-09-13 08:23:55', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('8d0f0b0140c21fb05a334e07caf0a058', '1b5d5518c800d0929e8d072ff556638b', '2012-11-27 21:26:30', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '90.46.103.138'),
('8d30540cde6e935d0be108ec83067f76', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-09 10:23:09', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('8fa470f678ce0237768eeef6cc36cef5', '5a6097a8f128c86769da4e977927a78d', '2013-04-29 01:06:48', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('901ac28f34ad7adde29297a476eaabc3', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-08-21 22:18:16', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('9025268ea278e3baa7cbd149e74ed44d', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-11 17:55:38', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '217.162.205.43'),
('905c9b2e21a27bbcd0843476a73a750c', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-12-05 13:40:45', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '109.164.218.48'),
('91996f46613c7d08b5b038e1622e3558', 'fb9683c61faae7377daa18a3a30ffe1d', '2012-09-13 06:53:32', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('94025a7be1f2e82b1b5351dabee9506d', 'a3cefde48284f70b2098d7015e987148', '2013-04-28 09:37:20', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('943d6e76695173f2a309c85a3d86bc88', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 15:26:39', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('948c963833094c7694fe1e2111d22412', '03df626059c3430fb7316bcca108beb3', '2012-09-13 07:39:49', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('9508a9bacdaa9db7f92927fa7cae161b', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 15:26:52', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('95c8e45703341043aa9c0706c4b7345a', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-25 10:44:54', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '217.162.205.43'),
('95d695405a295d56c2bed777d9b354bd', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-02 11:22:16', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('963cc2e97d8520f0095c18e4e26b6d52', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-09 10:32:12', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('9a29ccc1aaeff680ca241ac01ef62c41', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-19 09:25:41', '', ' - JS=- Cookies=', 'en-GB,en;q=0.8,en-US;q=0.6,fr;q=0.4', '81.151.22.143'),
('9ae465368b195a6019f4f77c70fa7a66', '7c7840226f4667662ed0c0ffac20474a', '2012-09-12 15:59:18', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('9b0086051ad34b5997179f440fd5d36a', 'bd555337d5de7f75b9dba538f5e6d2b2', '2012-09-12 13:56:43', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('9bba0cd646bfa8b57ce6850a480ae29b', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-25 10:45:00', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '217.162.205.43'),
('9bcda440d7132ef7473b56fc09f52361', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-26 12:19:18', '', ' - JS=- Cookies=', 'en-US', '217.162.205.43'),
('9c3c5f421c111c13f4c4661c25b92596', '5a6097a8f128c86769da4e977927a78d', '2013-11-24 11:13:32', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('9dd83981947edef2673cdf9885103a70', '5a6097a8f128c86769da4e977927a78d', '2013-05-06 16:07:22', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('9dff8a0e6288f42a43597b1c9f281bae', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-04-17 02:33:47', '', ' - JS=- Cookies=', 'fr-fr', '217.162.205.43'),
('9e9e4eb498b4950438f5edca8713f30b', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-09-19 11:15:18', 'Win7', 'IE - JS=1- Cookies=1', 'fr-ch', '::1'),
('9ee7876d751214ee8a68af0b160020c4', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-09-19 15:20:48', 'Win7', 'IE - JS=1- Cookies=1', 'fr-ch', '::1'),
('9f8b85e0632a4d07acf9f093a7ac8b40', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 13:28:22', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('a0a98f0df74df7ca896fa72a47b448f9', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 15:29:58', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('a1f1f88145289ef03582be84f59add87', '5a6097a8f128c86769da4e977927a78d', '2013-11-24 10:00:33', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('a21782518ec74df86a605aaf7668fd5f', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-27 15:41:47', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '82.236.198.1'),
('a2d7a737701c063c3afd5e9d399175df', '841ef8a50591e500450e46b20f0071cd', '2012-09-13 12:47:52', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('a3e825096c1f564941914a12c9605ea3', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-07 22:14:53', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('a4ae034c93a5960d1aef14b1fc355117', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-06 12:34:21', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '217.162.205.43'),
('a50b507e20818dbdfdb6d55eed597952', '00', '2011-10-12 08:16:47', 'Win7', 'IE - JS=1- Cookies=1', 'en-US', '::1'),
('a5c2d05cc32303f76f25c8820b404f39', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 14:00:30', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('a5dbd577f645218a824eb31469a90bfe', '178cd2f3df2d88613b46bb6e96a77f3a', '2011-11-25 22:46:16', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,fr;q=0.6', '217.162.205.43'),
('a5ecdf7be829f0a3bf175524853bcea7', 'a3cefde48284f70b2098d7015e987148', '2013-04-28 09:33:54', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('a6014e278b53b8b747a42600caca814d', '5a6097a8f128c86769da4e977927a78d', '2013-11-24 11:31:53', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('a6e1c2b1b67c6ef275e366406a1368d2', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-30 01:42:39', 'Win7', 'IE - JS=1- Cookies=1', 'fr-CH', '::1'),
('a78181a229a13e16c5834eb026338bc1', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2012-01-04 13:22:41', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('a787875dbf9fbef94e6f19c3c56fa098', 'a3cefde48284f70b2098d7015e987148', '2012-09-16 05:18:22', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('a873444c119f019de12960479acff10c', 'e225f8ac45bc47c938af4e683320b1f9', '2012-09-13 06:35:57', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('a91ef7a9fa7659d2fb281869cc1cbf21', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2011-11-26 21:28:57', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '88.174.111.174'),
('a92e5d8d610dd212a4778e9919d9458b', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-17 07:37:14', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '217.162.205.43'),
('aa0968c421b41448fc7350f140fa6072', '00', '2011-10-12 09:25:41', 'unknown', 'Default Browser - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('aa7a62719f6752355b99b276fba2a5f2', 'ed951d57987e6b7c195ce0ba7d4729d6', '2012-09-13 08:21:15', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('ab44f356a40d6c213c408205d92bcca4', '5a6097a8f128c86769da4e977927a78d', '2013-04-25 01:59:07', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('ab6da3b4ad337b93cdfcfb030c185e30', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 15:29:11', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('ad0e48bf3045de7acf2190b633e4be07', '00', '2011-10-14 22:13:49', 'unknown', 'Default Browser - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('ad64cd6f014ffcb15529c766aaaafe77', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2012-04-15 20:06:53', 'unknown', 'Default Browser - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('adc2cd6169c0a5aaa12d074a91926b97', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-30 17:05:37', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('ae0955880d541a6ead7ab4d2917857b2', '00', '2011-11-23 10:57:31', 'unknown', 'Default Browser - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('ae5d8ec1ad6a69752e585fc99728fde6', '00', '2011-11-23 09:49:15', 'unknown', 'Default Browser - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('ae7244d226cc6413d0b2c5a66f28f662', 'd0d086686399ca9e71b9e941f672e0c7', '2012-09-12 16:01:31', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('ae89634820c28b55b261cc8fe2a0f35f', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-27 05:11:08', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('aec52dff687a7d81ed0484aa68834d37', '79b1b9dc1b338006650c78d3b4919b04', '2011-11-24 21:18:10', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '86.145.229.247'),
('aff9a5ec25f57189a369c550435d3eb3', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-09 10:34:43', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('b06febd53950d439b64a25e0864a1a53', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 14:04:24', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('b1161293f1a8c1cdc4fba0eabb69b6be', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 14:58:08', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('b24e9f7114ae21856fab2165d30a7605', '841ef8a50591e500450e46b20f0071cd', '2012-09-13 12:33:33', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('b2bf247e381a279003cc3c6b17d5cd80', 'a3cefde48284f70b2098d7015e987148', '2012-09-16 11:18:16', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('b464e0729b49a0e9c230aa6b8f7b7ef0', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-30 15:25:19', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('b59708d55049093f8ca8603a5707221d', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2012-04-14 12:13:55', 'unknown', 'Default Browser - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('b5afd9a7219941807856e19447d821cc', '00', '2012-09-19 15:23:14', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('b5db9f0da135ada66f5cfda00a77cf7a', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 15:29:22', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('b71d53226d6bcf6ef226113b7c843c8f', '871aafc5183b46241b988e1ae13f3501', '2013-11-22 10:52:21', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '10.8.0.6'),
('b7b6287743ede31c590af9dcc709bc8b', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-04 04:54:31', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('b831b9745c477963f4293d92ff747d9b', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2012-01-13 22:35:01', 'unknown', 'Default Browser - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('b967e1677c1699d51f09e7b59637aebd', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-25 20:31:31', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,fr;q=0.6', '217.162.205.43'),
('b999825c3dc95dea6442db2a37722770', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 15:26:08', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('b9a79f210aac4e82cd63407ab8624024', 'a3cefde48284f70b2098d7015e987148', '2013-11-22 09:47:08', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '10.8.0.6'),
('b9bac20505fc502abf0bb7ddf282c4fd', '11b25d42972af71f6b9c3c3466b81100', '2012-09-12 15:33:14', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('ba09109a467c2950b9e1450abd54565c', 'a3ab9fc930381fe666d8a1a7cf1035de', '2012-09-12 13:12:34', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('ba11cb13ae558972ed2603c69386cefd', 'a3cefde48284f70b2098d7015e987148', '2013-05-30 11:26:15', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('ba79d055a2b18c94d00dc738814e7f8a', '00', '2011-10-12 08:20:01', 'unknown', 'Default Browser - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('bb73ba31746f53b37d78545f920e9a2e', 'a3cefde48284f70b2098d7015e987148', '2013-04-17 02:52:06', '', ' - JS=- Cookies=', 'fr-fr', '217.162.205.43'),
('bc6f3180337b850b56272e3cf7ca76a6', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2012-01-18 09:50:40', 'unknown', 'Default Browser - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('bd21afc2327506b157eba5a6026466ed', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-08-21 15:39:34', 'Win7', 'IE - JS=1- Cookies=1', 'fr-ch', '::1'),
('be3085f9a76030cef41c1e51d5dd436a', '871aafc5183b46241b988e1ae13f3501', '2013-11-23 07:28:45', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('bed9dd16864004f3af52eb265ee4392d', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2012-04-14 12:12:06', 'Win7', 'IE - JS=1- Cookies=1', 'fr-ch', '::1'),
('bfdec734bcbfa8751fd9160d8a29c919', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-18 11:53:37', '', ' - JS=- Cookies=', 'en-GB,en;q=0.8,en-US;q=0.6,fr;q=0.4', '86.181.38.97'),
('c075ae01c504911ed35e1d84b0cca0d1', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-04 11:49:24', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('c0d7de9c83192741e5c3f64033ed63db', '871aafc5183b46241b988e1ae13f3501', '2013-11-22 14:53:45', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '10.8.0.6'),
('c1193456c5f3179bb2b642bb1b5aa321', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2012-04-14 13:30:05', 'Win7', 'IE - JS=1- Cookies=1', 'fr-ch', '::1'),
('c16c8108c49c55a33ebb407e6d939124', '5a6097a8f128c86769da4e977927a78d', '2013-09-08 19:24:46', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('c26f479472787e0ab5cc705db291ea26', '00', '2011-11-01 17:32:12', 'Win7', 'Firefox - JS=1- Cookies=1', 'en-gb,en;q=0.5', '::1'),
('c2a342605fff1480e6de3ddf2b21f0fa', '66283ee137504a410c2c40a3426770e5', '2012-09-12 13:20:05', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('c2bace7bd5ec46016c9531cef3979e5f', 'f7a5c01ea63f9176ff7352da1b5dcaa5', '2012-11-27 21:57:38', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '90.46.103.138'),
('c35dac130ec7860fc6438bcd830b21f5', '616389b89c369c591118fd7e3014fd69', '2012-09-12 13:57:23', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1');
INSERT INTO `user_log` (`id_usrlog`, `id_usr_usrlog`, `date_usrlog`, `os_usrlog`, `browser_usrlog`, `language_usrlog`, `ip_usrlog`) VALUES
('c3d11be6438ca9259083d5151dede985', '00', '2011-10-12 17:08:18', 'unknown', 'Default Browser - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('c3e670681e2e551df789617b22d47235', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-18 11:28:15', '', ' - JS=- Cookies=', 'en-GB,en;q=0.8,en-US;q=0.6,fr;q=0.4', '86.181.38.97'),
('c44fc0ae6c4f1cee4089d3f8d4e7f7fe', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-09-30 01:38:28', 'Win7', 'IE - JS=1- Cookies=1', 'fr-CH', '::1'),
('c472dc2f1ff9c6c6540cf55b8e20744c', 'bdb232ba42790154368b26cd87123485', '2012-09-12 16:05:17', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('c5b0a59e58541ef76ec2283c8729e8b4', 'f5ec6bf1ccac85ed3fdd7ba5874f46e3', '2012-09-12 16:03:16', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('c6341feaaf0e1cc18c6938d2811bd9a7', '601ad00ff3fd3fbe976ec083282f6785', '2012-09-12 14:25:54', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('c647360da2f372e033f572995f93a0f2', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-05 13:56:09', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '217.162.205.43'),
('c79df208521320ac48726e07cde16a7e', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-09 10:39:24', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('c7da296cfe8315c98c28f4b158944599', '871aafc5183b46241b988e1ae13f3501', '2013-11-23 09:05:42', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('c91430031e66d619ffd1452a42b6f8b4', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 15:28:27', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('c928ac889be771f44df86e4de21b7b54', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-09 10:34:05', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('c9b9f73cce045ce0dde1f56da81fb51f', 'a530b55030587b46519449c39181d1b8', '2013-05-30 15:01:02', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('cb23f6208f3f9213d36d4aa5fcadb0f8', 'a3cefde48284f70b2098d7015e987148', '2013-11-22 09:47:13', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '10.8.0.6'),
('cb9fda5a7e792cb8d9cb46472e6f527d', '63e6f927fffd663cf6c29323c39ceffd', '2012-09-12 15:59:58', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('cc5ad8eb0aba5d20e46fd1b975a76de7', '00', '2012-09-11 11:45:47', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('ccc37f9e39126abce7c8d4674c1e6fe6', '00', '2011-11-23 09:49:22', 'unknown', 'Default Browser - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('cce318eee9bc1d4690f2e7c78b66bfa7', '871aafc5183b46241b988e1ae13f3501', '2013-11-23 06:00:25', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('cd22fdf8ff7d2c6b2c551e6f1fcdabca', '5a6097a8f128c86769da4e977927a78d', '2013-09-14 17:52:53', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '197.27.6.181'),
('cd3a305785b28d9c9d834991e037b558', 'a3cefde48284f70b2098d7015e987148', '2013-10-24 02:09:59', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('cdc0cbcd806af0fa9840fa1a428d131f', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-16 11:45:24', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('ce36b76e76f13ebfa3b0805c49603f02', 'da6eb119a5946651373257deb33848c7', '2012-09-12 13:44:06', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('cf08976075695bfe144a4a9a4779979f', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 14:00:17', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('d012488fc6d6271575df49888d8b86fb', 'a6b43a385c41704ec881291e7ac5d889', '2012-09-11 15:53:50', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('d01a284840ae2c7779f0171efa6a5e08', '00', '2011-10-12 08:25:37', 'unknown', 'Default Browser - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('d295423b492bdcf6bec7a04d2766ec4d', 'e1aa4f724cf384a08db7674e2d834495', '2012-09-12 16:04:25', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('d29e13715aadfffc0ae38735d8324a43', '9dc4cd2d6c07049b21ccb1b21bfadbf8', '2012-11-27 21:24:25', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '90.46.103.138'),
('d369f974cf80339ff1f5ae0a49c7485b', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-04 12:57:11', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '10.8.0.6'),
('d3f785e5d6d9a772eaf481b4fc7a7e49', '5a6097a8f128c86769da4e977927a78d', '2013-04-24 14:34:13', '', ' - JS=- Cookies=', 'fr-fr', '217.162.205.43'),
('d4c701324029e94441949e75d8173056', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-08-26 20:24:57', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('d4ca1d1db845117797ed415abf3043c0', '79b1b9dc1b338006650c78d3b4919b04', '2013-05-31 11:15:46', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('d5c7a7132c927aa99596e5b860d55623', '5a6097a8f128c86769da4e977927a78d', '2013-11-24 10:33:54', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('d696c777889350b8f4f872f80784676a', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-16 14:14:38', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '10.8.0.6'),
('d700e46d53ce2dd18e6d1fa2901aa5f2', '178cd2f3df2d88613b46bb6e96a77f3a', '2013-06-02 13:23:27', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('d73f465f730571b01e2e2bd9e2f3b19d', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-16 23:22:41', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '217.162.205.43'),
('d7ce763117886aabfe135dea9babc027', '3af1b9d33a52f996f4542d3eb2c9c4a6', '2012-09-12 14:09:43', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('d7cea8697397058a1c1a854823b5bb96', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-08-29 19:27:07', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('d83ad9e253b566d2ac48d6804593d393', '871aafc5183b46241b988e1ae13f3501', '2013-11-24 15:57:51', '', ' - JS=- Cookies=', 'en-us', '::1'),
('d8412f20b66a5ae7d583da32411b5de5', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2012-09-30 01:07:18', 'Win7', 'IE - JS=1- Cookies=1', 'fr-CH', '::1'),
('d8d58988a89d60759bda307817f70f31', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-16 11:36:27', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('d8df3d8cde536f18e6526de0e57745ce', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2012-03-17 20:23:34', 'unknown', 'Default Browser - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('d987aa17a43d594702f9733b851ad88e', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 15:25:26', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('d9fc40426590faec9b9f03e3fbc77217', '946c758dc32eef257aed87d879fe41d1', '2012-09-12 13:30:31', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('da661b5789a9766a4a4292400f1c54fb', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-25 11:28:16', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '90.46.103.138'),
('dacc39791c13c80c76fbca87bb8192ba', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-18 12:43:35', '', ' - JS=- Cookies=', 'en-GB,en;q=0.8,en-US;q=0.6,fr;q=0.4', '86.181.38.97'),
('dbb4b5f003e2562f750c1e10a34290fb', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-03 23:15:52', '', ' - JS=- Cookies=', 'fr-fr', '::1'),
('dc9d6e2136ee859515f5f832cba9e7d5', '894b122ddbc96e7048df42f5a4e7e807', '2012-09-12 15:35:33', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('dd4512cd569f80a41eecec7ec365b06e', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-01 15:33:58', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('dd76b80dfd9a69972d4c5e9eb5b2406c', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 13:28:11', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('dd84b33f6d5ae8581a7f502bbe2eb2df', '5a6097a8f128c86769da4e977927a78d', '2013-04-28 09:36:11', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('ddbd3cf9e6793be960d88e60567a4046', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-28 20:45:23', '', ' - JS=- Cookies=', 'en-GB,en;q=0.8,en-US;q=0.6,fr;q=0.4', '81.157.52.55'),
('dea94d4ea68188fbf6010e9b5321d7ed', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-08-23 01:20:51', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('e12a4727c8e781303b4b2ae382442702', 'bf9e70e37e759e2a53a7e8b7191b3c8b', '2012-09-13 12:56:27', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('e172c579de7ffb4ae2012abe5572d491', '871aafc5183b46241b988e1ae13f3501', '2013-11-23 07:26:15', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('e3c353d3b15093120dfbdc65f9290abf', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-29 15:00:16', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '109.164.218.48'),
('e3f93937a553ae7495451e4a9999c8a0', '871aafc5183b46241b988e1ae13f3501', '2013-11-23 07:25:34', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('e4d0b79f6a461b62429de5c7f1562769', '6c3c85ad3057f142d3aa7f34bbe7bbb1', '2012-09-12 14:14:58', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('e52be1b33e49b3ef0e73eaeac43278e6', '5a6097a8f128c86769da4e977927a78d', '2013-11-24 11:15:07', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('e5c0084f7aaf4d000365c42ba41be6cf', '5a6097a8f128c86769da4e977927a78d', '2013-11-24 11:11:07', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('e65c30a66824bbd4c818d487101e0b85', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 15:28:14', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('e709e8386bd3ada279b1a221ec60fbf5', 'a3cefde48284f70b2098d7015e987148', '2012-09-14 15:04:19', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('e889c4cadaeeaae038388c233370099f', '178cd2f3df2d88613b46bb6e96a77f3a', '2011-11-25 09:30:06', '', ' - JS=- Cookies=', 'en-us,en;q=0.5', '129.132.221.167'),
('e920088c32b3e023ca3e7efb9aef8528', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 13:47:38', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('ea78945c8c66fa17dacb75c69e4996b5', '586671f519ce766cc5bfaffe8c4c0963', '2012-09-13 11:31:56', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('ebd25e0faec60967dd2cb95f380a485f', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-18 12:05:22', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '217.162.205.43'),
('ec21a995da310d92fa1585384f681994', 'a530b55030587b46519449c39181d1b8', '2013-05-30 16:50:17', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('ed5b5efbc9ef7e2db34f93ca841296a2', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-11-13 10:53:31', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '217.162.205.43'),
('edbfe6911dc7119e422448d1015d231b', '0fbef09a987b7a2f6f5aad18a31a5c43', '2012-11-27 21:14:37', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '217.162.205.43'),
('ef25a1ecb99789896af34b22d2894f16', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-08-21 20:46:50', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('efad4a5cf29b35e3e91c96805851fcba', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-26 21:28:35', '', ' - JS=- Cookies=', 'fr,fr-fr;q=0.8,en-us;q=0.5,en;q=0.3', '88.174.111.174'),
('eff6b67ae7ead0ecd87b397303255773', 'd1f254057a12848c8ac453d752a4a51b', '2012-09-12 13:41:31', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('f19b4d6d71e5f610e01e068ad43b2925', '79b1b9dc1b338006650c78d3b4919b04', '2012-11-03 10:11:34', '', ' - JS=- Cookies=', 'fr-fr', '::1'),
('f1b78270f44df0f72d6121e2de207850', '6b2e63b1fd55069fb7cb35fb60f61ed7', '2013-05-30 16:49:59', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('f2606b185da12c6c036d3fa55dc9e2c1', '5a6097a8f128c86769da4e977927a78d', '2013-11-24 10:49:59', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('f56f179d6e6c6f3cc01c3ff74c281d85', 'd4b41947b67949fed02d6456c341e98d', '2012-09-11 15:57:10', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('f5f0782918c44727af467d4f9b2e2970', '5a6097a8f128c86769da4e977927a78d', '2013-11-24 11:13:54', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('f616019fc428074817c2ecfa103b9217', '5a6097a8f128c86769da4e977927a78d', '2013-11-24 10:47:23', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('f6a9b432356e46494cb7faaad4f5ae73', '9db5b63f3418f6e2a3092b8dea45b530', '2012-09-12 16:03:25', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('f706535811a113c5ad41eed1bfb9f997', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-09 11:33:00', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('f70f4cb37f7b5d759c76f1b1c6655269', '37814d93e823ef15861dce164db4cb7d', '2012-09-12 14:32:00', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('f74d4845b8c990ae5c7d6d057bdb0708', '41f48906262cfad9b4c41613ffcc6cb0', '2012-09-12 14:52:55', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('f7bfe6142b0c450a98b665243d874f29', '73e31667472c841d31b679f9683dab6f', '2012-09-13 06:29:36', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('f7f823ce4ea28ea09faf78bbcd891832', 'a3cefde48284f70b2098d7015e987148', '2012-09-16 09:16:56', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('f8479f7a71ef254f1606d713e7730e40', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-09-30 01:06:26', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('f85e05f63c0f767dfacd35ad68811ce8', '133a86ce8a41daeff7bf37f618ef770d', '2012-09-13 06:39:40', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('fc65386ca98714ce56522ab29823270b', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-01 16:42:41', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('fca3bb48eb35f0d81b058df64c30ce35', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2011-11-23 14:04:35', '', ' - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '85.5.224.99'),
('fd21a3f1e410fb051fcbd6c73d1a1a7f', '5a6097a8f128c86769da4e977927a78d', '2013-11-24 10:01:43', '', ' - JS=- Cookies=', 'en-US,en;q=0.8,de;q=0.6', '::1'),
('fd47b5e5036cba5fe0e3414cf1beee93', '5a6097a8f128c86769da4e977927a78d', '2013-04-28 02:44:45', '', ' - JS=- Cookies=', 'en,fr-FR;q=0.8,fr;q=0.6,en-US;q=0.4', '217.162.205.43'),
('fd581d777875226feb95797e3f584ab5', 'c3471df50ab74b88119f5c7d5327131d', '2012-09-12 16:58:33', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('fd8b6ef63943dae92ffe42d0e0e0ad51', '7613d36b2c3ba668fb03d2bd2cc6b3cc', '2012-01-26 21:57:32', 'unknown', 'Default Browser - JS=- Cookies=', 'de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('fd9cb85305cb9c25b8b11780adced249', '00c28b25326d55eeb28a5ced60a51925', '2012-09-13 06:15:58', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('fe5558f94ffaa79fffcb85784679fef1', '7d6653aaa16976e12b6cf7c774f83c1f', '2012-10-28 10:03:59', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1'),
('fe79ac5339389333a31aa6c887d61674', '79b1b9dc1b338006650c78d3b4919b04', '2011-11-23 22:47:56', '', ' - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '86.145.229.247'),
('ff270141bfe8b738b8a2eb8f41cceecd', 'd090b2fecfda936d0c6bb16eade51d8f', '2012-09-12 16:20:42', 'unknown', 'Default Browser - JS=- Cookies=', 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `user_more`
--

CREATE TABLE `user_more` (
  `id_usr_mor` varchar(32) CHARACTER SET utf8 NOT NULL,
  `desc_mor` text CHARACTER SET utf8 NOT NULL,
  `nbresult_mor` enum('5','10','20','30','50') CHARACTER SET utf8 NOT NULL DEFAULT '10',
  `msg_notification_mor` enum('Y','N') CHARACTER SET utf8 NOT NULL DEFAULT 'Y',
  `fb_connect_mor` enum('Y','N') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `fb_oauth_token_mor` varchar(256) CHARACTER SET utf8 NOT NULL,
  `fb_app_token_mor` varchar(356) CHARACTER SET utf8 NOT NULL,
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

--
-- Dumping data for table `user_more`
--

INSERT INTO `user_more` (`id_usr_mor`, `desc_mor`, `nbresult_mor`, `msg_notification_mor`, `fb_connect_mor`, `fb_oauth_token_mor`, `fb_app_token_mor`, `fb_nb_invite_mor`, `fb_autopost_mor`, `tw_connect_mor`, `tw_oauth_token_mor`, `tw_oauth_token_secret_mor`, `tw_autopost_mor`, `go_oauth_token_mor`) VALUES
('00', '', '10', 'Y', 'N', '', '', '', 'N', 'N', '', '', 'N', ''),
('0fbef09a987b7a2f6f5aad18a31a5c43', '', '10', 'Y', 'N', '', '', '', 'N', 'N', '', '', 'N', ''),
('178cd2f3df2d88613b46bb6e96a77f3a', '', '10', 'Y', 'N', '', '', '', 'N', 'N', '', '', 'N', ''),
('1b5d5518c800d0929e8d072ff556638b', '', '10', 'Y', 'N', '', '', '', 'N', 'N', '', '', 'N', ''),
('1df9e06e56cdc06289a2068cf52cd611', '', '10', 'Y', 'N', '', '', '', 'N', 'N', '', '', 'N', ''),
('2bd8063bffa0986bfbe7e265cfba8a63', '', '10', 'Y', 'N', '', '', '', 'N', 'N', '', '', 'N', ''),
('48ae9648a43e3633ae647c2583d84116', '', '10', 'Y', 'N', '', '', '', 'N', 'N', '', '', 'N', ''),
('53fa70efac048b82ca1f1c2cc8811b49', '', '10', 'Y', 'N', '', '', '', 'N', 'N', '', '', 'N', ''),
('5a6097a8f128c86769da4e977927a78d', '', '10', 'Y', 'N', 'CAACvE5CIkywBAC1gDIdtuP9BoYOVslaal3jSZBNeVBBbfnJJ38WveB8SFdqIwk51qYbEtpeU3pNwmRyyLIuLVaL4YC1zo1cnHHzCxgj7ZCDUZB1c3sMZADhsGgl7WDVm6ym9aXngD1VAvrMAL9EkRZCXN8q9ZB8VeF6KqQIrOGMSuZCZAmfE91YZCQFhSUeoKv92rLSp68HQV4gZDZD', '192498564109100|5d68fafb4287dda997b443ccbefbd66f', '', 'N', 'N', '', '', 'N', ''),
('68974baae78d9ffe6f36a9be46db5b5c', '', '10', 'Y', 'N', '', '', '', 'N', 'N', '', '', 'N', ''),
('6b2e63b1fd55069fb7cb35fb60f61ed7', '', '10', 'Y', 'N', '', '', '', 'N', 'N', '', '', 'N', ''),
('79b1b9dc1b338006650c78d3b4919b04', '', '10', 'Y', 'N', '', '', '', 'N', 'N', '', '', 'N', ''),
('7d6653aaa16976e12b6cf7c774f83c1f', '', '5', 'Y', 'N', '', '', '', 'N', 'N', '', '', 'N', ''),
('841ef8a50591e500450e46b20f0071cd', '', '10', 'Y', 'N', '', '', '', 'N', 'N', '', '', 'N', ''),
('871aafc5183b46241b988e1ae13f3501', '', '10', 'Y', 'N', 'CAACvE5CIkywBAMPRJAnD7k3XqWEZC6ZAFMZBIor1SFhJM7WGs23E2sZA2fiQCupS0GBoYwsYTPlZA0v3zMKZCA7FOpv1pgDiZAhB7XxWYgn40MdTdCDfR5PqqxEin5CCiAcLyO89JFz5qyGWszGaXq4a3bM38ZAZBnrg6sfidoAlpYVn1lYsWktEY72T8ZAD6a38kZD', '192498564109100|5d68fafb4287dda997b443ccbefbd66f', '', 'N', 'N', '', '', 'N', ''),
('941af2c99f4f7895b481ab9c3261e4ee', '', '10', 'Y', 'N', '', '', '', 'N', 'N', '', '', 'N', ''),
('9dc4cd2d6c07049b21ccb1b21bfadbf8', '', '10', 'Y', 'N', '', '', '', 'N', 'N', '', '', 'N', ''),
('a3cefde48284f70b2098d7015e987148', '', '10', 'Y', 'N', '', '', '', 'N', 'N', '', '', 'N', ''),
('a530b55030587b46519449c39181d1b8', '', '20', 'Y', 'N', '', '', '', 'N', 'N', '', '', 'N', ''),
('f7a5c01ea63f9176ff7352da1b5dcaa5', '', '10', 'Y', 'N', '', '', '', 'N', 'N', '', '', 'N', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_network`
--

CREATE TABLE `user_network` (
  `id_usr_usrnet` varchar(32) NOT NULL DEFAULT '',
  `id_net_usrnet` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_usr_usrnet`,`id_net_usrnet`),
  KEY `user_network_ibfk_2` (`id_net_usrnet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_presta`
--

CREATE TABLE `user_presta` (
  `id_usr_presta` varchar(32) NOT NULL,
  `level_presta` enum('JUNIOR','INTERMEDIATE','EXPERT') NOT NULL DEFAULT 'JUNIOR',
  `job_presta` varchar(124) NOT NULL,
  `yearsexp_presta` smallint(2) NOT NULL DEFAULT '0',
  `calendar_presta` varchar(118) NOT NULL DEFAULT '0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000000000000',
  PRIMARY KEY (`id_usr_presta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des travailleurs';

--
-- Dumping data for table `user_presta`
--

INSERT INTO `user_presta` (`id_usr_presta`, `level_presta`, `job_presta`, `yearsexp_presta`, `calendar_presta`) VALUES
('00', 'JUNIOR', '', 0, '0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000000000000'),
('0fbef09a987b7a2f6f5aad18a31a5c43', 'JUNIOR', '', 0, '0000000000000000,0000111111111110,0000111110000000,0000111110000000,0000111110000000,0000000000000000,0000000000000000'),
('5a6097a8f128c86769da4e977927a78d', 'JUNIOR', '', 0, '0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000000000000'),
('6b2e63b1fd55069fb7cb35fb60f61ed7', 'JUNIOR', '', 0, '0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000000000000'),
('79b1b9dc1b338006650c78d3b4919b04', 'INTERMEDIATE', '', 5, '0011111111110000,0011111111110000,0011111111110000,0011111111110000,0011111111110000,0000000000000000,0000000000000000'),
('7d6653aaa16976e12b6cf7c774f83c1f', 'JUNIOR', '', 0, '0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000000000000'),
('941af2c99f4f7895b481ab9c3261e4ee', 'JUNIOR', '', 0, '0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000000000000'),
('a3cefde48284f70b2098d7015e987148', 'JUNIOR', '', 0, '0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000000000000'),
('f7a5c01ea63f9176ff7352da1b5dcaa5', 'INTERMEDIATE', 'Consultant en organisation et conduite du changement', 0, '0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000011111111,0000000000000000');

-- --------------------------------------------------------

--
-- Table structure for table `user_spot`
--

CREATE TABLE `user_spot` (
  `id_usr_usrspt` varchar(32) NOT NULL,
  `id_spt_usrspt` varchar(32) NOT NULL,
  `title_usrspt` varchar(100) NOT NULL,
  PRIMARY KEY (`id_usr_usrspt`,`id_spt_usrspt`),
  KEY `user_spot_ibfk_2` (`id_spt_usrspt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_user`
--

CREATE TABLE `user_user` (
  `id_follower_usrusr` varchar(32) NOT NULL,
  `id_followed_usrusr` varchar(32) NOT NULL,
  `status_usrusr` enum('0','F','W','A') NOT NULL DEFAULT '0',
  `date_usrusr` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_follower_usrusr`,`id_followed_usrusr`),
  KEY `status_usrusr` (`status_usrusr`),
  KEY `user_user_ibfk_2` (`id_followed_usrusr`),
  KEY `date_usrusr` (`date_usrusr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_user`
--

INSERT INTO `user_user` (`id_follower_usrusr`, `id_followed_usrusr`, `status_usrusr`, `date_usrusr`) VALUES
('178cd2f3df2d88613b46bb6e96a77f3a', '79b1b9dc1b338006650c78d3b4919b04', 'F', '0000-00-00 00:00:00'),
('48ae9648a43e3633ae647c2583d84116', '79b1b9dc1b338006650c78d3b4919b04', 'F', '0000-00-00 00:00:00'),
('53fa70efac048b82ca1f1c2cc8811b49', '79b1b9dc1b338006650c78d3b4919b04', 'F', '0000-00-00 00:00:00'),
('5a6097a8f128c86769da4e977927a78d', '48ae9648a43e3633ae647c2583d84116', 'F', '2013-04-19 07:45:53'),
('5a6097a8f128c86769da4e977927a78d', '841ef8a50591e500450e46b20f0071cd', 'F', '2013-04-19 07:45:51'),
('5a6097a8f128c86769da4e977927a78d', 'a3cefde48284f70b2098d7015e987148', 'F', '2013-04-19 07:45:49'),
('5a6097a8f128c86769da4e977927a78d', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'W', '2013-04-28 07:48:06'),
('6b2e63b1fd55069fb7cb35fb60f61ed7', '79b1b9dc1b338006650c78d3b4919b04', 'A', '2013-05-30 14:45:47'),
('6b2e63b1fd55069fb7cb35fb60f61ed7', '7d6653aaa16976e12b6cf7c774f83c1f', 'W', '2012-10-01 10:33:12'),
('6b2e63b1fd55069fb7cb35fb60f61ed7', 'a3cefde48284f70b2098d7015e987148', '0', '0000-00-00 00:00:00'),
('79b1b9dc1b338006650c78d3b4919b04', '178cd2f3df2d88613b46bb6e96a77f3a', 'W', '0000-00-00 00:00:00'),
('79b1b9dc1b338006650c78d3b4919b04', '48ae9648a43e3633ae647c2583d84116', 'W', '2012-11-14 23:04:37'),
('79b1b9dc1b338006650c78d3b4919b04', '53fa70efac048b82ca1f1c2cc8811b49', '0', '0000-00-00 00:00:00'),
('79b1b9dc1b338006650c78d3b4919b04', '6b2e63b1fd55069fb7cb35fb60f61ed7', 'A', '2013-05-30 14:45:47'),
('79b1b9dc1b338006650c78d3b4919b04', '7d6653aaa16976e12b6cf7c774f83c1f', 'A', '2012-11-18 11:16:21'),
('79b1b9dc1b338006650c78d3b4919b04', 'a530b55030587b46519449c39181d1b8', 'A', '2013-05-31 09:19:22'),
('7d6653aaa16976e12b6cf7c774f83c1f', '6b2e63b1fd55069fb7cb35fb60f61ed7', 'F', '2012-10-01 10:33:11'),
('7d6653aaa16976e12b6cf7c774f83c1f', '79b1b9dc1b338006650c78d3b4919b04', 'A', '2012-11-18 11:16:21'),
('7d6653aaa16976e12b6cf7c774f83c1f', '841ef8a50591e500450e46b20f0071cd', '0', '0000-00-00 00:00:00'),
('7d6653aaa16976e12b6cf7c774f83c1f', 'a3cefde48284f70b2098d7015e987148', '0', '2012-11-25 10:15:25'),
('841ef8a50591e500450e46b20f0071cd', '7d6653aaa16976e12b6cf7c774f83c1f', '0', '0000-00-00 00:00:00'),
('a3cefde48284f70b2098d7015e987148', '178cd2f3df2d88613b46bb6e96a77f3a', 'F', '0000-00-00 00:00:00'),
('a3cefde48284f70b2098d7015e987148', '6b2e63b1fd55069fb7cb35fb60f61ed7', 'F', '0000-00-00 00:00:00'),
('a3cefde48284f70b2098d7015e987148', '7d6653aaa16976e12b6cf7c774f83c1f', 'F', '2012-11-25 10:15:25'),
('a3cefde48284f70b2098d7015e987148', '841ef8a50591e500450e46b20f0071cd', 'F', '0000-00-00 00:00:00'),
('a3cefde48284f70b2098d7015e987148', 'a530b55030587b46519449c39181d1b8', 'F', '0000-00-00 00:00:00'),
('a530b55030587b46519449c39181d1b8', '178cd2f3df2d88613b46bb6e96a77f3a', 'F', '2013-05-31 09:03:40'),
('a530b55030587b46519449c39181d1b8', '48ae9648a43e3633ae647c2583d84116', 'F', '2013-05-31 09:03:59'),
('a530b55030587b46519449c39181d1b8', '5a6097a8f128c86769da4e977927a78d', 'F', '2013-05-30 08:51:05'),
('a530b55030587b46519449c39181d1b8', '6b2e63b1fd55069fb7cb35fb60f61ed7', 'F', '2013-05-30 08:51:11'),
('a530b55030587b46519449c39181d1b8', '79b1b9dc1b338006650c78d3b4919b04', 'A', '2013-05-31 09:19:22'),
('a530b55030587b46519449c39181d1b8', 'f7a5c01ea63f9176ff7352da1b5dcaa5', 'F', '2013-05-30 08:51:11');

-- --------------------------------------------------------

--
-- Table structure for table `user_website`
--

CREATE TABLE `user_website` (
  `id_usrweb` varchar(32) NOT NULL,
  `id_usr_usrweb` varchar(32) DEFAULT NULL,
  `url_usrweb` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_usrweb`),
  KEY `id_usr_usrweb` (`id_usr_usrweb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_website`
--

INSERT INTO `user_website` (`id_usrweb`, `id_usr_usrweb`, `url_usrweb`) VALUES
('138b0c8e34dadebad96d5f990769bf42', '7613d36b2c3ba668fb03d2bd2cc6b3cc', 'www.facebook.com');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_activity`
--
CREATE TABLE `view_activity` (
`pid_vac` int(11)
,`id_vac` varchar(32)
,`id_usr_vac` varchar(32)
,`date_vac` datetime
,`type_vac` enum('NW','AV','CR','OF','QU','FU','PU','LU','LA','CU','GB','RB','WB')
,`related_vac` text
,`flux_vac` enum('JB','SV','NE')
,`inflow_vac` int(1)
,`wall_usr_vac` varchar(32)
,`privacy_vac` enum('P','G','R')
,`id_spt_vac` varchar(32)
,`media_vac` text
,`holder_usr_vac` varchar(32)
,`title_vac` varchar(250)
,`views_vac` int(3) unsigned
,`featured_vac` tinyint(1) unsigned
,`desc_vac` text
,`shortdesc_vac` varchar(250)
,`thumbnail_vac` varchar(250)
,`deleted_vac` int(1)
,`lang_vac` varchar(2)
,`paie_vac` int(11)
,`currency_vac` varchar(3)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `view_customer`
--
CREATE TABLE `view_customer` (
`id_usr_custo` varchar(32)
,`job_custo` varchar(124)
,`price_custo` double
,`amont_custo` double
,`frequency_custo` enum('-','D','H')
,`currency_custo` varchar(3)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `view_presta`
--
CREATE TABLE `view_presta` (
`id_usr_presta` varchar(32)
,`level_presta` enum('JUNIOR','INTERMEDIATE','EXPERT')
,`job_presta` varchar(124)
,`yearsexp_presta` smallint(2)
,`calendar_presta` varchar(118)
,`price_presta` double
,`amont_presta` double
,`frequency_presta` enum('-','D','H')
,`currency_presta` varchar(3)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `view_user`
--
CREATE TABLE `view_user` (
`id_usr` varchar(32)
,`profil_usr` enum('P','C','B','N')
,`status_usr` tinyint(2)
,`level_usr` enum('JUNIOR','INTERMEDIATE','EXPERT')
,`activate_code_usr` varchar(32)
,`regdate_usr` datetime
,`url_usr` varchar(45)
,`privacy_usr` enum('P','R')
,`fullname_usr` varchar(120)
,`lang_usr` varchar(3)
,`gender_usr` enum('M','F')
,`birthdate_usr` date
,`shortdesc_usr` varchar(700)
,`email_usr` varchar(45)
,`phone_usr` varchar(45)
,`mobile_usr` varchar(45)
,`password_usr` varchar(40)
,`nation_usr` varchar(124)
,`id_spt_usr` varchar(32)
,`activ_nby` tinyint(1)
,`mode_nby` enum('A','S','R')
,`views_usr` int(11) unsigned
,`id_img_usr` varchar(32)
,`fb_id_usr` varchar(20)
,`id_usr_custo` varchar(32)
,`job_custo` varchar(124)
,`price_custo` double
,`amont_custo` double
,`frequency_custo` enum('-','D','H')
,`currency_custo` varchar(3)
,`id_usr_presta` varchar(32)
,`level_presta` enum('JUNIOR','INTERMEDIATE','EXPERT')
,`job_presta` varchar(124)
,`yearsexp_presta` smallint(2)
,`calendar_presta` varchar(118)
,`price_presta` double
,`amont_presta` double
,`frequency_presta` enum('-','D','H')
,`currency_presta` varchar(3)
);
-- --------------------------------------------------------

--
-- Structure for view `im_view_friends`
--
DROP TABLE IF EXISTS `im_view_friends`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `im_view_friends` AS select `u`.`pid_usr` AS `user_id`,`f`.`pid_usr` AS `friend_id`,if((`user_user`.`status_usrusr` = 'A'),2,1) AS `group_id` from ((`user_user` join `user` `u` on((`user_user`.`id_followed_usrusr` = `u`.`id_usr`))) join `user` `f` on((`user_user`.`id_follower_usrusr` = `f`.`id_usr`))) where (`user_user`.`status_usrusr` in ('F','W','A'));

-- --------------------------------------------------------

--
-- Structure for view `im_view_groups`
--
DROP TABLE IF EXISTS `im_view_groups`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `im_view_groups` AS select 1 AS `group_id`,'My Followers' AS `name` union select 2 AS `group_id`,'Mes Collaborators' AS `name`;

-- --------------------------------------------------------

--
-- Structure for view `im_view_status`
--
DROP TABLE IF EXISTS `im_view_status`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `im_view_status` AS select `user`.`pid_usr` AS `user_id`,0 AS `status`,'offline' AS `message` from `user` where (`user`.`last_activity_usr` < (now() - interval 15 minute)) union select `user`.`pid_usr` AS `user_id`,(case `user`.`status_usr` when 2 then 1 when 3 then 1 when 4 then 2 else 0 end) AS `status`,(case `user`.`status_usr` when 2 then 'Disponible' when 3 then 'Disponible' when 4 then 'Non-disponible' else 'offline' end) AS `message` from `user` where (`user`.`last_activity_usr` >= (now() - interval 15 minute));

-- --------------------------------------------------------

--
-- Structure for view `im_view_users`
--
DROP TABLE IF EXISTS `im_view_users`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `im_view_users` AS select `user`.`pid_usr` AS `user_id`,`user`.`url_usr` AS `username`,`user`.`password_usr` AS `password`,'127.0.0.1' AS `last_known_ip`,`user`.`last_activity_usr` AS `last_login` from `user`;

-- --------------------------------------------------------

--
-- Structure for view `view_activity`
--
DROP TABLE IF EXISTS `view_activity`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_activity` AS select `a`.`pid_act` AS `pid_vac`,`a`.`id_act` AS `id_vac`,`a`.`id_usr_act` AS `id_usr_vac`,`a`.`date_act` AS `date_vac`,`a`.`type_act` AS `type_vac`,`a`.`related_act` AS `related_vac`,`a`.`flux_act` AS `flux_vac`,`a`.`inflow_act` AS `inflow_vac`,`a`.`wall_usr_act` AS `wall_usr_vac`,`c`.`privacy_cnt` AS `privacy_vac`,`c`.`id_spt_cnt` AS `id_spt_vac`,`c`.`media_cnt` AS `media_vac`,`c`.`holder_usr_cnt` AS `holder_usr_vac`,`c`.`title_cnt` AS `title_vac`,`c`.`views_cnt` AS `views_vac`,`c`.`featured_cnt` AS `featured_vac`,`c`.`desc_cnt` AS `desc_vac`,`c`.`shortdesc_cnt` AS `shortdesc_vac`,`c`.`thumbnail_cnt` AS `thumbnail_vac`,`a`.`deleted_act` AS `deleted_vac`,`a`.`lang_act` AS `lang_vac`,`c`.`paie_cnt` AS `paie_vac`,`c`.`currency_cnt` AS `currency_vac` from (`activity` `a` left join `content` `c` on((`a`.`id_act` = `c`.`id_act_cnt`)));

-- --------------------------------------------------------

--
-- Structure for view `view_customer`
--
DROP TABLE IF EXISTS `view_customer`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_customer` AS select `uc`.`id_usr_custo` AS `id_usr_custo`,`uc`.`job_custo` AS `job_custo`,if((`p`.`amont_pri` > 0),(`c`.`coeff_ccy` / `p`.`amont_pri`),0) AS `price_custo`,if((`p`.`amont_pri` > 0),`p`.`amont_pri`,0) AS `amont_custo`,`p`.`frequency_pri` AS `frequency_custo`,`p`.`currency_pri` AS `currency_custo` from ((`user_custo` `uc` join `price` `p` on(((`uc`.`id_usr_custo` = `p`.`id_usr_pri`) and (`p`.`profil_pri` = 'C')))) join `currency` `c` on((`p`.`currency_pri` = `c`.`unity_ccy`)));

-- --------------------------------------------------------

--
-- Structure for view `view_presta`
--
DROP TABLE IF EXISTS `view_presta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_presta` AS select `up`.`id_usr_presta` AS `id_usr_presta`,`up`.`level_presta` AS `level_presta`,`up`.`job_presta` AS `job_presta`,`up`.`yearsexp_presta` AS `yearsexp_presta`,`up`.`calendar_presta` AS `calendar_presta`,if((`p`.`amont_pri` > 0),(`c`.`coeff_ccy` / `p`.`amont_pri`),0) AS `price_presta`,if((`p`.`amont_pri` > 0),`p`.`amont_pri`,0) AS `amont_presta`,`p`.`frequency_pri` AS `frequency_presta`,`p`.`currency_pri` AS `currency_presta` from ((`user_presta` `up` join `price` `p` on(((`up`.`id_usr_presta` = `p`.`id_usr_pri`) and (`p`.`profil_pri` = 'P')))) join `currency` `c` on((`p`.`currency_pri` = `c`.`unity_ccy`)));

-- --------------------------------------------------------

--
-- Structure for view `view_user`
--
DROP TABLE IF EXISTS `view_user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user` AS select `u`.`id_usr` AS `id_usr`,`u`.`profil_usr` AS `profil_usr`,`u`.`status_usr` AS `status_usr`,`u`.`level_usr` AS `level_usr`,`u`.`activate_code_usr` AS `activate_code_usr`,`u`.`regdate_usr` AS `regdate_usr`,`u`.`url_usr` AS `url_usr`,`u`.`privacy_usr` AS `privacy_usr`,`u`.`fullname_usr` AS `fullname_usr`,`u`.`lang_usr` AS `lang_usr`,`u`.`gender_usr` AS `gender_usr`,`u`.`birthdate_usr` AS `birthdate_usr`,`u`.`shortdesc_usr` AS `shortdesc_usr`,`u`.`email_usr` AS `email_usr`,`u`.`phone_usr` AS `phone_usr`,`u`.`mobile_usr` AS `mobile_usr`,`u`.`password_usr` AS `password_usr`,`u`.`nation_usr` AS `nation_usr`,`u`.`id_spt_usr` AS `id_spt_usr`,`u`.`activ_nby` AS `activ_nby`,`u`.`mode_nby` AS `mode_nby`,`u`.`views_usr` AS `views_usr`,`u`.`id_img_usr` AS `id_img_usr`,`u`.`fb_id_usr` AS `fb_id_usr`,`c`.`id_usr_custo` AS `id_usr_custo`,`c`.`job_custo` AS `job_custo`,`c`.`price_custo` AS `price_custo`,`c`.`amont_custo` AS `amont_custo`,`c`.`frequency_custo` AS `frequency_custo`,`c`.`currency_custo` AS `currency_custo`,`p`.`id_usr_presta` AS `id_usr_presta`,`p`.`level_presta` AS `level_presta`,`p`.`job_presta` AS `job_presta`,`p`.`yearsexp_presta` AS `yearsexp_presta`,`p`.`calendar_presta` AS `calendar_presta`,`p`.`price_presta` AS `price_presta`,`p`.`amont_presta` AS `amont_presta`,`p`.`frequency_presta` AS `frequency_presta`,`p`.`currency_presta` AS `currency_presta` from ((`user` `u` left join `view_customer` `c` on((`u`.`id_usr` = `c`.`id_usr_custo`))) left join `view_presta` `p` on((`u`.`id_usr` = `p`.`id_usr_presta`)));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
