#!/usr/local/bin/racket

; demonstrate usage of lambda to create function / procedure

#lang racket

(define (plus4 x)
  (+ x 4))

(define plus4-l (lambda (x) (+ x 4)))

(require rackunit)

(check-equal?  (plus4 4) 8)
(check-equal?  (plus4-l 4) (plus4 4))

(check-equal? ((lambda (x) (+ x 4)) 3) 7)
