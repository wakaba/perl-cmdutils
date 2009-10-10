package Extras::Path::Class;
use strict;
use warnings;
our $VERSION = '1.0';

sub Path::Class::Dir::v_chdir ($) {
  my $self = shift;
  printf STDERR "cd %s\n", $self->stringify;
  return chdir $self;
} # v_chdir

sub Path::Class::Dir::v_mkpath ($) {
  my $self = shift;
  printf STDERR "mkdir %s\n", $self->stringify;
  return $self->mkpath;
} # v_mkpath

sub Path::Class::Entity::is_special_file_name ($) {
  my $self = shift;
  my $bn = $self->can('basename') ? 'basename' : undef;
  if (defined $bn) {
    return ($bn eq '.' or $bn eq '..');
  } else {
    my $name = $self->stringify;
    return ($name =~ m[/\.\.?\z] or $name eq '.' or $name eq '..');
  }
} # is_special_file_name

1;
