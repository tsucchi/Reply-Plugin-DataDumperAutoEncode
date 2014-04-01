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

Reply::Plugin::DataDumperAutoEncode - format and decode results using Data::Dumper::AutoEncode

=head1 SYNOPSIS

    ; in your .replyrc use following instead of [DataDumper]
    [DataDumperAutoEncode]

=head1 DESCRIPTION

Reply::Plugin::DataDumperAutoEncode uses L<Data::Dumper::AutoEncode> to format and encode results.
Results of L<Data::Dumper> has decoded string, it is hard to read for human. Using this plugin
instead of L<Reply::Plugin::DataDumper>, results are automatically decoded and easy to read for human.

=head1 SEE ALSO

L<Reply::Plugin::DataDumper>, L<Data::Dumper::AutoEncode>

=head1 LICENSE

Copyright (C) Takuya Tsuchida.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Takuya Tsuchida E<lt>tsucchi@cpan.orgE<gt>

=cut

