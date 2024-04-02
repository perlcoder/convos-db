-- Verify convos:url_function on pg

BEGIN;

    SELECT EXISTS (
        SELECT 1
        FROM information_schema.routines
        WHERE routine_name = 'generate_chat_url'
        AND specific_schema = 'convos'
    );

ROLLBACK;
