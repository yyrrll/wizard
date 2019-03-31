#!/usr/local/bin/racket

;; "the procedure list- ref takes as arguments a list and a number n and returns the nth item of the list"

#lang racket

(define (list-ref items n)
    (if (= n 0)
        (car items)
        (list-ref (cdr items) (- n 1))))
        
(define squares (list 1 4 9 16 25))
(list-ref squares 3)
16

(provide squares)
