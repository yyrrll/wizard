#!/usr/local/bin/racket

#lang racket

(require "../map.rkt"
         rackunit)

(check-equal?
  (map
    (lambda (x) (* x x))
    '(1 2 3 4))
  '(1 4 9 16))

(check-equal?
  (map
    abs
    '(-10 2.5 -11.6 17))
  '(10 2.5 11.6 17))
