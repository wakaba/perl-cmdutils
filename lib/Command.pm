package Command;
use strict;
use warnings;
use Exporter::Lite;
our $VERSION = '1.0';

our @EXPORT_OK = qw(x);

sub x (@) {
  print STDERR join ' ', @_;
  print STDERR "\n";

  my $r = system @_;
  if ($r == 0) {
    #
  } elsif ($? == -1) {
    die "$0: $_[0]: $!";
  } elsif ($? & 127) {
    die sprintf "$0: $_[0]: Child died with signal %d, %s coredump\n",
        ($? & 127), ($? & 128) ? 'with' : 'without';
  } else {
    die sprintf "$0: $_[0]: Child exited with value %d\n", $? >> 8;
  }
} # x

1;
