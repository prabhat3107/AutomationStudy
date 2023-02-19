#!/usr/bin/env python3

import argparse

parser = argparse.ArgumentParser(
    prog="args1",
    description="Description of command %(prog)s",
    epilog="Thanks for useing %(prog)s! :",
    fromfile_prefix_chars="@"
)

group1 = parser.add_argument_group("Greoup1 arguments")
group1.add_argument("g1_a1")
group1.add_argument("g1_a2")

group2 = parser.add_argument_group("Group2 arguments")
group2.add_argument("g2_a1")
group2.add_argument("g2_a2")

group3 = parser.add_argument_group("Group3 Options")
group3.add_argument("-c", "--connect")

args = parser.parse_args()


print(args)