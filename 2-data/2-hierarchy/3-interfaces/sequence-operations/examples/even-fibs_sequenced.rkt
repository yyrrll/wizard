#!/usr/local/bin/racket

; implement even-fibs using sequence interface

#lang racket

; preliminaries -- import from somewhere?

(define nil '())

(define (fib n) 
  (fib-iter 1 0 n))
      
(define (fib-iter a b count)
  (if (= count 0)
    b
      (fib-iter (+ a b) a (- count 1))))


(require
  "../../library-02-02-03.rkt"
  "enumerate-interval.rkt"
  )

; give list of even Fibonacci numbers for all k <= n

(define (even-fibs n)
  (accumulate
    cons
    nil
    (filter even? (map fib (enumerate-interval 0 n)))))

; tests / demonstrate
;   any way to share these with even-fibs.rkt ?

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
