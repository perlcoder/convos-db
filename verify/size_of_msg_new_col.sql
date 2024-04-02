-- Verify convos:size_of_msg_new_col on pg

BEGIN;

    SELECT column_name
    FROM information_schema.columns
    WHERE table_name = 'message'
    AND table_schema = 'convos'
    AND column_name = 'size';

ROLLBACK;
