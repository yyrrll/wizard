#!/usr/local/bin/racket

; "constructs a list of all the even Fibonacci numbers Fib(k), where k is less
; than or equal to a given integer n"

#lang racket

; preliminaries -- import from somewhere?

(define nil '())

; use local scope to enclose definition an duse of fib-iter
(define (fib n) 
  (define (fib-iter a b count)
    (if (= count 0)
      b
        (fib-iter (+ a b) a (- count 1))))
  (fib-iter 1 0 n))


; give list of even Fibonacci numbers for all k <= n

(define (even-fibs n)
  (define (next k)
    (if (> k n)
        nil
        (let ((f (fib k)))
          (if (even? f)
              (cons f (next (+ k 1)))
              (next (+ k 1))))))
  (next 0))

; tests

(require rackunit)

(check-equal? (even-fibs  0) '(0))
(check-equal? (even-fibs  1) '(0))
(check-equal? (even-fibs  2) '(0))
(check-equal? (even-fibs  3) '(0 2))
(check-equal? (even-fibs  4) '(0 2))
(check-equal? (even-fibs  5) '(0 2))
(check-equal? (even-fibs  6) '(0 2 8))
(check-equal? (even-fibs  7) '(0 2 8))
(check-equal? (even-fibs  8) '(0 2 8))
(check-equal? (even-fibs  9) '(0 2 8 34))
(check-equal? (even-fibs 10) '(0 2 8 34))
