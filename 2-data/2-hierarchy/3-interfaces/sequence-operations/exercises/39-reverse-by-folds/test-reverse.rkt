#!/usr/local/bin/racket

#lang racket

(require rackunit)

(check-equal?
  (reverse '(1 2 3 4 5))
  '(5 4 3 2 1))
