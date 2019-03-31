#!/usr/local/bin/racket

;   TODO: move tests from diagonals  

#lang racket

(require
  "../diagonal.rkt"
  "../position.rkt"
  rackunit
  rackunit/text-ui
  )

(provide (all-defined-out))


(define a1 (make-position 1 1))
(define a2 (make-position 1 2))
(define a8 (make-position 1 8))

(define b1 (make-position 2 1))
(define b2 (make-position 2 2))
(define b3 (make-position 2 3))
(define b8 (make-position 2 8))

(define c3 (make-position 3 3))

(define e1 (make-position 5 1))
(define e5 (make-position 5 5))

(define g8 (make-position 7 8))

(define h1 (make-position 8 1))
(define h2 (make-position 8 2))
(define h7 (make-position 8 7))
(define h8 (make-position 8 8))

(define a1-h8 (make-diagonal a1 h8))
(define a2-g8 (make-diagonal a2 g8))
(define a8-h1 (make-diagonal a8 h1))
(define b8-h2 (make-diagonal b8 h2))
(define g8-h7 (make-diagonal g8 h7))


(define-test-suite diagonal-interface
 (test-case 
   "Test line constructor, selectors"

   (check-equal?
     (make-diagonal (make-position 1 2) (make-position 3 4))
     '((1 2) (3 4)))

   ; (define test-line (make-diagonal (make-position 1 1) (make-position 1 2)))

   ;-nn-(check-equal? (start-position test-line) '(1 1))
   ;-nn-(check-equal? (end-position test-line) '(1 2))

   )
 )

(define-test-suite diagonal-predicates
    (test-case
      "test same diagonal predicates"

      (check-true  (share-diagonal? a1 c3))

      (check-true (share-diagonal? e1 c3))


      )
    )
