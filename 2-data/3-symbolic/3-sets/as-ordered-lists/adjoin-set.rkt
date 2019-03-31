#!/usr/local/bin/racket

#lang racket

(require rackunit)
(provide (all-defined-out))

    ;  implement adjoin-set with ordered list representation of set
        ; "ordered" means ascending ordered

(define (adjoin-set x ordered)
    (cond 
          ((null? ordered)     (list x))
          ((< x (car ordered)) (cons x ordered))
          ((= x (car ordered)) ordered)
          ((> x (car ordered))      ; greater-than more explicit than << else >>
            (cons (car ordered) (adjoin-set x (cdr ordered))))))


(check-equal?  (adjoin-set 5 '()) '(5))
(check-equal?  (adjoin-set 5 '(5 8 13 21)) '(5 8 13 21))
(check-equal?  (adjoin-set 6 '(5 8 13 21)) '(5 6 8 13 21))
(check-equal?  (adjoin-set 13 '(5 8 13 21)) '(5 8 13 21))
(check-equal?  (adjoin-set 34 '(5 8 13 21)) '(5 8 13 21 34))

(check-equal? (adjoin-set  0 '()) '(0))
(check-equal? (adjoin-set  1 '()) '(1))

(define example '(1 2 3 5 8 13 21))

(check-equal? (adjoin-set  1 example) '(  1 2 3 5   8   13 21    ))
(check-equal? (adjoin-set  0 example) '(0 1 2 3 5   8   13 21    ))
(check-equal? (adjoin-set 22 example) '(  1 2 3 5   8   13 21 22 ))
(check-equal? (adjoin-set  7 example) '(  1 2 3 5 7 8   13 21    ))
(check-equal? (adjoin-set  8 example) '(  1 2 3 5   8   13 21    ))
(check-equal? (adjoin-set  9 example) '(  1 2 3 5   8 9 13 21    ))


; Exercise 2.61.  
; 
; Give an implementation of adjoin-set using the ordered representation. By
; analogy with element-of-set? show how to take advantage of the ordering to
; produce a procedure that requires on the average about half as many steps as
; with the unordered representation.
