package Reply::Plugin::DataDumperAutoEncode;
use 5.008005;
use strict;
use warnings;

our $VERSION = "0.01";

use parent 'Reply::Plugin';
use Data::Dumper::AutoEncode;

sub new {
    my $class = shift;

    $Data::Dumper::Terse = 1;
    $Data::Dumper::Sortkeys = 1;

    return $class->SUPER::new(@_);
}

sub mangle_result {
    my $self = shift;
    my (@result) = @_;
    return eDumper(@result == 0 ? () : @result == 1 ? $result[0] : \@result);
}

1;

1;
__END__

=encoding utf-8

=head1 NAME

Reply::Plugin::DataDumperAutoEncode - It's new $module

=head1 SYNOPSIS

    use Reply::Plugin::DataDumperAutoEncode;

=head1 DESCRIPTION

Reply::Plugin::DataDumperAutoEncode is ...

=head1 LICENSE

Copyright (C) Takuya Tsuchida.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Takuya Tsuchida E<lt>tsucchi@cpan.orgE<gt>

=cut

