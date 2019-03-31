#!/usr/local/bin/racket

; use enumerate-tree, within map, to get list of leaves


#lang racket

(require
         rackunit
         "../../../functions/accumulate.rkt"
         "../../../examples/enumerate-tree.rkt"
     )


(check-equal?
  (enumerate-tree '(1 (2 (3 4)) 5))
  '(1 2 3 4 5))

(check-equal?
  (map enumerate-tree '(1 (2 (3 4)) 5))
  '((1) (2 3 4) (5)))

(define (same x) x)

(define same-l
  (lambda (i) i))

(check-equal? (same-l 4) 4)

(check-equal?
  (map same-l '(1 2 3 4 5))
 '(1 2 3 4 5))

(check-equal?
 (map (lambda (x) x) '(1 2 3 4 5))
  ; (map (lambda (x) (x)) (enumerate-tree '(1 (2 (3 4)) 5)))
 '(1 2 3 4 5))

(check-equal?
 (map (lambda (x) x) (enumerate-tree '(1 (2 (3 4)) 5)))
 '(1 2 3 4 5))


(check-equal?
 (accumulate (lambda (x y) (+ 1 y)) 0 (map (lambda (x) x) (enumerate-tree '(1 (2 (3 4)) 5))))
 5)
