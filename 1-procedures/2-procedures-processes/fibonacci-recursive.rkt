#!/usr/local/bin/racket

; chapter 1 section 2

;   recursive fibonacci function
;   (given n, returns the nth number in the fibonnaci sequence)

;   Fibonacci sequence:
;       if n is 0   : 0
;          n is 1   : 1
;          otherwise: Fib(n-1) + Fib(n-2)


#lang racket

; (define (fib n)
;   (cond ((= n 0) 0)
;         ((= n 1) 1)
;         (else (+ (fib (- n 1)) (fib (- n 2))))))

(define (fib n)
  (if (<= n 1)
    n
    (+ (fib (- n 1))
       (fib (- n 2)))
  ))

(require rackunit)

(check-equal? (fib  0)  0)
(check-equal? (fib  1)  1)
(check-equal? (fib  2)  1)
(check-equal? (fib  3)  2)
(check-equal? (fib  4)  3)
(check-equal? (fib  5)  5)
(check-equal? (fib  6)  8)
(check-equal? (fib  7) 13)
(check-equal? (fib  8) 21)
(check-equal? (fib  9) 34)
(check-equal? (fib 10) 55)
