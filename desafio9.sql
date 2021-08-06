DELIMITER $$

CREATE PROCEDURE SpotifyClone.albuns_do_artista(IN artist_name VARCHAR(100))
BEGIN
SELECT
    CONCAT(a.first_name, ' ', a.last_name) AS artista,
    a2.album_title AS album
    FROM artists AS a
    INNER JOIN albums AS a2 ON a.artist_id = a2.artist_id
    WHERE CONCAT(a.first_name, ' ', a.last_name) = artist_name
    GROUP BY artista, album
    ORDER BY album ASC;
END $$

DELIMITER ;
