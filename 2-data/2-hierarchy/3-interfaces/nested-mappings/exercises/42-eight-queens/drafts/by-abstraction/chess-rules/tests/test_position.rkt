#!/usr/local/bin/racket

#lang racket

(require
  "../position.rkt"
  rackunit
  rackunit/text-ui
  )

(provide (all-defined-out))

(define-test-suite position-interface
    (test-case
      "check position constructor and selectors"

      (check-equal?
        (make-position 1 2)
        '(1 2))
      
      (define test-position (make-position 2 3))
      
      (check-equal? (get-column test-position) 2)
      (check-equal? (get-row test-position) 3)

      ))

(define-test-suite position-predicates
    (test-case
      "check position relationship predicates"

      (define a1 (make-position 1 1))
      (define a8 (make-position 1 8))
      (define h1 (make-position 8 1))
      
      (check-true  (same-column? a1 a8))
      (check-false (same-column? a1 h1))

      (check-true  (same-row? a1 h1))
      (check-false (same-row? a1 a8))

      ))
