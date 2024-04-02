-- Verify convos:message_count_day on pg

BEGIN;

    SELECT has_function_privilege('convos.message_count_per_hour(DATE)', 'execute');

ROLLBACK;
