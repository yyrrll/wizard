#!/usr/local/bin/racket

; Footnote 12, Chapter 2
; file:///Users/gordon/Google%20Drive/study/sicp/materials/book/html/book-Z-H-15.html#call_footnote_Temp_166

; "Scheme standardly provides a map procedure that is more general than the one
; described here. This more general map takes a procedure of n arguments,
; together with n lists, and applies the procedure to all the first elements of
; the lists, all the second elements of the lists, and so on, returning a list
; of the results."

;       That is,
;
;           map takes a procedure of n arguments, and n lists, each list
;           providing values for one of the procedure's arguments.  For each
;           call of the procedure, Values from the first list are passed in as
;           the first argument, values from the second as the second argument,
;           etc.


#lang racket

(require rackunit)


(check-equal?
  (map + (list 1 2 3) (list 40 50 60) (list 700 800 900))
  (list 741 852 963))

(check-equal?
  (map (lambda (x y) (+ x (* 2 y)))
       (list 1 2 3)
       (list 4 5 6))
  (list 9 12 15))
