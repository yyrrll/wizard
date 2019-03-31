#!/usr/local/bin/racket


;; implementation of procedure length, which returns the number of items in a list

; nb: length provided by racket

#lang racket

(define (length items)
    (if (null? items)
        0
        (+ 1 (length (cdr items)))))
        
(define odds (list 1 3 5 7))
(length odds)
4


(provide odds)
