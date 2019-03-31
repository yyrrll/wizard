#!/usr/local/bin/racket

; Build a tree with cons

#lang racket

(require rackunit)

; create and check target object

(define tree
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))
tree

(check-equal?
  tree
  '(1 (2 (3 4) 5) (6 7)))

(define tree-from-cons
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
tree-from-cons

(check-equal?
  tree
  tree-from-cons)


; example of 
;   -   build / create list with cons
;   -   list as pair holding a value (first item, integer or nesting pair) and
;       a nesting pair (or nil)
