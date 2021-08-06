CREATE VIEW SpotifyClone.perfil_artistas AS
    SELECT 
        CONCAT(a.first_name, ' ', a.last_name) AS artista,
        a2.album_title AS album,
        COUNT(ua.artist_id) AS seguidores
    FROM
        artists AS a
            INNER JOIN
        albums AS a2 ON a.artist_id = a2.artist_id
            INNER JOIN
        user_artist AS ua ON a.artist_id = ua.artist_id
    GROUP BY artista , album
    ORDER BY seguidores DESC , artista ASC , album ASC;
