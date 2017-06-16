use strict;
use warnings;

sub main {
    my $globe = 1;

    my $my_print = sub {
        print "$globe\n";
    };

    &$my_print();

    for (1..5) {
        $globe++;
        &$my_print();

    }
}

# main();

1;
