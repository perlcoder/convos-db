-- Revert convos:fts_convos from pg

BEGIN;

    DROP INDEX message_full_text_idx;
    DROP TEXT SEARCH CONFIGURATION IF EXISTS convos.convos_search CASCADE;

COMMIT;
