; http://community.schemewiki.org/?sicp-ex-2.36

;   TODO: move to examples on map

#lang racket

(require "../../functions/accumulate.rkt")

;   TODO move select-cars, -cdrs to some place on car / cdr syntax

(define (select-cars sequence) 
  (map car sequence)) 
 
(define (select-cdrs sequence) 
  (map cdr sequence)) 
 
;; Test 

(require
  "../columns-rows.rkt"
  rackunit
  )

(define t (list (list 1 2 3) (list 40 50 60) (list 700 800 900))) 

(check-equal?
    (select-cars t) 
    '(1 40 700))

(check-equal?
  (select-cdrs t)
  '(( 2 3) ( 50 60) ( 800 900))) 
 
(check-equal? (select-cars rows) '(1 4 7 10))
(check-equal? (select-cdrs rows) '((2 3) (5 6) (8 9) (11 12)))
