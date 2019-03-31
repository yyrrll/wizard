#lang racket

; Exercise 2-54

(define (equal? a b)
  (or
    (eq? a b)   ; a and b both symbols, and have the same value
    (and        ; a and b both lists, and have equal items in the same order
       (pair? a)
       (pair? b)
       (equal? (car a) (car b))
       (equal? (cdr a) (cdr b)))
  )
)
