#lang racket

; 2.3.3 Sets as Binary Trees

(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(provide (all-defined-out))