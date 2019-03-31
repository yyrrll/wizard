#!/usr/local/bin/racket

#lang racket

(require
  "interface.rkt"
  rackunit
  )

;   exponent

(check-equal? (make-exponent 2 3) 8)
(check-equal? (make-exponent 'x 3) '(** x 3))
(check-equal? (make-exponent 'x 'y) '(** x y))

(check-equal? (base     '(** x 3)) 'x)
(check-equal? (exponent '(** x 3))  3)

(check-true (exponentiation? (make-exponent 'x 3)))
(check-true (exponentiation? '(** x 3)))
