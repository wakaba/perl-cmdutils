package Command;
use strict;
use warnings;
use Exporter::Lite;
our $VERSION = '1.0';

our @EXPORT_OK = qw(x);

sub x (@) {
  print STDERR join ' ', @_;
  print STDERR "\n";
  system @_;
  # XXX errors
} # x

1;
