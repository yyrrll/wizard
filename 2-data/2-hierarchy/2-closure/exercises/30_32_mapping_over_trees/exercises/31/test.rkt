#!/usr/local/bin/racket

#lang racket

(require rackunit
         "../tree-map_31.rkt")


(define (square x)
  (* x x ))

(define (square-tree tree) (tree-map square tree))

; target
(check-equal?
    (square-tree
      (list 1
            (list 2 (list 3 4) 5)
            (list 6 7)))
    '(1 (4 (9 16) 25) (36 49)))
