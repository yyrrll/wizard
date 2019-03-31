; reverse the order of a sequence of elements, using fold-right

#lang racket

(require "fold-right_fold-left.rkt")

(define nil '())

(define (reverse-fold-right sequence)
  (fold-right
    (lambda
      (x y)
      (append y (list x)))
    nil
    sequence))


(require rackunit)

; nested -- pattern similar to fold-left substitution execution
    ; but, the arguments are passed to the operation in reverse order of
    ; required (by append) by fold-right -- the lambda reverses them (and
    ; transforms, a bit)

; show append list creation
;   TODO -- move?
(check-equal?
  (append (list 3) (append (list 2) (append '(1) '())))
  '(3 2 1))


(define-test-suite reverse-fold-right-test
    (test-case
      "test reverse using fold-right"

    (check-equal?
      (reverse-fold-right '(1 2 3 4 5))
      '(5 4 3 2 1))
    
    ))

(run-test reverse-fold-right-test)

(provide
  reverse-fold-right
  reverse-fold-right-test
  )
