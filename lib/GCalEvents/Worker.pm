package GCalEvents::Worker;

use Mojo::Base -base, -signatures;

use POSIX;
use Getopt::Long 'GetOptions';
#use IO::All;
use Mojo::UserAgent;
use Mojo::JSON qw();
use JSON::XS qw(decode_json encode_json);
use Data::Printer qw(np), {hash_separator => ': '};
use Crypt::PK::RSA;
use Crypt::JWT qw(encode_jwt decode_jwt);
use DateTime;
use DateTime::Format::ISO8601;

has log => sub { GCalEvents::app_logger(); };
has cache => sub { GCalEvents::app_cache(); };

sub new {
    my $self = shift->SUPER::new;
    $self->_init;
    return $self;
}

sub _init ($self) {
    $self->log->info("msg=Initialize worker");
    # $self->cache->reset();
};

# run job for once
sub run_once ($self) {
    my $ok = 0;
    $self->log->info("msg=Worker run for once");
    return $ok;
};

1;
