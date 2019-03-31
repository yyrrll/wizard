#!/usr/local/bin/racket

#lang racket

;   motivation:
;       provides evaluation of polynomial equations
;       - for check against Horner Rule evaluation
;       - clearer, more transparent than Horner

; evaluate-polynomial:

;   evaluates a polynomial equation / expression
;       variable:
;           value of the variable
;       summand-params:
;           a list of pairs, each providing the coefficient and
;           exponent to which the variable is raised
;
;           (3 . 4) represents a coefficient of 3, an exponent of 4;
;               or, 3 * x^4


;   if the equation is 
;       3x^2 + 5x + 2 = 24
;   and 
;       x = 2
;   the arguments are
;     2 '((3 . 2) (5 . 1) (2 . 0)))
;       2 is value of x
;       (3 . 2) is 3 * x^2
;       (5 . 1) is 5 * x
;       (2 . 0) is 2 (eg, 2 * x^0)

(define (evaluate-polynomial variable summand-params)
  (if (null? summand-params)
    0
    (let ((term (car summand-params)))
          (+ (* (car term)
                (expt variable (cdr term)))
             (evaluate-polynomial variable (cdr summand-params))))))


(require rackunit)

; x = 2; x = 4
(check-equal?
  (evaluate-polynomial 2 '((1 . 1)))
  2)

; x = 2; x^2 = 4
(check-equal?
  (evaluate-polynomial 2 '((1 . 2)))
  4)

; x = 2; x^2 + x = 6
(check-equal?
  (evaluate-polynomial 2 '((1 . 2) (1 . 1)))
  6)

; x = 2; 3x^2 + 5x + 2 = 24
(check-equal?
  (evaluate-polynomial 2 '((3 . 2) (5 . 1) (2 . 0)))
  24)

(provide evaluate-polynomial)
