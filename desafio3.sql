CREATE VIEW SpotifyClone.historico_reproducao_usuarios AS
    SELECT 
    u.user_name AS usuario, s.song_name AS nome
FROM
    users AS u
        INNER JOIN
    user_historic AS uh ON uh.user_id = u.user_id
        INNER JOIN
    songs AS s ON uh.song_id = s.song_id
ORDER BY u.user_name ASC , s.song_name ASC;
