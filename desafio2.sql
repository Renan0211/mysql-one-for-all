USE SpotifyClone;

CREATE VIEW estatisticas_musicais AS
    SELECT 
        COUNT(DISTINCT s.song_id) AS cancoes,
        COUNT(DISTINCT a1.artist_id) AS artistas,
        COUNT(DISTINCT a2.album_id) AS albuns
    FROM
        SpotifyClone.songs AS s
            RIGHT JOIN
        SpotifyClone.albums AS a2 ON s.album_id = a2.album_id
            RIGHT JOIN
        SpotifyClone.artists AS a1 ON a2.artist_id = a1.artist_id;
