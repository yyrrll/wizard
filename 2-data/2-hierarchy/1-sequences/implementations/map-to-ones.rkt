#!/usr/local/bin/racket

; use map to convert all leaves of nested listed to 1

#lang racket

(require
         rackunit
         "../../../../01-representing-sequences/implementations/map.rkt"
         ; "../../../implementations/map.rkt" ; fails because is symlink
         "../../../functions/accumulate.rkt"
     )

(define (to-one tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
           (to-one sub-tree)
           1))
  tree))

(check-equal?
  (to-one '(1 (2 (3 4)) 5))
  '(1 (1 (1 1)) 1))


(define (enumerate-tree-map tree)
  (map (lambda (node) 
         (if (pair? node)
           (enumerate-tree-map node)
           1))
       tree))

(check-equal?
  (enumerate-tree-map '(1 (2 (3 4)) 5))
   '(1 (1 (1 1)) 1))
