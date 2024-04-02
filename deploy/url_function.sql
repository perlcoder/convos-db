-- Deploy convos:url_function to pg

BEGIN;

    CREATE OR REPLACE FUNCTION convos.generate_chat_url(id INT) RETURNS TEXT AS $$
        use URI::Escape;
        use strict;
        use warnings;
        
        my $id = $_[0];
        my $addr = 'https://social.envs.subut.ai/chat/';
        my $url;
        
        # Retrieve values from the message table
        my $query = "SELECT irc, room, date FROM convos.message WHERE id = $id";
        my $result = spi_query($query);
        my $row = spi_fetchrow($result);
        
        # Construct the URL-encoded string
        if ($row) {
            my ($irc, $room, $date) = @{$row}{ qw(irc room date) };
            $room =~ s/\.log$//;
            $date =~ s/ /T/;
            $url = $addr . join('/',(map { uri_escape($_) } $irc, $room));
            $url .= qq{#$date.000Z};
        } else {
            elog(NOTICE, qq{fetched row "$row"});
            $url = "Error: Message with ID $id not found";
        }
        spi_cursor_close($result);
        
        return $url;
    $$ LANGUAGE plperlu;

COMMIT;
