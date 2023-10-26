# Original Author: Sebastian Riedel

package MyCache;
use Mojo::Base -base, -signatures;

has 'max_keys' => 100;

sub get($self, $key) {
    if ($self->{cache}) {
        if (defined $self->{cache}{$key}) {
            return $self->{cache}{$key};
        } else {
            return undef;
        }
    }
    else {
        return undef;
    }
}

sub set($self, $key, $value)  {
  return $self unless (my $max = $self->max_keys) > 0;

  my $cache = $self->{cache} ||= {};
  my $queue = $self->{queue} ||= [];
  delete $cache->{shift @$queue} while @$queue >= $max;
  push @$queue, $key unless exists $cache->{$key};
  $cache->{$key} = $value;

  return $self;
}

sub unset($self, $key) {
  my $cache = $self->{cache} ||= {};
    if (exists($cache->{$key})) {
        $cache->{$key} = undef;
    }
  return $self;
}

sub cache {
    my ($self) = @_;
    return $self->{cache} ||= {};
}

sub size($self) {
    my $queue = $self->{queue} ||= [];
    return scalar @$queue;
}

sub reset($self) {
    $self->{cache} = {};
}

sub save($self) {}
sub restore($self) {}

1;
