#!/usr/local/bin/racket

; muddling through draft solutions -- to the text requirements are known

#lang racket

(require
  "../functions.rkt"
  "../position.rkt"
  "../tests/test_diagonal.rkt"
  rackunit
  rackunit/text-ui
  )

(provide (all-defined-out))

(define-test-suite position-set-interface
    (test-case
      "check position-set interface"
      
      (check-equal?
        (add-position '(a1 b3) c3)
        '((3 3) a1 b3))

      (check-equal?
        (add-position '((1 1) (2 2)) c3)
        '((3 3) (1 1) (2 2)))

      (define test-position-set
        '(c3 b2 a1))

      (check-equal?
        (latest-position test-position-set)
        'c3)

      (check-equal?
        (prior-positions test-position-set)
        '(b2 a1))
      ))


(define-test-suite adjoin-position_test
    (test-case
      "check adjoin position"
      
      (check-equal?
        (adjoin-position 1 2 empty-board)
        '((2 1)))

      (check-equal?
        (adjoin-position 2 3 '((2 1)))
        '((3 2) (2 1)))
      ))


(define-test-suite safe-predicate
    (test-case
      "check safe?"
      
      (define position-set '(a1 b3 c5))
      (define k-test 3)

      (check-true (safe? k-test position-set))
      ))




(define-test-suite can-attack-predicate
    (test-case
      "test if one queen can attack another"

      (check-true  (can-attack? a1 b1))
      (check-true  (can-attack? a1 h1))

      (check-true  (can-attack? a1 a8))
      (check-true  (can-attack? a1 a2))

      (check-true  (can-attack? a1 b2))
      (check-true  (can-attack? a1 h8))

      (check-false (can-attack? a1 b3))
      (check-false (can-attack? a1 h7))

      (check-true  (can-attack? c3 e1))
      (check-true  (can-attack? e1 c3))

      (check-true  (can-attack? c3 e5))
      (check-true  (can-attack? e5 c3))

      (check-false (can-attack? c3 a2))
      ))
