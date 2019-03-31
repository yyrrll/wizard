;; Exercise 2.29 

#lang racket

(provide 
         make-branch
         make-mobile
         branch-length
         branch-structure
         left-branch
         right-branch
         )

; Constructors (Given)

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

; Selectors (branches -- left, right; branch components -- length, structure
;   2.29.a 

(define (left-branch mobile)
    (car mobile))

(define (right-branch mobile)
    (car (cdr mobile)))

(define (branch-length branch)
    (car branch))

(define (branch-structure branch)
    (car (cdr branch)))
