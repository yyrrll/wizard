#lang racket

; from 2.3.2

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
        (else
         (error "unknown expression type -- DERIV" exp))))

