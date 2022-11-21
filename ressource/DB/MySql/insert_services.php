delete from tag where `type_tag`='service' or `type_tag`='personality';
-- 


INSERT INTO `tag` (`id_tag`, `id_parent_tag`, `type_tag`, `title_tag`, `lang_tag`,`deleted_tag`, `order_tag`) VALUES
('671c9eca7f36118e0e336a9def3fdee0', NULL, 'service', 'Travail Technique & Manuel', 'fr',0,1),
('d2ffb970ba1b3700f8ea9baa32bffd74', NULL, 'service', 'Ménage & Linge', 'fr',0,2),
('9657daa44260bb346d8baaed5f865606', NULL, 'service', 'Garde & Assistance', 'fr',0,3),
('4f1c6a961dec28865c792b5b2514120c', NULL, 'service', 'Entretien & Beauté', 'fr',0,4),
('5e1c6a961dec28865c792b5b2514120c', NULL, 'service', 'Alimentation', 'fr',0,5),
('9657daa44260bb346d8baaed5f865607', NULL, 'service', 'Réparation', 'fr',0,6),
('49aea376bb5a51fa034d8963e2ea815d', NULL, 'service', 'Mobilité', 'fr',0,7),
('59aea376bb5a51fa034d8963e2ea815d', NULL, 'personality', 'Trait relationel', 'fr',0,1),
('5f1c6a961dec28865c792b5b2514120c', NULL, 'personality', 'Trait pratique', 'fr',0,2),
--  ('4b7c90409368b88999cf9f69c02da6e6', NULL, 'service', 'Soutiens & Cours', 'fr',1,0),
--  ('7eec51a9923ac92a792300ccbd541e17', NULL, 'service', 'Sport', 'fr'),
-- ('87ad04504d9bb72d6fe445061d3486aa', NULL, 'service', 'Evénements & Réceptions', 'fr'),
-- ('d2ffb970ba1b3700f8ea9baa32bffd73', NULL, 'service', 'Jobs virtuels', 'fr'),

('a1ae798de07d71156d4a55d1ca422a0f', '9657daa44260bb346d8baaed5f865607', 'service', 'Auto', 'fr',0,1),
('b1ae798de07d71156d4a55d1ca422a0f', '9657daa44260bb346d8baaed5f865607', 'service', 'Moto', 'fr',0,2),
('c1ae798de07d71156d4a55d1ca422a0f', '9657daa44260bb346d8baaed5f865607', 'service', 'Vélo', 'fr',0,3),
('4b5a841bfcf00950657b827d6eb6f9af', '9657daa44260bb346d8baaed5f865607', 'service', 'Appareil', 'fr',0,4),
-- ('6a0002cb2a0493aee7e90bbc01004d53', '9657daa44260bb346d8baaed5f865607', 'service', 'Informatique', 'fr',0,5),

-- ('b1430cf48395d4203762e663428f456b', '49aea376bb5a51fa034d8963e2ea815d', 'service', 'Livraison', 'fr',0,2),
('2975beb12d5230722d41c4ded4a9c889', '49aea376bb5a51fa034d8963e2ea815d', 'service', 'Transport biens', 'fr',0,1),

-- ('d1928afb2474ca6fab0fdaf7aadfbd62', '4b7c90409368b88999cf9f69c02da6e6', 'service', "Cours d'informatique", 'fr'),
-- ('6c50f9e706a804872ec1674016867df5', '4b7c90409368b88999cf9f69c02da6e6', 'service', 'Cours de musique', 'fr'),
-- ('b1bfecd0990fe22978e451ed57f88fe8', '4b7c90409368b88999cf9f69c02da6e6', 'service', 'Cours de langue', 'fr'),
-- ('dc3d90da3b69b00ffda4099f89d214d6', '4b7c90409368b88999cf9f69c02da6e6', 'service', 'Soutien scolaire', 'fr'),
-- ('93390e81c4a73cde32a41f44b36bf113', '4b7c90409368b88999cf9f69c02da6e6', 'service', 'Cours de cuisine', 'fr'),

