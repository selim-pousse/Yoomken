# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.1.44)
# Database: yoomken.li
# Generation Time: 2013-05-28 12:49:51 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table badge
# ------------------------------------------------------------

DROP TABLE IF EXISTS `badge`;

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

LOCK TABLES `badge` WRITE;
/*!40000 ALTER TABLE `badge` DISABLE KEYS */;

INSERT INTO `badge` (`name_bdg`, `title_bdg`, `desc_bdg`, `rules_bdg`, `type_bdg`, `parent_bdg`, `status_bdg`, `lang_bdg`)
VALUES
	('1user','1st Visitors','People with this badge are the first visitors and users who have had the curiosity to discover our Yoomken network. We thank them because without them  the project would not have been continued.','This badge is unlocked, If you are part in the first 1000 registered user in Yoomken.','ACTION',NULL,1,'en'),
	('1user','1er Visiteurs','Les détenteurs de ce badge sont les premiers visiteurs et utilisateurs qui ont eu la curiosité de découvrir notre réseau Yoomken. De la part de toute l\'équipe, nous les remercions car sans eux le projet Yoomken n\'aurai pas pu être amorçé.','Ce badge vous est débloqué dans le cas oû vous faites partie des 1000 premiers inscrits de Yoomken.','ACTION',NULL,1,'fr'),
	('amical','friendly','People with this badge have good human contact to make friends and to keep them. Their main qualities come from their listening and communication.','','PERS','59aea376bb5a51fa034d8963e2ea815d',1,'en'),
	('amical','amical','Les détenteurs de ce badge ont le sens du contact pour se faire des amis et les entretenir. Leurs principales qualités proviennent de leur écoute et leur communication.','','PERS','59aea376bb5a51fa034d8963e2ea815d',1,'fr'),
	('asdsad','asdsad','asdas','','WISH',NULL,-3,'fr'),
	('assembly','assembly furniture','The holders of this badge has an ease to install the furniture and assemble objects.',NULL,'SKILL','671c9eca7f36118e0e336a9def3fdee0',1,'en'),
	('assembly','Montage & Assemblage','Les titulaires de ce badge possédent une aisance à monter le mobilier et assembler les objets (montage de meuble, pose de parquet etc..). ',NULL,'SKILL','671c9eca7f36118e0e336a9def3fdee0',1,'fr'),
	('attachant','endearing','Endearing people are very appreciated by their relations. This means that people with this badge are in very good position to be supported or to receive help.',NULL,'PERS','59aea376bb5a51fa034d8963e2ea815d',1,'en'),
	('attachant','attachant','Les personnes attachantes sont trés appréciés par leurs relations. Ce qui implique que les detenteurs de ce badge se placent en position trés favorable pour être supporté ou recevoir de l\'aide.',NULL,'PERS','59aea376bb5a51fa034d8963e2ea815d',1,'fr'),
	('balenced','balanced','People with this badge are in harmony between out their workload and their personal stuff. It is obvious to them \"Personal life should interfere rarely with the profesionnal life\".',NULL,'PERS','59aea376bb5a51fa034d8963e2ea815d',1,'en'),
	('balenced','équilibré','Les détenteurs de ce badge sont en harmonie entre leur charge de travail et leur vie personnelle.',NULL,'PERS','59aea376bb5a51fa034d8963e2ea815d',1,'fr'),
	('bodyCare','body care','People with this badge are known to practice satisfactory body care or to follow  body care rituals for themself.',NULL,'SKILL','4f1c6a961dec28865c792b5b2514120c',1,'en'),
	('bodyCare','soin du corps','Les personnes avec ce badge sont reconnues pour pratiquer des soins satisfaisantes sur le corps ou pour suivre eux-même des rituels de soin au quotidien. Dans les deux cas, elles sont suceptibles de partager des idées intéressantes pour entrenir la jeunesse et la beauté du corps.',NULL,'SKILL','4f1c6a961dec28865c792b5b2514120c',1,'fr'),
	('bricoler','DIY','People with this badge have demonstrated outside or inside the professional context they were remarkable in DIY tasks related to the creation, improvement, repair and maintenance of all material things.',NULL,'SKILL','671c9eca7f36118e0e336a9def3fdee0',1,'en'),
	('bricoler','bricolage','Les détenteurs de ce badge ont démontré en tant qu\'amateur ou professionnel qu\'ils étaient remarquables dans les tâches de bricolage liées à la création, l\'amélioration, la réparation et l\'entretien de toutes choses matérielles.',NULL,'SKILL','671c9eca7f36118e0e336a9def3fdee0',1,'fr'),
	('brillant','brilliant','People with this badge have proven they are remarkable in the tasks entrusted to them. Either by showing their understanding and adaptions to the needs of their customers or by providing a perfect result.',NULL,'PERS','5f1c6a961dec28865c792b5b2514120c',1,'en'),
	('brillant','brillant','Les détenteurs de ce badge ont démontré qu\'ils étaient remarquables dans les tâches qui leur sont confiées. Soit en prouvant qu\'ils savaient comprendre et s\'adapter aux besoins de leurs clients ou soit en fournissant un résultat parfait. ',NULL,'PERS','5f1c6a961dec28865c792b5b2514120c',1,'fr'),
	('calme','quiet','',NULL,'PERS','59aea376bb5a51fa034d8963e2ea815d',0,'en'),
	('calme','calme','',NULL,'PERS','59aea376bb5a51fa034d8963e2ea815d',0,'fr'),
	('coiffure','hairdressing','Holders of this badge have demonstrated their skills in the art of arranging and cutting the hair.',NULL,'SKILL','4f1c6a961dec28865c792b5b2514120c',1,'en'),
	('coiffure','coiffure','Les détenteurs de ce badge ont démontré une habileté dans l\'art d\'arranger et couper les cheveux.',NULL,'SKILL','4f1c6a961dec28865c792b5b2514120c',1,'fr'),
	('communicatif','communicative','People who received this badge have shown they excel the art of communication in a private sphere as well as in a business environment.',NULL,'PERS','59aea376bb5a51fa034d8963e2ea815d',1,'en'),
	('communicatif','communicatif','Les personnes détenant ce badge ont montré qu\'ils maîtrisent l\'art de la communication dans un environnement privé ou d\'affaires.',NULL,'PERS','59aea376bb5a51fa034d8963e2ea815d',1,'fr'),
	('construction','construction','By receiving this badge, these holders have proven to their relations they excelled in construction (masonry, roofing, tile installation etc. ..) and are therefore able to transfer advices in their respective area.','People with this badge are logically autorized in the professional sphere to assemble different parts of a building using materials and techniques appropriate which comply with the regulations in force.  This badge is only given to professionals that you know.','SKILL','671c9eca7f36118e0e336a9def3fdee0',1,'en'),
	('construction','construction','En recevant ce badge, ces détenteurs logiquement professionels ont prouvé à leurs relations qu\'ils excelaient dans la construction (maçonnerie, couverture etc.. ) et sont donc capable de transférer des conseils dans leur domaine respective.','Les personnes avec ce badge sont logiquement habilitées dans le cadre professionnelle à assembler différents éléments d\'un édifice en utilisant des matériaux et des techniques appropriées qui respectent les réglementations en vigueur. \nCe badge ne doit être donné donc qu\'à des professionnels que vous connaissez.','SKILL','671c9eca7f36118e0e336a9def3fdee0',1,'fr'),
	('cosmetic','cosmetic','This badge holders have a good experience and knowledge in the use of cosmetics to beautify the face or various external parts of the human body.',NULL,'SKILL','4f1c6a961dec28865c792b5b2514120c',1,'en'),
	('cosmetic','cosmetique','Les détenteurs de ce badge possédent une bonne expérience et connaisance dans l\'utilisation de produits cosmétiques pour l\'embellissement du visage ou diverses parties superficielles du corps humain.',NULL,'SKILL','4f1c6a961dec28865c792b5b2514120c',1,'fr'),
	('couture','sewing','People with this badge are known to have excellent skills in making, editing or adjusting clothing whether for leisure or work.',NULL,'SKILL','671c9eca7f36118e0e336a9def3fdee0',1,'en'),
	('couture','couture','Les détenteurs de ce badge sont reconnus pour posséder un excellent savoir-faire dans la confection, la retouche ou l\'ajustement de vêtements que ce soit pour le loisir ou le travail. ',NULL,'SKILL','671c9eca7f36118e0e336a9def3fdee0',1,'fr'),
	('creative','creative','People with this badge are able to innovate, to find new ideas, designing a new product or to see solutions where everyone see barriers. <br/>\n\"Being creative make often the difference between good operators and high-potential\", Julien Lucas.',NULL,'PERS','5f1c6a961dec28865c792b5b2514120c',1,'en'),
	('creative','creatif','Les détenteurs de ce badge sont capables d\'innover, de trouver de nouvelles idées, de concevoir un nouveau produit ou de voir des solutions là ou tout le monde voit des barrières. <br/>\n\"Etre créatif fait souvent la différence entre les bons opérationnels et les haut-potentiels\", Julien Lucas.',NULL,'PERS','5f1c6a961dec28865c792b5b2514120c',1,'fr'),
	('cuisiner','cooking','',NULL,'SKILL',NULL,0,'en'),
	('cuisiner','cuisine','',NULL,'SKILL',NULL,0,'fr'),
	('decor','decoration','People with this badge have a great talent to embellish a room or an object. By receiving this badge, they have satisfied their relations by sharing good decorating ideas.',NULL,'SKILL','671c9eca7f36118e0e336a9def3fdee0',1,'en'),
	('decor','décoration','Les détenteurs de ce badge possêdent un excellent talent céative pour embéllir une piéce ou un objet. En recevant ce badge, ils ont satisfait  leur entourage en partageant entre autre des bonnes idées de décoration.',NULL,'SKILL','671c9eca7f36118e0e336a9def3fdee0',1,'fr'),
	('direct','direct','People with this badge have the particularity to go straight to the point with tact.<br/>\n\"People who are direct keep their integrity by being honest towards others\", Kobad Ghandy.','','PERS','59aea376bb5a51fa034d8963e2ea815d',1,'en'),
	('direct','direct','Les détenteurs de ce badge ont la particularité d\'aller droit au but sans chemins détournés en faisant preuve de tact.<br/>\n\"Les personnes directs conservent leur intégrité en étant honnêtes vis à vis des gens\", Kobad Ghandy.','','PERS','59aea376bb5a51fa034d8963e2ea815d',1,'fr'),
	('dispo','availaible','People with this badge are concerned to keep being available and responding to all requests. Even when they are in downtime, they do the effort to call back.',NULL,'PERS','5f1c6a961dec28865c792b5b2514120c',1,'en'),
	('dispo','disponible','Les détenteurs de ce badge sont soucieux de se rendre disponible en répondant à toutes les sollicitations. Même lorsqu\'ils sont en période d\'indisponibilité, ils font l\'effort de rappeler.  ',NULL,'PERS','5f1c6a961dec28865c792b5b2514120c',1,'fr'),
	('donator','donator','People with this badge are donors who contributed financially to raise the Yoomken project. On behalf of the entire team, we thank them for their trust.','This badge is gotten if you have had the opportunity to make a donation during our companions launched via crowdfunding platforms <a href=\'http://www.kickstarter.com\'> KickStarter </ a> or <a href = \'http://www.fundraise.com\'> Fundraise </ a>','ACTION',NULL,1,'en'),
	('donator','donateur','Les détenteurs de ce badge sont les donateurs qui ont contribué financièrement à faire démarer le projet Yoomken. De la part de toute l\'équipe, nous les remercions de leur confiance et de leurs précieux soutiens.','Ce badge est acquis dans le cas oû vous avez eu l\'occasion de faire une donation durant nos compagnes de crowdfunding lancé via les plateformes <a href=\'http://www.kickstarter.com\'>KickStarter</a> ou <a href=\'http://www.fundraise.com\'>Fundraise</a> ','ACTION',NULL,1,'fr'),
	('ecolo','green','Being green can be summarized in \"3R\" which are the three basic rules: reduce, reuse and recycle. People with this badge follow these rules and / or offer solutions that help to apply these rules.',NULL,'PERS','5f1c6a961dec28865c792b5b2514120c',1,'en'),
	('ecolo','écolo','Etre écolo se résume en \"3R\" qui sont les trois règles fondamentaux : réduire, réutiliser et recycler. Les détendeurs de ce badge suivent ces fondamentaux et/ou offrent des solutions qui les appliquent. ',NULL,'PERS','5f1c6a961dec28865c792b5b2514120c',1,'fr'),
	('electricity','electricity','By receiving this badge, the holders have shown that they can effectively carry out a system or electrical wiring in accordance with the recent standards.','Logically, this badge is only given to professionals that you know since it represents a expertise in accordance to recent electrical standards essential to avoid electrical problem in the house.','SKILL','671c9eca7f36118e0e336a9def3fdee0',1,'en'),
	('electricity','electricité','En recevant ce badge, les détenteurs logiquement profesionnels ont démontré qu\'elles étaient capable de réaliser efficacement une installation électrique mise aux récentes normes.','Les personnes avec ce badge sont logiquement des professionels habitués à câbler des réseaux basse et haute tension. Ce badge ne doit être donné qu\'à des professionnels que vous connaissez puisqu\'il represente un métier qui a connaisance des récentes normes indispensable en raison de l\'impact direct sur la sécurité de la population.\n','SKILL','671c9eca7f36118e0e336a9def3fdee0',1,'fr'),
	('energic','energic','The owners of this badge hold a high energy and motivation to get things done, not only for themselves but also for the people around them to give their personal best.',NULL,'PERS','5f1c6a961dec28865c792b5b2514120c',1,'en'),
	('energic','énergique','Les propriétaires de ce badge détiennent une grande énergie et motivation pour faire avancer les choses. Cette energie se transmet aussi aux gens autour d\'eux afin d\'atteindre une performance optimale.',NULL,'PERS','5f1c6a961dec28865c792b5b2514120c',1,'fr'),
	('flexible','flexible','Flexible people demonstrate an ability to adapt to circumstances such as an intervention out of their regular schedule or offering exclusive services. People with  this badge have proven that we can count on them to adapt.','','PERS','5f1c6a961dec28865c792b5b2514120c',1,'en'),
	('flexible','flexible','Les personnes flexibles démontrent une capacité d\'adaptation aux circonstances qui peut se traduire par une intervention en dehors de leur horaire habituel ou par la presatation de services exclusifs. Les détenteurs de ce badge ont prouvé qu\'on peut compter sur eux pour s\'adapter.','','PERS','5f1c6a961dec28865c792b5b2514120c',1,'fr'),
	('funny','funny','People who received this badge have shown that it easy to entertain people whether they are kids or adults.',NULL,'PERS','59aea376bb5a51fa034d8963e2ea815d',1,'en'),
	('funny','amusant','Les personnes qui ont acquis ce badge ont montré qu\'ils ont une facilité à amuser les gens qu\'ils soient petits ou grands.',NULL,'PERS','59aea376bb5a51fa034d8963e2ea815d',1,'fr'),
	('gastronomie','gastronomy','',NULL,'SKILL',NULL,0,'en'),
	('gastronomie','gastronomie','',NULL,'SKILL',NULL,0,'fr'),
	('generous','generous','Generosity isn\'t just about money, it\'s also giving his time and attention. People with this badge have these generous qualities that express their greatness of soul.','','PERS','59aea376bb5a51fa034d8963e2ea815d',1,'en'),
	('generous','généreux','La générosité ne concerne pas que le porte-monnaie, c\'est aussi donner de son temps et de l\'attention.  Les acquéreurs de ce badge disposent de ces qualités généreuses qui expriment leur grandeur d\'âme.','','PERS','59aea376bb5a51fa034d8963e2ea815d',1,'fr'),
	('gentil','kind',' ','','PERS','59aea376bb5a51fa034d8963e2ea815d',0,'en'),
	('gentil','gentil',' ','','PERS','59aea376bb5a51fa034d8963e2ea815d',0,'fr'),
	('gffh','gffh','sddsfds','','WISH',NULL,-3,'fr'),
	('habile','dexterous',' People with this badge recognized dexterous, have shown they practice with talent and skill their manual art.','','PERS','5f1c6a961dec28865c792b5b2514120c',1,'en'),
	('habile','habile',' Les détenteurs de ce badge reconnus habiles ont montré qu\'ils pratiquaient avec adresse et compétence leur art de leurs mains.','','PERS','5f1c6a961dec28865c792b5b2514120c',1,'fr'),
	('helpPerson','assistance to a person','People with this badge are known by their communities as being sensitive to the plight of elderly or vulnerable people and eager to help them.',NULL,'SKILL','9657daa44260bb346d8baaed5f865606',1,'en'),
	('helpPerson','assistance à la personne','Les détenteurs de ce badge sont reconnus par leur entourage comme étant des personnes sensibles aux difficultés des personnes fragiles ou agées et désireux de les aider.',NULL,'SKILL','9657daa44260bb346d8baaed5f865606',1,'fr'),
	('jardin','gardening','People with this badge are passionate about gardering and have all the knowledges to plant and maintain plants in ideal conditions for their development both for aesthetic and / or food purposes.',NULL,'SKILL','671c9eca7f36118e0e336a9def3fdee0',1,'en'),
	('jardin','jardinage','Les personnes qui ont acquis ce badge sont des passionnées de jardinnage et possédent toutes les connaissances pour planter et maintenir des végétaux dans des conditions idéales pour leur développement  que ce soit pour un but esthétique et/ou alimentaire.',NULL,'SKILL','671c9eca7f36118e0e336a9def3fdee0',1,'fr'),
	('keepingPets','keeping of pets','People who received this badge are known to love animals and care to them.',NULL,'SKILL','9657daa44260bb346d8baaed5f865606',1,'en'),
	('keepingPets','garde d\'animaux','Les personnes qui possédent ce badge sont reconnues pour aimer les animaux et en prendre le plus grand soin.',NULL,'SKILL','9657daa44260bb346d8baaed5f865606',1,'fr'),
	('lavage','washing','People with this badge are used to wash clothes or towels and know therefore various tricks to achieve it in the best way.',NULL,'SKILL','d2ffb970ba1b3700f8ea9baa32bffd74',1,'en'),
	('lavage','lavage linge','Les détenteurs de ce badge ont l\'habitude de laver le linge et ont donc connaissance de divers astuces pour le réaliser de la meilleur maniére.',NULL,'SKILL','d2ffb970ba1b3700f8ea9baa32bffd74',1,'fr'),
	('menuserie','woodwork','People with this badge master the art of carpentry applications as an amateur or profesionnal, making them eligible to build or repair of movable objects such as beds, doors, etc. ..',NULL,'SKILL','671c9eca7f36118e0e336a9def3fdee0',1,'en'),
	('menuserie','menuserie','Les détenteurs de ce badge maitrise l\'art de la menuserie en tant qu\'amateur ou profesionnel, ce qui les rend éligible à construire ou réparer des objets mobiliers tel que des lits, des portes etc..',NULL,'SKILL','671c9eca7f36118e0e336a9def3fdee0',1,'fr'),
	('moving','moving belongings','Holders have received this badge from their relations who have been grateful for their action during a transport of their personal properties. they either provided a suitable vehicle or were involved in the effort of moving.',NULL,'SKILL','49aea376bb5a51fa034d8963e2ea815d',1,'en'),
	('moving','transport de biens mobiliers','Les détenteurs ont reçu ce badge de leurs relations qui ont été reconnaissantes de leur action à l\'occasion d\'un transport de leurs biens mobiliers. ils ont soit fournit un véhicule adapté ou soit participé à l\'effort du déplacement.',NULL,'SKILL','49aea376bb5a51fa034d8963e2ea815d',1,'fr'),
	('nettoyer','cleaning','People with this badge are meticulous in the cleanliness and get a pleasure to leave behind things clean and tidy.',NULL,'SKILL','d2ffb970ba1b3700f8ea9baa32bffd74',1,'en'),
	('nettoyer','nettoyage','Les détenteurs de ce badge sont minitieux dans la propreté et ont un plaisir de laisser derriére eux les choses propres et bien rangées. ',NULL,'SKILL','d2ffb970ba1b3700f8ea9baa32bffd74',1,'fr'),
	('newone1','newone1','sadasdasdas','','WISH',NULL,-2,'fr'),
	('nounou','baby-sitting','People who received this badge have proven they know devoting attention to children and educating them in a playful way.',NULL,'SKILL','9657daa44260bb346d8baaed5f865606',1,'en'),
	('nounou','baby-sitting','Les personnes qui ont reçu ce badge ont prouvé qu\'elles savent accorder une attention aux enfants et les éduquer de façon ludique.',NULL,'SKILL','9657daa44260bb346d8baaed5f865606',1,'fr'),
	('nounouplus','nanny','People with this badge have been recognized by some families as perfect nannies.','Logically, this badge is only given to professionals that you know and who are authorized in the professional sphere to care babies and children. ','SKILL','9657daa44260bb346d8baaed5f865606',1,'en'),
	('nounouplus','nounou','Les personnes détenant ce badge ont été reconnues par certaines familles comme des nounous d\'enfer.','Logiquement, ce badge n\'est donné qu\'à des professionnels que vous connaissez et qui sont habilitées dans le cadre professionnel à s\'occuper des bébés et enfants.','SKILL','9657daa44260bb346d8baaed5f865606',1,'fr'),
	('open','open mind','Open mind, it\'s to accept to meet opposed points of view and recognizing a certain value. Therefore, people with this badge clearly respect each other\'s differences. <br/>\n\"The mind is like a parachute: it only works when it\'s open.\" Edgar Morin.',NULL,'PERS','59aea376bb5a51fa034d8963e2ea815d',1,'en'),
	('open','ouvert d\'esprit','L\'ouverture d\'esprit, c\'est accepter de rencontrer des points de vue opposés aux siens et en reconnaitre une certaine valeur. Les détenteurs de ce badge respectent donc clairement les différences des autres.<br/>\n\"L\'esprit est comme un parachute: il ne fonctionne que lorsqu\'il est ouvert.\"  Edgar Morin.','','PERS','59aea376bb5a51fa034d8963e2ea815d',1,'fr'),
	('organized','organized','Organized people take the time to plan methodically their future tasks. This means people with this badge have control of their time and are better prepared to reach their goals.',NULL,'PERS','5f1c6a961dec28865c792b5b2514120c',1,'en'),
	('organized','organisé','Les personnes organisées prennent le temps de planifier méthodiquement leurs tâches futures. Ce qui implique que les detenteurs de ce badge maitrisent leur emploi du temps et sont les mieux préparés pour avancer vers des objectifs fixés.',NULL,'PERS','5f1c6a961dec28865c792b5b2514120c',1,'fr'),
	('patisser','confectionery','',NULL,'SKILL',NULL,0,'en'),
	('patisser','pâtisserie','',NULL,'SKILL',NULL,0,'fr'),
	('peindre','painting','People with this badge have demonstrated an impressive efficacy in coating and painting surfaces such as wall, ceiling and woodwork.',NULL,'SKILL','671c9eca7f36118e0e336a9def3fdee0',1,'en'),
	('peindre','peinture','Les personnes avec ce badge ont démontré une impressionnante efficacité à enduire et peindre les surfaces tel que les murs, plafonds et boiseries.',NULL,'SKILL','671c9eca7f36118e0e336a9def3fdee0',1,'fr'),
	('plomberie','plumbing','People with this badge have been recognized in a profesionel context for their good work to install tubes, pipes, valves, valve assemblies or devices that allows the flow of fluid (liquid or gas) safely.','Logically, this badge must only be given to the professionals that you know since much of the plumbing work is regulated by government  due to the direct impact on the public\'s health, safety, and welfare.','SKILL','671c9eca7f36118e0e336a9def3fdee0',1,'en'),
	('plomberie','plomberie','Les détenteurs de ce badge ont été reconnus dans un cadre profesionel pour leur bonne pratique d\'instalation  des tuyaux, tubes, robinets ou soupapes qui permet la circulation de fluide (liquide ou gaz) de façon sécuritaire. ','Logiquement, ce badge ne doit être donné qu\'à des professionels que vous connaissez puisque le travail de plomberie est régie par des codes d\'installation strictes en raison de l\'impact direct sur la santé, la sécurité et le bien-être de la population.','SKILL','671c9eca7f36118e0e336a9def3fdee0',1,'fr'),
	('ponctual','punctual','Being punctual has many facets such as showing up on time, completing their tasks before the deadline sets... People who received this badge master all of them.',NULL,'PERS','5f1c6a961dec28865c792b5b2514120c',1,'en'),
	('ponctual','ponctuel','Etre ponctuel a de nombreuses facettes tel qu\'arriver à l\'heure, accomplir ses tâches avant la fin des délais... Les personnes qui ont reçu ce badge suivent tous ces qualités.',NULL,'PERS','5f1c6a961dec28865c792b5b2514120c',1,'fr'),
	('productif','productive','People with this badge are known to have a good work performance.',NULL,'PERS','5f1c6a961dec28865c792b5b2514120c',1,'en'),
	('productif','productif','Les détenteurs de ce badge sont reconnus pour avoir un bon rendement de travail. ',NULL,'PERS','5f1c6a961dec28865c792b5b2514120c',1,'fr'),
	('rapide','fast','People with this badge act quickly. They are quick to arrive to the destination or to perform their duties very satisfactorily.',NULL,'PERS','5f1c6a961dec28865c792b5b2514120c',1,'en'),
	('rapide','rapide','Les détenteurs de ce badge agissent vite. ils font preuve de rapidité pour arriver à destination ou accomplir leur tâche de manière trés satisfaisante.',NULL,'PERS','5f1c6a961dec28865c792b5b2514120c',1,'fr'),
	('receptif','receptive','Listening is the basis of all human relationships. This badge holders have well it understood, they are receptive to the needs of their interlocutor and act accordingly.<br/>\n\"If a man has two ears and one mouth, is to listen twice more as he speak.\", Samuel Beckett.',NULL,'PERS','59aea376bb5a51fa034d8963e2ea815d',1,'en'),
	('receptif','réceptif','Etre à l\'écoute est la base de toute relation humaine. Les détenteurs de ce badge l\'ont bien compris, ils sont réceptifs aux besoins de leurs interlocuteurs et agissent en conséquence. <br/>\n\"Si l\'homme a deux oreilles et une bouche, c\'est pour écouter deux fois plus qu\'il ne parle.\", Samuel Beckett.',NULL,'PERS','59aea376bb5a51fa034d8963e2ea815d',1,'fr'),
	('repairBike','repair bikecycle','Holders of this badge has known to have an extensive experience and knowledge in the maintenance and repair of bikecycle.',NULL,'SKILL','9657daa44260bb346d8baaed5f865607',1,'en'),
	('repairBike','reparation vélo','Les détenteurs de ce badge sont connus pour posséder une vaste expérience et connaisance dans l\'entretien ou la réparation des bicyclettes. \n',NULL,'SKILL','9657daa44260bb346d8baaed5f865607',1,'fr'),
	('repairCar','repair car','Holders of this badge has known to have an extensive experience and knowledge in the maintenance and repair of cars.',NULL,'SKILL','9657daa44260bb346d8baaed5f865607',1,'en'),
	('repairCar','reparation voiture','Les détenteurs de ce badge sont connus pour posséder une vaste expérience et connaisance dans l\'entretien ou la réparation des voitures. ',NULL,'SKILL','9657daa44260bb346d8baaed5f865607',1,'fr'),
	('repairMachine','repair machine','The owners of this badge have shown an impressive ability to diagnose electrical and mechanical abnormalities of defective devices. What makes them better able to repair efficiently.',NULL,'SKILL','9657daa44260bb346d8baaed5f865607',1,'en'),
	('repairMachine','reparation appareil','Les propriétaires de ce badge ont montré une impressionnante faculté à diagnostiquer les anomalies électriques ou mécaniques des appareils défecteux. Ce qui les rend mieux à même de réparer efficacement. ',NULL,'SKILL','9657daa44260bb346d8baaed5f865607',1,'fr'),
	('repairMoto','repair motorcycle','Holders of this badge has known to have an extensive experience and knowledge in the maintenance and repair of motorcycle.',NULL,'SKILL','9657daa44260bb346d8baaed5f865607',1,'en'),
	('repairMoto','reparation moto','Les détenteurs de ce badge sont connus pour posséder une vaste expérience et connaisance dans l\'entretien ou la réparation des motos. ',NULL,'SKILL','9657daa44260bb346d8baaed5f865607',1,'fr'),
	('repassage','ironing','This badge holders are used to iron clothes and are known to do it carefully.',NULL,'SKILL','d2ffb970ba1b3700f8ea9baa32bffd74',1,'en'),
	('repassage','repassage','Les détenteurs de ce badge ont l\'habitude de repasser à la main tout sorte de vétements et sont reconnus pour le faire soigneusement.',NULL,'SKILL','d2ffb970ba1b3700f8ea9baa32bffd74',1,'fr'),
	('serviable','helpful','Be helpful or help others are strong actions  that Yoomken defends and promotes in the network. If a person help another one, the recipient should expect to do the same thing if the opportunity arises.  The holders of this badge are responsive to people\'s needs and give the effort they can do to help hoping that one day the recipient will do the same.<br/>\n\"It should help each other, it\'s the law of nature.\" Jean de la Fontaine.',NULL,'PERS','59aea376bb5a51fa034d8963e2ea815d',1,'en'),
	('serviable','serviable','Etre serviable ou rendre service sont des actions fortes que Yoomken défend et encourage dans le réseau. Si une personne rend service à un autre, la personne benéficiaire doit s\'attendre à faire de même si l\'occasion se présente. Les détenteurs de ce badge sont réactives au besoins des gens et apportent l\'effort qu\'ils peuvent pour rendre service en espérant qu\'un jour le bénéficiare agissent de même pour les autres. <br/>\n\"Il se faut entraider, c\'est la loi de nature.\", Jean de la Fontaine.',NULL,'PERS','59aea376bb5a51fa034d8963e2ea815d',1,'fr'),
	('shingo','shingo','jsdhfdsf  jdshfsjf sdj jdshf sdfhsd fdhf\nsjdfhsdjfsdfsd','','WISH',NULL,-3,'fr'),
	('solidaire','solidary','Solidarity is a high value that Yoomken defends and promotes in the network. People with this badge have generous attentions to support a cause or a person in need. <br/>\n\"The great thing about democracy is solidarity.\" Victor Hugo.',NULL,'PERS','59aea376bb5a51fa034d8963e2ea815d',1,'en'),
	('solidaire','solidaire','La solidarité est un lien social d\'engagement qui unie les personnes. C\'est une valeur forte que Yoomken porte et encourage dans le réseau. Les détenteurs de ce badge possédent des attentions généreuses afin de soutenir une cause ou une personne dans le besoin.<br/>\n\"La grande chose de la démocratie, c\'est la solidarité.\", Victor Hugo.',NULL,'PERS','59aea376bb5a51fa034d8963e2ea815d',1,'fr'),
	('teaching','teaching','People who received this badge have shown they can transform knowledge into reasonable units so that others can learn and enhance their skills.',NULL,'SKILL',NULL,0,'en'),
	('teaching','enseignement','Les personnes qui ont acquis ce badge ont montré qu\'ils s\'ont en mesure de transférer les connaissances en unités raisonnables, afin que d\'autres puissent apprendre et améliorer leurs compétences.',NULL,'SKILL',NULL,0,'fr'),
	('travaillleur','hard-working','People who have received this badge hold a large professional conscience. They are this kinds of people who give 100% to do a good work.',NULL,'PERS','5f1c6a961dec28865c792b5b2514120c',1,'en'),
	('travaillleur','travaillleur','Les personnes qui ont reçu ce badge détiennent une grande conscience professionelle. Ce genre de personnes sont prêt à donner leur tout pour que le résultat de leur travail soit utile ou bénéfique à d\'autres.',NULL,'PERS','5f1c6a961dec28865c792b5b2514120c',1,'fr'),
	('volantaire','volunteer','',NULL,'PERS','5f1c6a961dec28865c792b5b2514120c',0,'en'),
	('volantaire','volantaire','',NULL,'PERS','5f1c6a961dec28865c792b5b2514120c',0,'fr');

/*!40000 ALTER TABLE `badge` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
