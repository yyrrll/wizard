#!/usr/local/bin/racket

; calculate fibonacci numbers by iterative procedure
;   (given n, returns the nth number in the fibonnaci sequence)

;   Fibonacci sequence:
;       if n is 0   : 0
;          n is 1   : 1
;          otherwise: Fib(n-1) + Fib(n-2)

;   that is, the Fibonacci sequence begins with (0, 1); each subsequence
;   element is the sum of the prior two elements:
;       (0 1 1 2 3 5 8 13 21 34 55)

#lang racket

(define (fib n) 
  (fib-iter 1 0 n))
      
(define (fib-iter a b count)
  (if (= count 0)
    b
      (fib-iter (+ a b) a (- count 1))))

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
