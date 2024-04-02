-- Verify convos:schema on pg

BEGIN;

    SELECT pg_catalog.has_schema_privilege('convos', 'usage');

ROLLBACK;
