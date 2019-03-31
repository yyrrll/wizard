#!/usr/local/bin/racket

#lang racket

(require "current.rkt"
          rackunit
          )


;; Check base cases

(check-equal?
 (deep-reverse '())
 '())

(check-equal?
 (deep-reverse 4)
 4)

;; Check one-element list

(check-equal?
 (deep-reverse '(4))
 '(4)
 "protects against contract-violation error on '(1 2), by assuring that deep-reverse of a list returns a list")


;; check reverse cases

(check-equal?
 (deep-reverse '(1 2))
 '(2 1))

(check-equal?
 (deep-reverse '(7 8 9))
 '(9 8 7))



;; check lists of lists

(define list-of-one '((1)))

(check-equal?
 (deep-reverse list-of-one)
 '((1)))

(check-equal?
 (deep-reverse '(((1))))
 '(((1))))

(define list-of-ones '((1)(2)))

(check-equal?
 (deep-reverse list-of-ones)
 '((2) (1)))
 

;; check given case

(define x (list (list 1 2) (list 3 4)))
 
(check-equal?  
    (deep-reverse x)
    '((4 3) (2 1)))
