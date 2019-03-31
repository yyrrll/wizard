#!/usr/local/bin/racket

#lang racket

(require
  "deriv.rkt"
  "interface.rkt"
  rackunit
  rackunit/text-ui
 )

(provide (all-defined-out))

(define-test-suite test-deriv
    (test-case
        "derivations of increasing complexity"

        (check-equal? (deriv 3        'x) 0)            ;  d(3)/d(x) =  0
        (check-equal? (deriv 'x       'x) 1)            ;  d(x)/d(x) =  0
        (check-equal? (deriv 'y       'x) 0)            ;  d(x)/d(x) =  0
        
        (check-equal? (deriv '(+ x 3) 'x) 1)            ;  d(x + 3)/d(x) =  1
        (check-equal? (deriv '(+ 3 x) 'x) 1)            ;  d(x + 3)/d(x) =  1
        
        (check-equal? (deriv '(* x 3) 'x) 3)            ;  d(3x)/d(x) =  1
        (check-equal? (deriv '(* 3 x) 'x) 3)            ;  d(3x)/d(x) =  1
        
        (check-equal? (deriv '(* x y) 'x) 'y)           ;   d(xy)/d(x) = y
        (check-equal? (deriv '(* y x) 'x) 'y)           ;   d(xy)/d(x) = y
        
        (check-equal? (deriv '(* 3 (* x y)) 'x) '(* 3 y)) ; d(3xy)/d(x) = 3y
        ; nb -- order changes in arbitrary args (check-equal? (deriv '(* (* x y) 3) 'x) '(* y 3)) ; d(3xy)/d(x) = 3y
        
        (check-equal? (deriv '(* x x) 'x) '(+ x x))     ;   d(x^2)/d(x) = 2x
        
        (check-equal?
          (deriv '(* (* 3 x) y)       'x)               ;  d(3xy)/(dx)  = 3y
          '(* 3 y))
        
        (check-equal?
          (deriv '(* (* x x) y)       'x)               ;  d(x^2 * y)/d(x) = 2xy
          '(* (+ x x) y))
        
        (check-equal?
          ;  d(x^2y + 3xy)/dx = xy + y * (x + 3) = xy + xy + 3y = 2xy + 3y
          (deriv '(* (* x y) (+ x 3)) 'x)               
          '(+ (* x y) (* y (+ x 3))))

        ;   used to check for source of << deriv >> definition
        ;       test should fail on book definition,
        ;       pass on Exercise 56 definition
        ; (check-equal?  (deriv '(** x 2) 'x) '(* 2 x))

        )
    )

(run-tests test-deriv)
