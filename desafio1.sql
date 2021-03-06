DROP SCHEMA IF EXISTS SpotifyClone;
CREATE SCHEMA SpotifyClone;
USE SpotifyClone;

-- Creating and populating the plans table

CREATE TABLE plans (
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    plan_name VARCHAR(50) NOT NULL,
    plan_price DECIMAL(5 , 2 ) NOT NULL
);

INSERT INTO plans( plan_name, plan_price)  VALUES
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);

-- Creating and populating the artists table

CREATE TABLE artists (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100)
);

INSERT INTO artists(first_name, last_name) VALUES
('Walter', 'Phoenix'),
('Peter', 'Strong'),
('Lance', 'Day'),
('Freedie', 'Shannon');

-- Creating and populating the users table

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    user_age INT,
    plan_id INT,
    FOREIGN KEY (plan_id)
        REFERENCES plans (plan_id)
);

INSERT INTO users(user_name, user_age, plan_id) VALUES
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

-- Creating and populating the user_artist table

CREATE TABLE user_artist (
    user_id INT,
    artist_id INT,
    CONSTRAINT PRIMARY KEY (user_id , artist_id),
    FOREIGN KEY (user_id)
        REFERENCES users (user_id),
    FOREIGN KEY (artist_id)
        REFERENCES artists (artist_id)
);

INSERT INTO user_artist(user_id, artist_id) VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

-- Creating and populating the albums table

CREATE TABLE albums (
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    album_title VARCHAR(50),
    artist_id INT,
    FOREIGN KEY (artist_id)
        REFERENCES artists (artist_id)
);

INSERT INTO albums(album_title, artist_id) VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

-- Creating and populating the album_artist table

CREATE TABLE album_artist (
    album_id INT,
    artist_id INT,
    CONSTRAINT PRIMARY KEY (album_id , artist_id),
    FOREIGN KEY (album_id)
        REFERENCES albums (album_id),
    FOREIGN KEY (artist_id)
        REFERENCES artists (artist_id)
);

INSERT INTO album_artist(album_id, artist_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 4);

-- Creating and populating the songs table

CREATE TABLE songs (
    song_id INT AUTO_INCREMENT PRIMARY KEY,
    song_name VARCHAR(50) NOT NULL,
    album_id INT,
    FOREIGN KEY (album_id)
        REFERENCES albums (album_id)
);

INSERT INTO songs(song_name, album_id) VALUES
('Soul For Us', 1),
('Reflections Of Magic', 1),
('Dance With Her Own', 1),
('Troubles Of My Inner Fire', 2),
('Time Fireworks', 2),
('Magic Circus', 3),
('Honey, So Do I', 3),
("Sweetie, Let's Go Wild", 3),
('She Knows', 3),
('Fantasy For Me', 4),
('Celebration Of More', 4),
('Rock His Everything', 4),
('Home Forever', 4),
('Diamond Power', 4),
("Honey, Let's Be Silly", 4),
('Thang Of Thunder', 5),
('Words Of Her Life', 5),
('Without My Streets', 5);

-- Creating and populating the user_historic table

CREATE TABLE user_historic (
    user_id INT,
    song_id INT,
    CONSTRAINT PRIMARY KEY (user_id , song_id),
    FOREIGN KEY (user_id)
        REFERENCES users (user_id),
    FOREIGN KEY (song_id)
        REFERENCES songs (song_id)
);

INSERT INTO user_historic(user_id, song_id) VALUES
(1, 1),
(1, 6),
(1, 14),
(1, 16),
(2, 13),
(2, 17),
(2, 2),
(2, 15),
(3, 4),
(3, 16),
(3, 6),
(4, 3),
(4, 18),
(4, 11);
