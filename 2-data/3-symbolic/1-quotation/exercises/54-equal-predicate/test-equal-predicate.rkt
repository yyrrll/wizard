#!/usr/local/bin/racket

#lang racket

(require
  "equal-predicate.rkt"
  rackunit
  rackunit/text-ui
  )


(define-test-suite test-equal?
    (test-case
      "check equal?"

      (check-equal?
        (equal? '(this is a list) '(this is a list))
        #t)

      (check-equal?
        (equal? '(this is a list) '(this (is a) list))
        #f)
      )
    )

(run-test test-equal?)

