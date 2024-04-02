-- Deploy convos:fts_convos to pg

BEGIN;

    CREATE EXTENSION IF NOT EXISTS pg_trgm;
    CREATE TEXT SEARCH CONFIGURATION convos.convos_search ( COPY = pg_catalog.english );
    CREATE INDEX message_full_text_idx ON convos.message USING gin(to_tsvector('convos.convos_search', message));

COMMIT;
