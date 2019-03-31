#!/usr/local/bin/racket

; Exercise 2-34 -- Horner Rule polynomial evaluation


; Problem: Fill in the following template to produce a procedure that evaluates
; a polynomial using Horner's rule.  Assume coefficients are arranged in
; sequence [and, in rising exponent order]

;For example, to compute 1 + 3x + 5x3 + x5 at x = 2 you would evaluate
;   (horner-eval 2 (list 1 3 0 5 0 1))

; (define (horner-eval x coefficient-sequence)
;   (accumulate (lambda (this-coeff higher-terms) <??>)
;               0
;               coefficient-sequence))

;   (see 34-horner-polynomial-problem.png for detail)


#lang racket

(require "evaluate-polynomial.rkt"
         "../functions-local.rkt"
         )

; solution
(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) 
                (+ this-coeff (* x higher-terms))) 
              0
              coefficient-sequence))

; test
(require rackunit)

(define-test-suite horner-polynomial-test
    (test-case
      "horner polynomial tests"

     ;  (x^2) at x = 2
     (check-equal?
       (horner-eval 2 '(0 0 1))
       (evaluate-polynomial 2 '((1 . 2)))
       )
     
     ;  (x^2 + x) at x = 2
     (check-equal?
       (horner-eval 2 '(0 1 1))
       (evaluate-polynomial 2 '((1 . 2) (1 . 1))))
     
     ; ( 3x^2 + 5x + 2) at x = 2
     (check-equal?
       (horner-eval 2 '(2 5 3))
       (evaluate-polynomial 2 '((3 . 2) (5 . 1) (2 . 0))))
     
     ; (1 + 3x + 5x^3 + x^5) at x = 2
     (check-equal?
       (horner-eval 2 (list 1 3 0 5 0 1))
       (evaluate-polynomial 2 '((1 . 0) (3 . 1) (5 . 3) (1 . 5))))
     
     ; as above, explicit zeroes for missing exponents
     ;   (1 + 3x + 0x^2 + 5x^3 + 0x^4 + x^5) at x = 2
     (check-equal?
       (horner-eval 2 (list 1 3 0 5 0 1))
       (evaluate-polynomial 2 '((1 . 0) (3 . 1) (0 . 2) (5 . 3) (0 . 4) (1 . 5))))
     ))

(run-test horner-polynomial-test)

(provide horner-polynomial-test)
