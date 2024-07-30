DROP DATABASE IF EXISTS social_media_platform;
CREATE DATABASE social_media_platform;
USE social_media_platform;

CREATE TABLE users (
	id INT AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(100) UNIQUE NOT NULL,
	created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(100) NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE comments (
	id INT AUTO_INCREMENT PRIMARY KEY,
	comment_text VARCHAR(500) NOT NULL,
	photo_id INT NOT NULL,
	user_id INT NOT NULL,
	created_at TIMESTAMP DEFAULT NOW(),
	FOREIGN KEY (photo_id) REFERENCES photos(id),
	FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE likes (
	user_id INT NOT NULL,
	photo_id INT NOT NULL,
	created_at TIMESTAMP DEFAULT NOW(),
	FOREIGN KEY (photo_id) REFERENCES photos(id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	PRIMARY KEY (user_id, photo_id)
);

CREATE TABLE follows (
    follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

CREATE TABLE tags (
	id INT AUTO_INCREMENT PRIMARY KEY,
	tag_name VARCHAR(50) UNIQUE,
	created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags (
	photo_id INT NOT NULL,
	tag_id INT NOT NULL,
	FOREIGN KEY (photo_id) REFERENCES photos(id),
	FOREIGN KEY (tag_id) REFERENCES tags(id),
	PRIMARY KEY (photo_id, tag_id)
);

INSERT INTO users (username, created_at) VALUES ('Max_Maier', '2024-07-29 18:00:00.001'), ('Lea_Muller_18', '2024-07-29 19:00:00.001');
INSERT INTO photos (image_url, user_id) VALUES ('https://max.de', 1), ('https://lea.com', 2);
INSERT INTO follows (follower_id, followee_id) VALUES (1, 1), (2, 1);
INSERT INTO comments (comment_text, user_id, photo_id) VALUES ('vacation time', 1, 1), ('beach day', 1, 1);
INSERT INTO likes (user_id, photo_id) VALUES (1, 1), (2, 1);
INSERT INTO tags (tag_name) VALUES ('beach'), ('sun');
INSERT INTO photo_tags (photo_id, tag_id) VALUES (1, 1), (2, 1);