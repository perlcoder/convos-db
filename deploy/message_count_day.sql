-- Deploy convos:message_count_day to pg

BEGIN;

    CREATE OR REPLACE FUNCTION convos.message_count_per_hour(day DATE)
    RETURNS TABLE (hour_of_day INT, message_count_per_hour BIGINT, message_distribution DECIMAL) AS
    $$
    BEGIN
        RETURN QUERY
        SELECT
            EXTRACT(HOUR FROM m.date)::INT AS hour_of_day,
            COUNT(*) AS message_count_per_hour,
            COUNT(*)::DECIMAL / SUM(COUNT(*)) OVER () AS message_distribution
        FROM
            convos.message m
        WHERE
            DATE(m.date) = day
        GROUP BY
            EXTRACT(HOUR FROM m.date)
        ORDER BY
            EXTRACT(HOUR FROM m.date);
    END;
    $$
    LANGUAGE plpgsql;

COMMIT;
