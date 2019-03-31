#!/usr/local/bin/racket

; Exercise 2.28
; 
; Write a procedure fringe that takes as argu- ment a tree (represented as a
; list) and returns a list whose elements are all the leaves of the tree arranged
; in left-to-right order. For example,
; 
; (define x (list (list 1 2) (list 3 4))) (fringe x)
; (1 2 3 4)
; (fringe (list x x))
; (1 2 3 4 1 2 3 4)


#lang racket

(define (fringe li)
  (cond 
        ((null? li) li)
        ((not (pair? li)) (list li))
        (else (append (fringe (car li))
                      (fringe (cdr li))))))

; Test
(require rackunit) 

;   base cases
(check-equal?  (fringe 1) '(1))
(check-equal?  (fringe '()) '())

; required cases
(define x (list (list 1 2) (list 3 4)))

(check-equal?  (fringe x) '(1 2 3 4))
(check-equal?  (fringe (list x x)) '(1 2 3 4 1 2 3 4))

; Motivation:
; 
;     Build intuition on branch inheritance of overall left-right magnitude from
;     parent subtree ?

;     Provides example of visiting all nodes of nested structure (see
;     discussion in subsection 03, "Sequences as Conventional Interfaces", near
;     note 14)


