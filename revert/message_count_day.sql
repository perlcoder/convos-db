-- Revert convos:message_count_day from pg

BEGIN;

    DROP FUNCTION convos.message_count_per_hour;

COMMIT;
