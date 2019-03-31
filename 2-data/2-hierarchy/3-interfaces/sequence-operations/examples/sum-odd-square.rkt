#!/usr/local/bin/racket

#lang racket

; "the following procedure, analogous to the count-leaves procedure of section
; 2.2.2, which takes a tree as argument and computes the sum of the squares of
; the leaves that are odd

(define (square x)
  (* x x))

(define (sum-odd-squares tree)
  (cond ((null? tree) 0)  
        ((not (pair? tree))
         (if (odd? tree) (square tree) 0))
        (else (+ (sum-odd-squares (car tree))
                 (sum-odd-squares (cdr tree))))))

(require rackunit)

(check-equal?
  (sum-odd-squares '((1 2) (3 4)))
  10)

