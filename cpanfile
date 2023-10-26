on 'develop' => sub {
  requires 'Perl::Critic';
  requires 'Perl::Tidy';
};

on 'runtime' => sub {
    requires 'Modern::Perl';
    requires 'Getopt::Long';
    requires 'Scalar::Util';
    requires 'Digest::MD5';
    requires 'POSIX';
    requires 'DateTime';
    requires 'Net::DNS';
    requires 'Net::DNS::Native';
    requires 'IO::Socket::Socks';
    requires 'IO::Socket::SSL';
    requires 'Mojolicious';
    requires 'JSON::XS';
    requires 'Crypt::JWT';
};
