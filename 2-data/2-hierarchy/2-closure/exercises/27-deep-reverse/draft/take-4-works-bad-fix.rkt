#!/usr/local/bin/racket

#lang racket

(provide deep-reverse)

(define (deep-reverse items)
  (cond ((null? items) items)
        ; attempts to fix the take-4 list return problem with list in the base case -- this fixes contract violation, but fails tests
        ((not (pair? items)) (list items))
        (else (append (deep-reverse (cdr items))
                      (list (deep-reverse (car items)))))))
