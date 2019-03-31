;;  Invocation: racket demo-rational.rkt

#lang racket

(require "rational-operations.rkt")

(define one-half (make-rat 1 2))
(print-rat one-half)
;; 1/2

(define one-third (make-rat 1 3))
(print-rat
 (add-rat one-half one-third))
;; 5/6

(print-rat
 (mul-rat one-half one-third))
;; 1/6

(print-rat
 (add-rat one-third one-third))
;; 6/9
