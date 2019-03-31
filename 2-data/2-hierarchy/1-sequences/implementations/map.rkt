#!/usr/local/bin/racket

; Section 2.2.1 -- Representing Sequences

; an implementation of given procedure map

#lang racket

(define nil '())

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(require rackunit)

(check-equal?
  (map (lambda (x) (* x x)) '(1 2 3))
  '(1 4 9))

; "Map takes as arguments a procedure of one argument and a list, and returns a
; list of the results produced by applying the procedure to each element in the
; list"


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

