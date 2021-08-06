USE SpotifyClone;

CREATE VIEW top_3_artistas AS
    SELECT 
        CONCAT(a.first_name, ' ', a.last_name) AS artista,
        COUNT(ua.artist_id) AS seguidores
    FROM
        artists AS a
            INNER JOIN
        user_artist AS ua ON a.artist_id = ua.artist_id
    GROUP BY `artista`
    ORDER BY `seguidores` DESC , `artista` ASC
    LIMIT 3;
    
    SELECT * FROM top_3_artistas;
