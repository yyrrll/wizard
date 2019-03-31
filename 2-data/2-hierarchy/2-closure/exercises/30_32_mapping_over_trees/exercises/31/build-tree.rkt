#!/usr/local/bin/racket

; Build a tree with cons

#lang racket

(require rackunit)

; create and check target object

(define tree
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))

(check-equal?
  tree
  '(1 (2 (3 4) 5) (6 7)))


tree

(define b1 1)
b1

(define b3
  (cons 6
        (cons 7
              '())))
b3

(define b2b
  (cons 3
        (cons 4
              '())))
b2b

(define b2-v1
  (cons 2
        (cons b2b
              (cons 5
                    '()))))
b2-v1
            
(define b2
  (cons 2
        (cons (cons 3
                    (cons 4
                          '()))
              (cons 5
                    '()))))
b2



(define cons-tree-v1
  (cons b1
        (cons b2
              (cons b3
                    '()))))
cons-tree-v1
            

(define cons-tree-v2
  (cons 1
        (cons (cons 2
                    (cons (cons 3
                                (cons 4
                                      '()))
                          (cons 5
                                '())))
              (cons (cons 6
                          (cons 7
                                '()))
                    '()))))
cons-tree-v2
