;;  Section 2.1.1

;;  Implementation of rational numbers

#lang racket

(define (make-rat n d) (cons n d))
(define (numer x) (car x))
(define (denom x) (cdr x))

(provide 
    make-rat
    numer
    denom
    )
