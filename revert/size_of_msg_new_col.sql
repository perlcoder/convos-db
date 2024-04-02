-- Revert convos:size_of_msg_new_col from pg

BEGIN;

    ALTER TABLE convos.message DROP COLUMN size;

COMMIT;
