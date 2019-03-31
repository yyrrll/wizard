; reverse the order of a sequence of elements, using fold-left

#lang racket

(require "fold-right_fold-left.rkt")

(define nil '())

(define (reverse-fold-left sequence)
  (fold-left
    (lambda
      (x y)
      (cons y x))
    nil
    sequence))


(require rackunit)

(define-test-suite reverse-fold-left-test
    (test-case
      "test reverse using fold-left"

    (check-equal?
      (reverse-fold-left '(1 2 3 4 5))
      '(5 4 3 2 1))
    
    ))

(check-equal?
  (cons 3 (cons 2 (cons 1 '())))
  '(3 2 1))

(run-test reverse-fold-left-test)

(provide
  reverse-fold-left
  reverse-fold-left-test
  )

; successive calls of con -- pattern similar to fold-right substitution execution
;   but, fold-left passes in each particular item, in its turn, as the first
;   argument to the operation -- and, when 1 is the argument, the cons chain
;   requires it to be the second argument to the cons chain created for 2

;   the lambda reverses the order
