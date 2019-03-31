#!/usr/local/bin/racket

#lang racket

(require
  "same-parity.rkt"
  rackunit
  )


(check-equal?
  (same-parity 1 2 3 4 5 6 7)
  '(1 3 5 7))

(check-equal?
  (same-parity 2 3 4 5 6 7)
  '(2 4 6))
