CREATE OR REPLACE VIEW im_view_users AS 
	SELECT pid_usr as user_id, url_usr as username, password_usr as password, '127.0.0.1' as 	last_known_ip, last_activity_usr as last_login 
		FROM `user`;

CREATE OR REPLACE VIEW im_view_status AS 
	SELECT pid_usr as user_id,   0 as status, 'offline' as message FROM `user` 
		WHERE last_activity_usr < DATE_SUB( NOW( ) , INTERVAL 15 MINUTE) 
	UNION 
	SELECT pid_usr as user_id,   
			CASE status_usr
			WHEN 2 THEN 1
			WHEN 3 THEN 1
			WHEN 4 THEN 2
			ELSE 0 END AS status,
			CASE status_usr
			WHEN 2 THEN "Disponible"
			WHEN 3 THEN "Disponible"
			WHEN 4 THEN "Non-disponible"
			ELSE 'offline' END AS message  
		FROM `user` 
			WHERE last_activity_usr >= DATE_SUB( NOW( ) , INTERVAL 15 MINUTE);
		
CREATE OR REPLACE VIEW im_view_friends AS 
	SELECT  u.pid_usr as user_id, f.pid_usr as friend_id, IF (status_usrusr = 'A', 2,1) as group_id
		FROM `user_user` 
	INNER JOIN `user`  as u ON (id_followed_usrusr = u.id_usr)
	INNER JOIN `user`  as f ON (id_follower_usrusr = f.id_usr)
		WHERE status_usrusr IN ('F','W','A');

CREATE OR REPLACE VIEW im_view_groups AS 
	SELECT 1 as group_id , 'My Followers' as name FROM DUAL
	UNION
	SELECT 2 as group_id, 'Mes Collaborators' as name FROM DUAL;

