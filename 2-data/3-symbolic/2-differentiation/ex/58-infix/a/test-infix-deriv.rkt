#!/usr/local/bin/racket

#lang racket

(require
  "deriv.rkt"
  rackunit
  )

(check-equal? (deriv 3        'x) 0)            ;  d(3)/d(x) =  0
(check-equal? (deriv 'x       'x) 1)            ;  d(x)/d(x) =  0
(check-equal? (deriv 'y       'x) 0)            ;  d(x)/d(x) =  0


(check-equal? (deriv '(x + 3)  'x) 1)
(check-equal? (deriv '(3 + x)  'x) 1)            ;  d(x + 3)/d(x) =  1

(check-equal? (deriv '(x * 3) 'x) 3)            ;  d(3x)/d(x) =  1
(check-equal? (deriv '(3 * x) 'x) 3)            ;  d(3x)/d(x) =  1

(check-equal? (deriv '(x * y) 'x) 'y)           ;   d(xy)/d(x) = y
(check-equal? (deriv '(y * x) 'x) 'y)           ;   d(xy)/d(x) = y

(check-equal? (deriv '(3 * (x * y)) 'x) '(3 * y)) ; d(3xy)/d(x) = 3y
; nb -- order changes in arbitrary args (check-equal? (deriv '(* (* x y) 3) 'x) '(* y 3)) ; d(3xy)/d(x) = 3y

(check-equal? (deriv '(x * x) 'x) '(x + x))     ;   d(x^2)/d(x) = 2x

(check-equal?
  (deriv '(y * (3 * x))       'x)               ;  d(3xy)/(dx)  = 3y
  '(y * 3))

(check-equal?
  (deriv '((x * x) * y)       'x)               ;  d(x^2 * y)/d(x) = 2xy
  '((x + x) * y))

(check-equal?
  (deriv '((x * y) * (x + 3)) 'x)               ;  d(x^2y + 3xy)/dx = 2xy + 3y
  '((x * y) + (y * (x + 3))))

(check-equal? (deriv '(x + (3 * (x + (y + 2)))) 'x) 4)
