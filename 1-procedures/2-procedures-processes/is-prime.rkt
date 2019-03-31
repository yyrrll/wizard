#lang racket

(define (square n)
  (* n n))

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

; We can test whether a number is prime as follows: n is prime if and only if n is its own smallest divisor.

(define (prime? n)
  (= n (smallest-divisor n)))

(provide
  square
  smallest-divisor
  find-divisor
  divides?
  prime?
  )
