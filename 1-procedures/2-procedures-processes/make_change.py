#!/usr/bin/env python3

from copy import copy

from unittest import TestCase, main


DENOMINATIONS = [
 #  20 * 100,
 #  10 * 100,
 #   5 * 100,
         100,
          50,
          25,
          10,
           5,
           1,
    ]


def make_change(amount, denominations=None):
    if denominations is None:
        denominations = copy(DENOMINATIONS)
    change = []
    while denominations:
        n, amount = divmod(amount, denominations.pop(0))
        change.append(n)
    return change

def make_change_rcrsv(amount, denominations=copy(DENOMINATIONS)):
    if not denominations:
        change = []
    else:
        change = [amount % denominations[0]]
        change.extend(
                make_change_rcrsv(
                    amount-change[0]* denominations[0],
                    denominations[1:]))

    return change


class TestMakeChange(TestCase):

    fnc = make_change

    def test_6_cents(self):
        self.assertEqual(
            make_change(6),
            [  0,  0,  0,  0, 1, 1]
        )

    def test_11_cents(self):
        self.assertEqual(
            make_change(11),
            [  0,  0,  0,  1, 0, 1]
        )

    def test_380_cents(self):
        self.assertEqual(
            make_change(380),
            [  3,  1,  1,  0, 1, 0]
        )


class TestMakeChangeRecursive(TestMakeChange):

    fnc = make_change_rcrsv


if __name__ == '__main__':
    main()
