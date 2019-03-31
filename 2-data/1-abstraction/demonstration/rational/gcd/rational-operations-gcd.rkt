;;  Section 2.1.1

;;  Operations on of rational numbers

;;      Uses the GCD interface, rather than the initial

#lang racket

;;  TODO: Refactor to avoid repetition of operation definitions
;;      - must be some way to get the operations with the GCD implementation without repeating the definitions in rational-operations.rkt

;;      - this should not repeat the definitions in ../rational-operations.rkt, but instead implement them with the GCD version of make-rat

(require "rational-interface-gcd.rkt")

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))


(provide 
    make-rat
    numer
    denom
    print-rat
    add-rat
    sub-rat
    mul-rat
    div-rat
    equal-rat?
    )

