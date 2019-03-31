#!/usr/local/bin/racket

#lang racket

(define nil '())

(define (scale-tree tree factor)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (* tree factor))
        (else (cons (scale-tree (car tree) factor)
                    (scale-tree (cdr tree) factor)))))



(require rackunit)

(check-equal?
  (scale-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)) 10)
  '(10 (20 (30 40) 50) (60 70)))
