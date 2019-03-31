#!/usr/local/bin/racket

#lang racket

(provide deep-reverse)

(define (append-debug x y)
    (append x y))

(define (deep-reverse items)
  (cond ((null? items) items)
        ((not (pair? items)) items)
        ;; ((not (pair? items)) (list items)) ;; avoids error, fails tests
        (else (append (deep-reverse (cdr items))
                      (deep-reverse (car items))))))



(require rackunit)

(define x '(7 8 9))
(check-equal?
 (deep-reverse x)
 '(9 8 7))

