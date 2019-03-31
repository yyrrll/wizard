#!/usr/local/bin/racket

;; Invocation
;;      << racket [this file] >>
;;
;;  Interpretation
;;      If all tests pass, there is no output
;;      If a test fails, a report is sent to standard output

#lang racket

; << gcd >> - get greatest common denominator of two arguments
; - implementation of << gcd >>; racket provides a native function

(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))


(provide gcd)

; test

(require rackunit)

(check-equal? (gcd 28 16) 4 "basic test")
(check-equal? (gcd 16 28) 4 "test smaller before larger")

(check-equal? (remainder 28 16) 12)
(check-equal? (remainder 16 28) 16)
