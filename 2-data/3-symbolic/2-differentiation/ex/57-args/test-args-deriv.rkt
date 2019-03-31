#!/usr/local/bin/racket

#lang racket

(require
  "deriv.rkt"
  "interface.rkt"
  rackunit
  )

;   compare (deriv) with two-argument operations against deriv with arbitrary arguments

(check-equal?
  (deriv '(* (* x y) (+ x 3)) 'x)
  (deriv '(* x y (+ x 3)) 'x)
  )
