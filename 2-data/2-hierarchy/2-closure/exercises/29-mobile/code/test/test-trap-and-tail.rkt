#!/usr/local/bin/racket

; Test constructors

#lang racket

(require rackunit
         "../trap-and-tail.rkt"
         )

(check-equal? trap-and-tail '((6 10) (2 ((2 6) (1 4)))))
(check-equal? trap-and-tail (list trap-branch tail-branch))
(check-equal? trap-branch '(6 10))
(check-equal? trap-branch (list trap-rod trap-weight))
(check-equal? tail-branch '(2 ((2 6) (1 4))))
(check-equal? tail-branch (list tail-rod tail-mobile))
(check-equal? tail-mobile '((2 6) (1 4)))
(check-equal? tail-mobile (list left-scale-branch right-scale-branch))
(check-equal? left-scale-branch '(2 6))
(check-equal? left-scale-branch (list left-scale-rod left-scale-weight))
(check-equal? right-scale-branch '(1 4))
(check-equal? right-scale-branch (list right-scale-rod right-scale-weight))

(check-equal? trap-and-tail from-primitives)
(check-equal? trap-and-tail from-branch-components)

(print "ran test-trap-and-tail.rkt")
