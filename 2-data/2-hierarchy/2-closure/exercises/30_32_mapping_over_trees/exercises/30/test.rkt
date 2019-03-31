#!/usr/local/bin/racket

; Test solution to Excercise 2-30

#lang racket

(require rackunit
         "../30-square-tree.rkt")

(define tree
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))

(check-equal?
  tree
  '(1 (2 (3 4) 5) (6 7)))


(check-equal?
  (square-tree tree)
    '(1 (4 (9 16) 25) (36 49)))


(check-equal?
    (square-tree
      (list 1
            (list 2 (list 3 4) 5)
            (list 6 7)))
    '(1 (4 (9 16) 25) (36 49)))
