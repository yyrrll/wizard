#!/usr/local/bin/racket

#lang racket

(require
  "interface.rkt"
  rackunit
  )

(provide sum-example product-example)

; variable?
(check-true (variable? 'x))

(check-true (variable? 'x))
(check-false (variable? 1))
(check-false (variable? '(+ x y)))
(check-false (variable? '(+ x 3)))

(check-true (same-variable? 'x 'x))
(check-false (same-variable? 'x 'y))
(check-false (same-variable? 1 1))

(check-true (=number? 1 1))
(check-false (=number? 1 2))
(define number-x 1)
(check-true (=number? number-x 1))

; sum

(check-equal? (make-sum 'x 0) 'x)
(check-equal? (make-sum 0 'x) 'x)
(check-equal? (make-sum 3 'x) '(+ 3 x))  ; make-sum puts any number first

(check-equal? (make-sum 'x 'y) '(+ x y))
(check-equal? (make-sum 1 2) 3)
(check-equal? (make-sum '(* 3 y) 0) '(* 3 y))

(define sum-example (make-sum 'x 3))

(check-true (sum? sum-example))

(check-false (variable? sum-example))
(check-false (product? sum-example))

(check-equal? (addend '(+ x 3)) 'x)
(check-equal? (augend '(+ x 3)) 3)

(check-equal? (addend '(+ x y)) 'x)
(check-equal? (augend '(+ x y)) 'y)

(check-equal? (addend '(+ 3 (+ x y))) 3)
(check-equal? (augend '(+ 3 (+ x y))) '(+ x y))


; product

(check-equal? (make-product 1 'y) 'y)
(check-equal? (make-product 'y 1) 'y)

(check-equal? (make-product 'y 0) 0)
(check-equal? (make-product 0 'y) 0)

(check-equal? (make-product 'x 'y) '(* x y))
(check-equal? (make-product 2 3) 6)
(check-equal? (make-product '(* 3 y) 1) '(* 3 y))

(define product-example (make-product 'x 3))

(check-true (product? product-example))
(check-false (product? sum-example))

(check-false (sum? product-example))

(check-equal? (multiplier '(* x 3)) 'x)
(check-equal? (multiplicand '(* x 3)) 3)

(check-equal? (multiplier '(* x y)) 'x)
(check-equal? (multiplicand '(* x y)) 'y)

(check-equal? (multiplier '(* 3 (* x y))) 3)
(check-equal? (multiplicand '(* 3 (* x y))) '(* x y))