('4f423aa5c8dbeb87377805c80ec52772', '4f1c6a961dec28865c792b5b2514120c', 'service', 'Soin du corps', 'fr',0,1),
('e410d9b44ebf8d8f7135bcc21a07ed48', '4f1c6a961dec28865c792b5b2514120c', 'service', 'Coiffure', 'fr',0,2),
('d27f7bd17e303ff756d721803a91e98f', '4f1c6a961dec28865c792b5b2514120c', 'service', 'Maquillage', 'fr',0,3),

('c522a59862309cc5dea2f3e8349d8a3f', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Bricolage', 'fr',0,1),
('4a6d13d111d321b7968d2cde64eb0986', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Construction', 'fr',0,2),
('1a37c93c4d000ea63255147931bbc233', '671c9eca7f36118e0e336a9def3fdee0', 'service', "Electricité", 'fr',0,3),
('44802920f148815df53cf900297fda72', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Menuiserie', 'fr',0,4),
('6c9cb0273e586fc0b513fe63a706ea01', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Montage', 'fr',0,5),
('9c84b22c3b0b033c5f7afe89b1789bad', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Peinture', 'fr',0,6),
('6aed04e0205cd728549b730a49eabb02', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Plomberie', 'fr',0,7),
('d522a59862309cc5dea2f3e8349d8a3f', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Jardinage', 'fr',0,8),
('46f149a7a0e47d2c8d02b9c76d07873c', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Décoration', 'fr',0,9),
('46f149a7a0e47d2c8d02b9c76d07873e', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Couture', 'fr',0,10),

('27936cd368c9748649022b4e04cbd4f2', 'd2ffb970ba1b3700f8ea9baa32bffd74', 'service', 'Nettoyage', 'fr',0,1),
('37936cd368c9748649022b4e04cbd4f2', 'd2ffb970ba1b3700f8ea9baa32bffd74', 'service', 'Lavage', 'fr',0,2),
('47936cd368c9748649022b4e04cbd4f2', 'd2ffb970ba1b3700f8ea9baa32bffd74', 'service', 'Repassage', 'fr',0,3),
-- ('57936cd368c9748649022b4e04cbd4f2', 'd2ffb970ba1b3700f8ea9baa32bffd74', 'service', 'Pressing', 'fr',0,4),


('c565159e4697c29c630c41b1293c063c', '9657daa44260bb346d8baaed5f865606', 'service', "Baby-sitting", 'fr',0,1),
('b565159e4697c29c630c41b1293c063c', '9657daa44260bb346d8baaed5f865606', 'service', "Nounou", 'fr',0,2),
('fd9bd79b93a8fd84e1d3ce1956092be0', '9657daa44260bb346d8baaed5f865606', 'service', 'Assistance Personne', 'fr',0,3),
('fd9bd79b93a8fd84e1d3ce1956092be1', '9657daa44260bb346d8baaed5f865606', 'service', 'Garde animaux', 'fr',0,4),

('c565159e4697c29c630c41b1293c0633', '5e1c6a961dec28865c792b5b2514120c', 'service', "Cuisinerie", 'fr',0,1),
('b565159e4697c29c630c41b1293c0633', '5e1c6a961dec28865c792b5b2514120c', 'service', "Patisserie", 'fr',0,2),
('fd9bd79b93a8fd84e1d3ce1956092be3', '5e1c6a961dec28865c792b5b2514120c', 'service', 'Nutrition équilibrée', 'fr',0,3);


-- ('18c3878a6c21adc3e4d52b95afca7145', '7eec51a9923ac92a792300ccbd541e17', 'service', 'Diverses activités sportives', 'fr'),
-- ('93c725dd2f559ddf77633d1cf116869d', '7eec51a9923ac92a792300ccbd541e17', 'service', 'Remise en forme / Fitness', 'fr'),
-- ('edfa1da712add43d15bd28670287611f', '87ad04504d9bb72d6fe445061d3486aa', 'service', "Autres services d'amusements", 'fr'),
-- ('a13427f0b40080a599f363161af4e45c', '87ad04504d9bb72d6fe445061d3486aa', 'service', 'Chanteur / Musicien / DJ', 'fr'),
-- ('cd5de6902566b6b145c6e21286b9a190', '87ad04504d9bb72d6fe445061d3486aa', 'service', 'Restauration (Serveur, Cuisinier)', 'fr'),
-- ('8d6e5e1c98a93542226d3cb3728f1cc1', 'd2ffb970ba1b3700f8ea9baa32bffd73', 'service', 'Assistance informatique', 'fr'),
-- ('09482dfda978eabea0ded7f57235aa43', 'd2ffb970ba1b3700f8ea9baa32bffd73', 'service', 'Développement Web', 'fr'),
-- ('09482dfda978eabea0ded7f57235aa44', 'd2ffb970ba1b3700f8ea9baa32bffd73', 'service', 'Programmation', 'fr'),
-- ('09482dfda978eabea0ded7f57235aa45', 'd2ffb970ba1b3700f8ea9baa32bffd73', 'service', 'Insertion de données', 'fr'),
-- ('09482dfda978eabea0ded7f57235aa46', 'd2ffb970ba1b3700f8ea9baa32bffd73', 'service', 'Traduction', 'fr'),
-- ('09482dfda978eabea0ded7f57235aa47', 'd2ffb970ba1b3700f8ea9baa32bffd74', 'service', 'Conseils administratifs', 'fr'),
-- ('09482dfda978eabea0ded7f57235aa48', 'd2ffb970ba1b3700f8ea9baa32bffd73', 'service', 'Articles & Rédaction', 'fr');







INSERT INTO `tag` (`id_tag`, `id_parent_tag`, `type_tag`, `title_tag`, `lang_tag`,`deleted_tag`, `order_tag`) VALUES
('671c9eca7f36118e0e336a9def3fdee0', NULL, 'service', 'Technical & Manual work', 'en',0,1),
('d2ffb970ba1b3700f8ea9baa32bffd74', NULL, 'service', 'Housekeeping & Laundry', 'en',0,2),
('9657daa44260bb346d8baaed5f865606', NULL, 'service', 'Keeping & Assistance', 'en',0,3),
('4f1c6a961dec28865c792b5b2514120c', NULL, 'service', 'Beauty', 'en',0,4),
('5e1c6a961dec28865c792b5b2514120c', NULL, 'service', 'Food & Dining', 'en',0,5),
('9657daa44260bb346d8baaed5f865607', NULL, 'service', 'Repair', 'en',0,6),
('49aea376bb5a51fa034d8963e2ea815d', NULL, 'service', 'Mobility', 'en',0,7),
('59aea376bb5a51fa034d8963e2ea815d', NULL, 'personality', 'Relational feature', 'en',0,1),
('5f1c6a961dec28865c792b5b2514120c', NULL, 'personality', 'Practice feature', 'en',0,2),

('a1ae798de07d71156d4a55d1ca422a0f', '9657daa44260bb346d8baaed5f865607', 'service', 'Car', 'en',0,1),
('b1ae798de07d71156d4a55d1ca422a0f', '9657daa44260bb346d8baaed5f865607', 'service', 'Motorbike', 'en',0,2),
('c1ae798de07d71156d4a55d1ca422a0f', '9657daa44260bb346d8baaed5f865607', 'service', 'Bicycle', 'en',0,3),
('4b5a841bfcf00950657b827d6eb6f9af', '9657daa44260bb346d8baaed5f865607', 'service', 'Device', 'en',0,4),
-- ('6a0002cb2a0493aee7e90bbc01004d53', '9657daa44260bb346d8baaed5f865607', 'service', 'Computer', 'en',1,5),

-- ('b1430cf48395d4203762e663428f456b', '49aea376bb5a51fa034d8963e2ea815d', 'service', 'Delivery', 'en',0,2),
('2975beb12d5230722d41c4ded4a9c889', '49aea376bb5a51fa034d8963e2ea815d', 'service', 'Moving', 'en',0,1),

('4f423aa5c8dbeb87377805c80ec52772', '4f1c6a961dec28865c792b5b2514120c', 'service', 'Body care', 'en',0,1),
('e410d9b44ebf8d8f7135bcc21a07ed48', '4f1c6a961dec28865c792b5b2514120c', 'service', 'Hair', 'en',0,2),
('d27f7bd17e303ff756d721803a91e98f', '4f1c6a961dec28865c792b5b2514120c', 'service', 'Makeup', 'en',0,3),

('c522a59862309cc5dea2f3e8349d8a3f', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'DYS', 'en',0,1),
('4a6d13d111d321b7968d2cde64eb0986', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Building work', 'en',0,2),
('1a37c93c4d000ea63255147931bbc233', '671c9eca7f36118e0e336a9def3fdee0', 'service', "Electrical work", 'en',0,3),
('44802920f148815df53cf900297fda72', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Woodwork', 'en',0,4),
('6c9cb0273e586fc0b513fe63a706ea01', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Assembly', 'en',0,5),
('9c84b22c3b0b033c5f7afe89b1789bad', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Painting', 'en',0,6),
('6aed04e0205cd728549b730a49eabb02', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Plombing', 'en',0,7),
('d522a59862309cc5dea2f3e8349d8a3f', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Gardening', 'en',0,8),
('46f149a7a0e47d2c8d02b9c76d07873c', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Decoration', 'en',0,9),
('46f149a7a0e47d2c8d02b9c76d07873e', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Sewing', 'en',0,10),

('27936cd368c9748649022b4e04cbd4f2', 'd2ffb970ba1b3700f8ea9baa32bffd74', 'service', 'Cleaning', 'en',0,1),
('37936cd368c9748649022b4e04cbd4f2', 'd2ffb970ba1b3700f8ea9baa32bffd74', 'service', 'Washing', 'en',0,2),
('47936cd368c9748649022b4e04cbd4f2', 'd2ffb970ba1b3700f8ea9baa32bffd74', 'service', 'Ironing', 'en',0,3),
-- ('57936cd368c9748649022b4e04cbd4f2', 'd2ffb970ba1b3700f8ea9baa32bffd74', 'service', 'Pressing', 'en',0,4),


('c565159e4697c29c630c41b1293c063c', '9657daa44260bb346d8baaed5f865606', 'service', "Baby-sitting", 'en',0,1),
('b565159e4697c29c630c41b1293c063c', '9657daa44260bb346d8baaed5f865606', 'service', "Nanny", 'en',0,2),
('fd9bd79b93a8fd84e1d3ce1956092be0', '9657daa44260bb346d8baaed5f865606', 'service', 'Support to Individuals', 'en',0,3),
('fd9bd79b93a8fd84e1d3ce1956092be1', '9657daa44260bb346d8baaed5f865606', 'service', 'Keeping of pets', 'en',0,4),

('c565159e4697c29c630c41b1293c0633', '5e1c6a961dec28865c792b5b2514120c', 'service', "Cooking", 'en',0,1),
('b565159e4697c29c630c41b1293c0633', '5e1c6a961dec28865c792b5b2514120c', 'service', "Pastry", 'en',0,2),
('fd9bd79b93a8fd84e1d3ce1956092be3', '5e1c6a961dec28865c792b5b2514120c', 'service', 'Balenced nutrition', 'en',0,3);

/*
--  -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
INSERT INTO `tag` (`id_tag`, `id_parent_tag`, `type_tag`, `title_tag`, `lang_tag`) VALUES
('671c9eca7f36118e0e336a9def3fdee0', NULL, 'service', 'House', 'en'),
('4f1c6a961dec28865c792b5b2514120c', NULL, 'service', 'Beauty', 'en'),
('4b7c90409368b88999cf9f69c02da6e6', NULL, 'service', 'Tutoring / Lessons', 'en'),
('7eec51a9923ac92a792300ccbd541e17', NULL, 'service', 'Sport', 'en'),
('49aea376bb5a51fa034d8963e2ea815d', NULL, 'service', 'Mobility', 'en'),
('d2ffb970ba1b3700f8ea9baa32bffd73', NULL, 'service', 'Virtual jobs', 'en'),
('87ad04504d9bb72d6fe445061d3486aa', NULL, 'service', 'Events and Parties', 'en'),
('9657daa44260bb346d8baaed5f865606', NULL, 'service', 'Support to individual/ Children', 'en'),
('9657daa44260bb346d8baaed5f865607', NULL, 'service', 'Repair', 'en'),
('d2ffb970ba1b3700f8ea9baa32bffd74', NULL, 'service', 'Consulting', 'en'),
('4b5a841bfcf00950657b827d6eb6f9af', '9657daa44260bb346d8baaed5f865607', 'service', 'Electromenager Repair', 'en'),
('91ae798de07d71156d4a55d1ca422a0f', '9657daa44260bb346d8baaed5f865607', 'service', 'Auto Repair', 'en'),
('6a0002cb2a0493aee7e90bbc01004d53', '27936cd368c9748649022b4e04cbd4f2', 'service', 'Computer Repair', 'en'),
('b1430cf48395d4203762e663428f456b', '49aea376bb5a51fa034d8963e2ea815d', 'service', 'Driver / Delivery', 'en'),
('2975beb12d5230722d41c4ded4a9c889', '49aea376bb5a51fa034d8963e2ea815d', 'service', 'Moving', 'en'),
('d1928afb2474ca6fab0fdaf7aadfbd62', '4b7c90409368b88999cf9f69c02da6e6', 'service', 'Computer lessons', 'en'),
('6c50f9e706a804872ec1674016867df5', '4b7c90409368b88999cf9f69c02da6e6', 'service', 'Music lessons', 'en'),
('b1bfecd0990fe22978e451ed57f88fe8', '4b7c90409368b88999cf9f69c02da6e6', 'service', 'Language lessons', 'en'),
('dc3d90da3b69b00ffda4099f89d214d6', '4b7c90409368b88999cf9f69c02da6e6', 'service', 'School support', 'en'),
('93390e81c4a73cde32a41f44b36bf113', '4b7c90409368b88999cf9f69c02da6e6', 'service', 'Cooking lessons', 'en'),
('4f423aa5c8dbeb87377805c80ec52772', '4f1c6a961dec28865c792b5b2514120c', 'service', 'Body care', 'en'),
('e410d9b44ebf8d8f7135bcc21a07ed48', '4f1c6a961dec28865c792b5b2514120c', 'service', 'Hair & Makeup', 'en'),
('d27f7bd17e303ff756d721803a91e98f', '4f1c6a961dec28865c792b5b2514120c', 'service', 'Rubbing', 'en'),
('d522a59862309cc5dea2f3e8349d8a3f', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Gardening', 'en'),
('9c84b22c3b0b033c5f7afe89b1789bad', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Paintings', 'en'),
('7c9cb0273e586fc0b513fe63a706ea01', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Caretaking', 'en'),
('6aed04e0205cd728549b730a49eabb02', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Plombing', 'en'),
('4a6d13d111d321b7968d2cde64eb0986', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Building work', 'en'),
('46f149a7a0e47d2c8d02b9c76d07873c', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Decorating', 'en'),
('44802920f148815df53cf900297fda72', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Woodwork', 'en'),
('27936cd368c9748649022b4e04cbd4f2', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Housekeeping / Laundry', 'en'),
('1a37c93c4d000ea63255147931bbc233', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'Electrical work', 'en'),
('18c3878a6c21adc3e4d52b95afca7145', '7eec51a9923ac92a792300ccbd541e17', 'service', 'Other sports', 'en'),
('93c725dd2f559ddf77633d1cf116869d', '7eec51a9923ac92a792300ccbd541e17', 'service', 'Health & Fitness', 'en'),
('edfa1da712add43d15bd28670287611f', '87ad04504d9bb72d6fe445061d3486aa', 'service', 'Other amusement', 'en'),
('a13427f0b40080a599f363161af4e45c', '87ad04504d9bb72d6fe445061d3486aa', 'service', 'Singer / Musician / DJ', 'en'),
('cd5de6902566b6b145c6e21286b9a190', '87ad04504d9bb72d6fe445061d3486aa', 'service', 'Restoring (Waiter, Cook …)', 'en'),
('fd9bd79b93a8fd84e1d3ce1956092be0', '9657daa44260bb346d8baaed5f865606', 'service', 'Health care', 'en'),
('c565159e4697c29c630c41b1293c063c', '9657daa44260bb346d8baaed5f865606', 'service', 'Childcare / Babysitting', 'en'),
('a64395d7e217775cd61502736a66a07b', '9657daa44260bb346d8baaed5f865606', 'service', 'Support for the elderly', 'en'),
('8d6e5e1c98a93542226d3cb3728f1cc1', 'd2ffb970ba1b3700f8ea9baa32bffd73', 'service', 'IT Support', 'en'),
('09482dfda978eabea0ded7f57235aa43', 'd2ffb970ba1b3700f8ea9baa32bffd73', 'service', 'Website Development', 'en'),
('09482dfda978eabea0ded7f57235aa44', 'd2ffb970ba1b3700f8ea9baa32bffd73', 'service', 'Programmation', 'en'),
('09482dfda978eabea0ded7f57235aa45', 'd2ffb970ba1b3700f8ea9baa32bffd73', 'service', 'Inserting Data', 'en'),
('09482dfda978eabea0ded7f57235aa46', 'd2ffb970ba1b3700f8ea9baa32bffd73', 'service', 'Translation', 'en'),
('09482dfda978eabea0ded7f57235aa47', 'd2ffb970ba1b3700f8ea9baa32bffd74', 'service', 'Consulting for administration', 'en'),
('09482dfda978eabea0ded7f57235aa48', 'd2ffb970ba1b3700f8ea9baa32bffd73', 'service', 'Articles & Text writing', 'en');



 -- 
INSERT INTO `tag` (`id_tag`, `id_parent_tag`, `type_tag`, `title_tag`, `lang_tag`) VALUES
('671c9eca7f36118e0e336a9def3fdee0', NULL, 'service', 'SV_HOME', 'fr'),
('4f1c6a961dec28865c792b5b2514120c', NULL, 'service', 'SV_BEAUTY', 'fr'),
('4b7c90409368b88999cf9f69c02da6e6', NULL, 'service', 'SV_SOUTIEN_COURS', 'fr'),
('7eec51a9923ac92a792300ccbd541e17', NULL, 'service', 'SV_SPORT', 'fr'),
('49aea376bb5a51fa034d8963e2ea815d', NULL, 'service', 'SV_MOBILITY', 'fr'),
('d2ffb970ba1b3700f8ea9baa32bffd73', NULL, 'service', 'SV_INFO', 'fr'),
('87ad04504d9bb72d6fe445061d3486aa', NULL, 'service', 'SV_RECEPTION', 'fr'),
('9657daa44260bb346d8baaed5f865606', NULL, 'service', 'SV_HELP_PERSON', 'fr'),
('9657daa44260bb346d8baaed5f865607', NULL, 'service', 'Réperations', 'fr'),
('d2ffb970ba1b3700f8ea9baa32bffd74', NULL, 'service', 'Conseils', 'fr'),
('4b5a841bfcf00950657b827d6eb6f9af', '27936cd368c9748649022b4e04cbd4f2', 'service', 'SV_ELECTROMENAGER', 'fr'),
('91ae798de07d71156d4a55d1ca422a0f', '27936cd368c9748649022b4e04cbd4f2', 'service', 'SV_PANNE_AUTO', 'fr'),
('6a0002cb2a0493aee7e90bbc01004d53', '27936cd368c9748649022b4e04cbd4f2', 'service', 'SV_PANNE_INFO', 'fr'),
('b1430cf48395d4203762e663428f456b', '49aea376bb5a51fa034d8963e2ea815d', 'service', 'SV_DRIVER_DELIVERY', 'fr'),
('2975beb12d5230722d41c4ded4a9c889', '49aea376bb5a51fa034d8963e2ea815d', 'service', 'SV_MOVE_OUT', 'fr'),
('d1928afb2474ca6fab0fdaf7aadfbd62', '4b7c90409368b88999cf9f69c02da6e6', 'service', 'SV_LESSON_INFO', 'fr'),
('6c50f9e706a804872ec1674016867df5', '4b7c90409368b88999cf9f69c02da6e6', 'service', 'SV_LESSON_MUSIC', 'fr'),
('b1bfecd0990fe22978e451ed57f88fe8', '4b7c90409368b88999cf9f69c02da6e6', 'service', 'SV_LESSON_LANG', 'fr'),
('dc3d90da3b69b00ffda4099f89d214d6', '4b7c90409368b88999cf9f69c02da6e6', 'service', 'SV_TEACHING', 'fr'),
('93390e81c4a73cde32a41f44b36bf113', '4b7c90409368b88999cf9f69c02da6e6', 'service', 'SV_LESSON_COOKING', 'fr'),
('4f423aa5c8dbeb87377805c80ec52772', '4f1c6a961dec28865c792b5b2514120c', 'service', 'SV_WELLNESS_BODY', 'fr'),
('e410d9b44ebf8d8f7135bcc21a07ed48', '4f1c6a961dec28865c792b5b2514120c', 'service', 'SV_FRISOR', 'fr'),
('d27f7bd17e303ff756d721803a91e98f', '4f1c6a961dec28865c792b5b2514120c', 'service', 'SV_MASSAGE', 'fr'),
('d522a59862309cc5dea2f3e8349d8a3f', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'SV_GARDEN', 'fr'),
('9c84b22c3b0b033c5f7afe89b1789bad', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'SV_PAINT', 'fr'),
('7c9cb0273e586fc0b513fe63a706ea01', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'SV_GARDIEN', 'fr'),
('6aed04e0205cd728549b730a49eabb02', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'SV_PLOMBERIE', 'fr'),
('4a6d13d111d321b7968d2cde64eb0986', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'SV_CONTRUCTION', 'fr'),
('46f149a7a0e47d2c8d02b9c76d07873c', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'SV_DECOR', 'fr'),
('44802920f148815df53cf900297fda72', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'SV_MENUSIER', 'fr'),
('27936cd368c9748649022b4e04cbd4f2', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'SV_LINGE', 'fr'),
('1a37c93c4d000ea63255147931bbc233', '671c9eca7f36118e0e336a9def3fdee0', 'service', 'SV_ELECTRICITY', 'fr'),
('18c3878a6c21adc3e4d52b95afca7145', '7eec51a9923ac92a792300ccbd541e17', 'service', 'SV_OTHER_SPORT', 'fr'),
('93c725dd2f559ddf77633d1cf116869d', '7eec51a9923ac92a792300ccbd541e17', 'service', 'SV_FITNESS', 'fr'),
('edfa1da712add43d15bd28670287611f', '87ad04504d9bb72d6fe445061d3486aa', 'service', 'SV_ENTRAINMENT', 'fr'),
('a13427f0b40080a599f363161af4e45c', '87ad04504d9bb72d6fe445061d3486aa', 'service', 'SV_SINGER_MUSICIAN', 'fr'),
('cd5de6902566b6b145c6e21286b9a190', '87ad04504d9bb72d6fe445061d3486aa', 'service', 'SV_RESTAURATION', 'fr'),
('fd9bd79b93a8fd84e1d3ce1956092be0', '9657daa44260bb346d8baaed5f865606', 'service', 'SV_GARDE_MALADE', 'fr'),
('c565159e4697c29c630c41b1293c063c', '9657daa44260bb346d8baaed5f865606', 'service', 'SV_BABY_SITTING', 'fr'),
('a64395d7e217775cd61502736a66a07b', '9657daa44260bb346d8baaed5f865606', 'service', 'SV_OLD_PERSON', 'fr'),
('8d6e5e1c98a93542226d3cb3728f1cc1', 'd2ffb970ba1b3700f8ea9baa32bffd73', 'service', 'SV_ASSIST_INFO', 'fr'),
('09482dfda978eabea0ded7f57235aa43', 'd2ffb970ba1b3700f8ea9baa32bffd73', 'service', 'SV_DEV_WEB', 'fr'),
('09482dfda978eabea0ded7f57235aa44', 'd2ffb970ba1b3700f8ea9baa32bffd73', 'service', 'Programmation', 'fr'),
('09482dfda978eabea0ded7f57235aa45', 'd2ffb970ba1b3700f8ea9baa32bffd73', 'service', 'Insertion de données', 'fr'),
('09482dfda978eabea0ded7f57235aa46', 'd2ffb970ba1b3700f8ea9baa32bffd73', 'service', 'Traduction', 'fr'),
('09482dfda978eabea0ded7f57235aa47', 'd2ffb970ba1b3700f8ea9baa32bffd74', 'service', 'Conseils administratifs', 'fr');
*/