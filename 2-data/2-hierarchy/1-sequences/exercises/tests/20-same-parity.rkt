#!/usr/local/bin/racket

#lang racket

(require "../20-same-parity.rkt"
          rackunit
          )

;; initial tests 

(check-equal?  
    (same-parity 1 2 3 4 5 6 7)
    '(1 3 5 7))

(check-equal?  
    (same-parity 2 3 4 5 6 7)
    '(2 4 6))


;; Debugging interactive.2.rkt
;;      how to break out to file of its own?

;; check return order

(check-equal?  
    (same-parity 1 2 3)
    '(1 3))

(check-equal?  
    (same-parity 1 2 3 5)
    '(1 3 5))


;; inserting items of wrong parity

(check-equal?  
    (same-parity 1 2 3 4 6)
    '(1 3))

