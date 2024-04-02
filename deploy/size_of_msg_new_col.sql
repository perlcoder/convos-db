-- Deploy convos:size_of_msg_new_col to pg

BEGIN;

    ALTER TABLE convos.message ADD COLUMN size INTEGER GENERATED ALWAYS AS (LENGTH(message)) STORED;

COMMIT;
