CREATE VIEW SpotifyClone.top_2_hits_do_momento AS
    SELECT 
        s.song_name AS cancao, COUNT(uh.song_id) AS reproducoes
    FROM
        songs AS s
            INNER JOIN
        user_historic AS uh ON s.song_id = uh.song_id
    GROUP BY s.song_name
    ORDER BY reproducoes DESC , cancao ASC
    LIMIT 2;
