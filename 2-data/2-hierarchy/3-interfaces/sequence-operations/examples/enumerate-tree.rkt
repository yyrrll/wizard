#!/usr/local/bin/racket

; enumerate leaves of a tree

#lang racket

(define nil '())

(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(provide enumerate-tree)

;       Note 14: precisely the same as the << fringe >> procedure from Exercise
;       2.28.  Renamed here to emphasize it is part of a family of general
;       sequence-manipulation procedures.

(require rackunit)

(check-equal?
    (enumerate-tree '(1 (2 (3 4)) 5))
    '(1 2 3 4 5))


(check-equal?
    (enumerate-tree (list 1 (list 2 (list 3 4)) 5))
    '(1 2 3 4 5))

;   Tags:
;   - flatten nested structure
;   - "visit all leaves of a tree"
;   - "visit all nodes of a nested structure"
