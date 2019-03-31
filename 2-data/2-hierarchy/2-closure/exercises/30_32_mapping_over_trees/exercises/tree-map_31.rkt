#!/usr/local/bin/racket

; Abstract your answer to Exercise 2.30 to produce a procedure << tree-map >>
; with the property that << square-tree >> could be defined as
;
;    (define (square-tree tree) (tree-map square tree))

#lang racket

(define (tree-map proc tree)
  (cond ((pair? tree) (cons (tree-map proc (car tree))
                            (tree-map proc (cdr tree))))
        ((null? tree) '())
        (else (proc tree))))


(provide tree-map)
