#!/usr/local/bin/racket

#lang racket

(require
  "interface.rkt"
  rackunit
  )
 
(check-equal? (addend '(+ x y z)) 'x)
(check-equal? (augend '(+ x y z)) '(+ y z))

(check-equal? (multiplier '(* x y z)) 'x)
(check-equal? (multiplicand '(* x y z)) '(* y z))
