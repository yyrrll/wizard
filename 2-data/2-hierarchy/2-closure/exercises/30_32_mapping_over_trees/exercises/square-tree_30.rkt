; Exercise 2-30
;
; square-tree should behave as follows:
; 
; (square-tree
;   (list 1
;         (list 2 (list 3 4) 5)
;         (list 6 7)))
; 
; '(1 (4 (9 16) 25) (36 49))
; 
; define both directly (ie, without any higher-order procedure) and also using
; map and recursion


#lang racket

(require "../../../map.rkt")


(define (square-tree tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
           (square-tree sub-tree)
           (* sub-tree sub-tree)))
       tree))


(provide square-tree)
