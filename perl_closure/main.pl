# This code is to demonstrate that if a nested subroutine is referencing 
# a local variable in the outer subroutine, when the outer-subroutine is
# called the second time, the variable that the nested subroutine sees 
# will be the same with the first time, which is to say, the nested 
# subroutine has a closure (lexical scoped) that maintains a different 
# set of variable environment than the outer subroutine.
#
# A typical phenomena user will see is that, if warnings are turned on,
# "variable "" will not stay shared xxx" will show.
#

use strict;
use warnings;

require "closure.pl";

# main() will call a nested subroutine my_print() which print $globae 5 
# times in a loop. $globe is defined in main() and outside of my_print().
# $globe self-increases each time in the loop.
#
# In the first iteration in below, will print 1..5 due to for loop in 
# main(). However, during the 2nd through 5th iteration, will always print
# 6. This is because starting from the 2nd iteration, the nested 
# subroutine my_print() still sees the value from the 1st iteration.
for (1..5) {
    main();
}
