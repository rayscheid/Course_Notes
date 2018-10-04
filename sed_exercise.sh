#!/bin/bash

# Navigate to ~/lecture-examples/tableofSNPs and run script

# The possible numbers range from 1000's (with 1 comma) to 1000000's (2 commas)

sed -E 's/"([0-9]*),?([0-9]+),?([0-9]+)"/\1\2\3/' tableofSNPs.csv > tableofSNPs_no_comma_numbers.csv 
# To remove the commas within numbers and the quites around the numbers, use: 
# ([0-9]*) to save the first set of numbers, * allows for full first set of numbers before first comma (zero or more of previous)
# ?([0-9]+) to save the next three digits after first comma, ? for continuation of number (zero or one of previous), + for rest of number (one or more of previous)
# ?([0-9]+) to save the next three digits after second comma, ? for continuation of number (zero or one of previous), + for rest of number (one or more of previous)

sed -n "s/[^,]//gp" tableofSNPs_no_comma_numbers.csv | sort | uniq
# To check if all commas were removed in CSV file
# [^,] deletes everything that is not a comma
# then sorts and finds unique lines
# output should have one line with three commas ",,," if commas in numbers, output should have ",,,", ",,,,", ",,,,,"
