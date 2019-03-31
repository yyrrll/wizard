#lang racket

;; Invocation


(require "01-normalize-sign.rkt"
          rackunit
          )

(define neg-neg (make-rat -4 -10))
(define neg-pos (make-rat -4  10))
(define pos-pos (make-rat  4  10))
(define pos-neg (make-rat  4 -10))

(check-equal?  (numer neg-neg) 2)
(check-equal?  (denom neg-neg) 5)

(check-equal? (numer neg-pos) -2)
(check-equal? (denom neg-pos)  5)

(check-equal? (numer pos-pos)  2)
(check-equal? (denom pos-pos)  5)

(check-equal? (numer pos-neg) -2)
(check-equal? (denom pos-neg)  5)
