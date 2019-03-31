#lang racket

; from 2.3.2, extended for exponets 

(require
  "interface.rkt"
  )

(provide (all-defined-out))

(define (deriv exp var)
        ; exp: the algrebaic expression to be differentiated
        ; var: the variable to which the differential is taken
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
        ((exponentiation? exp)
         (make-product 
                       (make-product (exponent exp)
                                     (make-exponent (base exp)
                                                    (- (exponent exp) 1)))
                       (deriv (base exp) var))
           )
        (else
         (error "unknown expression type -- DERIV" exp))))

