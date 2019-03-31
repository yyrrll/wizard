#!/usr/local/bin/racket

#lang racket

(require rackunit
         "../subsets_32.rkt")

(check-equal?
    (subsets '(1 2 3))
    '(() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3)))
