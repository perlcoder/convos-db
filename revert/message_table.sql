-- Revert convos:message_table from pg

BEGIN;

    DROP TABLE convos.message;

COMMIT;
