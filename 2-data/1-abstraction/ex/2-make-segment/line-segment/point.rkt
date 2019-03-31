#!/usr/local/bin/racket

;;  Exercise 2.2

#lang racket

;;  Points

; constructor
(define (make-point x y)
  (cons x y))

; selectors
(define (x-coordinate point)
  (car point))

(define (y-coordinate point)
  (cdr point))

(define x-point x-coordinate)
(define y-point y-coordinate)
    ;; nb: names "x-point" and "y-point" match exercise specification.
    ;; x-coordinate and y-coordinate seem better names to me.


;; utility

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(provide (all-defined-out))
(require rackunit)


(check-equal?
  (make-point 1 2)
  '(1 . 2))

(define test-point (make-point 2 3))

(check-equal? (x-coordinate test-point) 2)
(check-equal? (y-coordinate test-point) 3)

(check-equal? (x-point test-point) 2)
(check-equal? (y-point test-point) 3)
