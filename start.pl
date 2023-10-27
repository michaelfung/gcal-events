#!/usr/bin/env perl

# Entry script the Google Calendar Events Connector app

package GCalEvents;
use feature qw/signatures/;
use lib ('./lib', './local/lib/perl5');
use Modern::Perl;
use Getopt::Long 'GetOptions';
use GCalEvents::Worker;
use Mojo::Log;
use MyCache;

# hardcode time zone to Hong Kong
$ENV{TZ} = 'Asia/Hong_Kong';
POSIX::tzset;

# vars, objects and defaults
my $logger = Mojo::Log->new;
sub app_logger { return $logger; };
my $key_file = './secrets/calapi-service-account.json';
my $cache = MyCache->new();
sub app_cache { return $cache; };

# mandatory info check
my $GOOGLE_CALENDAR_ID = undef;
unless ($GOOGLE_CALENDAR_ID = $ENV{GOOGLE_CALENDAR_ID}) {
	$logger->error('GOOGLE_CALENDAR_ID environment not set');
	exit 1;
}

# parse command line options

# set options

# create workers
my $worker = GCalEvents::Worker->new(
    # logger => $logger
	calendar_id	=> $GOOGLE_CALENDAR_ID,
	key_file => $key_file
);

# start workers
$worker->run_once();

exit 0;
