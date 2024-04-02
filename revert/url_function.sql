-- Revert convos:url_function from pg

BEGIN;

    DROP FUNCTION convos.generate_chat_url(INT);

COMMIT;
