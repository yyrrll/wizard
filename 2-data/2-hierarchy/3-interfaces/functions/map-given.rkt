#!/usr/local/bin/racket

; Section 2.2.1 -- Representing Sequences

; demonstration of map, as given, when passed several lists

#lang racket

(require rackunit)

(check-equal?
  (map + '(1 2 3) '(10 20 30) '(100 200 300))
  '(111 222 333))

; Note:
; Scheme standardly provides a map procedure that is more general than the one
; described here. This more general map takes a procedure of n arguments,
; together with n lists, and applies the procedure to all the first elements of
; the lists, all the second elements of the lists, and so on, returning a list
; of the results. For example:
; 
; (map + (list 1 2 3) (list 40 50 60) (list 700 800 900))
; (741 852 963)
; 
; (map (lambda (x y) (+ x (* 2 y)))
;      (list 1 2 3)
;      (list 4 5 6))
; (9 12 15)

; TODO -- move / add quotes to outline?


; example << map >> implementation -- also native to Scheme
