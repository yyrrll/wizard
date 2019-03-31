#!/usr/local/bin/racket

#lang racket

(require
  "line-segment/library.rkt"
  rackunit
  rackunit/text-ui
  )

(define-test-suite exercise-02-02
    (test-case
      "demonstrate satisfaction of problem requirements"

      (check-equal? (make-point 1 2) '(1 . 2))

      (define test_point (make-point 2 3))

      (check-equal? test_point '(2 . 3))
      (check-equal? (x-point test_point) 2)
      (check-equal? (y-point test_point) 3)

      (check-equal?
        (make-segment
          (make-point 5 6)
          (make-point 7 8))
        '((5 . 6) 7 . 8))


      (define horizontal (make-segment (make-point 0 0) (make-point 4 0))) 
      (check-equal? horizontal '((0 . 0) 4 . 0))
      (check-equal? (midpoint-segment horizontal) (make-point 2 0))

      (define vertical (make-segment (make-point 0 0) (make-point 0 6))) 
      (check-equal? vertical '((0 . 0) 0 . 6))
      (check-equal? (midpoint-segment vertical) (make-point 0 3))

      (define sloped (make-segment (make-point 0 0) (make-point 8 8))) 
      (check-equal? (midpoint-segment sloped) (make-point 4 4))

      )
    )

(run-tests exercise-02-02)
