-- Deploy convos:message_table to pg

BEGIN;

    CREATE TABLE convos.message(
        id SERIAL PRIMARY KEY,
        nick VARCHAR(255) NOT NULL,
        message text NOT NULL,
        irc  VARCHAR(100),
        room VARCHAR(100),
        date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    );

COMMIT;
