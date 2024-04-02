-- Revert convos:schema from pg

BEGIN;

    DROP SCHEMA convos;

COMMIT;
