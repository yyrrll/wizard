#!/usr/local/bin/racket

;; Section 2.2.3 -- Sequences as Conventional Interfaces

#lang racket

(define nil '())

;   << filter >> 
;       return items in << sequence >> for which << predicate >> is true
;       primitive / implementation available in Racket (Scheme?)
;       demonstration of implementation
(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
            (cons (car sequence)
                   (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(provide filter)


; test

(require rackunit)

(check-equal?
  (filter
    odd?
    (list 1 2 3 4 5)
    )
  '(1 3 5))


;   additional

(check-equal?
    (filter symbol? (list 'x 'y 3 4 'z))
    '(x y z))
    
