;;  Invocation: racket demo-rational-gcd.rkt

#lang racket

(require "rational-operations-gcd.rkt")

(define one-half (make-rat 1 2))
(define one-third (make-rat 1 3))

(print-rat
 (add-rat one-third one-third))
;; 2/3
