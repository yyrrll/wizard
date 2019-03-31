#!/usr/local/bin/racket

; Exercise 2-30
;
; define << square-tree >> directly (without map or higher-order procedure) 


#lang racket

(require rackunit
         "../map.rkt")


; Directly

(define (square-tree-directly tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree-directly (car tree))
                    (square-tree-directly (cdr tree))))))


(check-equal?
    (square-tree-directly
      (list 1
            (list 2 (list 3 4) 5)
            (list 6 7)))
    '(1 (4 (9 16) 25) (36 49)))


; Motivation / Learnings

; Note that << pair? >> used to test if the argument is a list

; Notice that in -directly, the function 1) checks the list for null?,
; returning '() / nil (and so meets the requirement of list construction,, by
; << cons >>, that the last item of a list be nil); 2) calls << cons >> to
; build the returned list.

; In the map implementation, these two activities are performed by << map >>.
; << map >> checks (null?), and uses << cons >> for list construction.


; -directly uses << cond >>, because it must make two checks: one, for null?;
; the other, for pair? (eg, is the item a list?).  Both << square-tree and
; map use << if >>, because these checks are distributed over the two
; functions.  << map >> checks for null?; << square-tree >> checks for
; pair?.
