package Bencher::Scenario::SprintfVsUnpack;

# DATE
# VERSION

use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark sprintf() vs unpack()',
    participants => [
        {
            name => 'sprintf',
            code_template => 'state $data = <sprintf_data>; my $res; for (1..1000) { $res = sprintf(<sprintf_fmt>, $data) } $res',
        },
        {
            name => 'unpack',
            code_template => 'state $data = chr(<unpack_data>); my $res; for (1..1000) { $res = unpack(<unpack_fmt>, $data) } $res',
        },
    ],
    datasets => [
        {
            name => 'binary-byte',
            args => {
                sprintf_fmt  => '%08b',
                sprintf_data => 15,
                unpack_fmt   => 'B8',
                unpack_data  => 15,
            },
            result => '00001111',
        },
    ],
};

1;
# ABSTRACT:

=head1 BENCHMARK NOTES
