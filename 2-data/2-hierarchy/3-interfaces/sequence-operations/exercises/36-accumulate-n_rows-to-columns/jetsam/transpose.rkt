#!/usr/local/bin/racket

; simpler definition / implementation of transpose

#lang racket

(require rackunit
         "../columns-rows.rkt"
         )

(define (transpose matrix)
  (if (null? (car matrix))
    '()
    (cons (map car matrix)
          (transpose (map cdr matrix)))))


; test

(check-equal?
 (transpose
  '((1) (2)))
 '((1 2))
 )

(check-equal?
  (transpose
    '((  1  2  3 )
      (  4  5  6 )))
  '((1 4 )
    (2 5 )
    (3 6 )
    )
  )

(check-equal?
  (transpose
    '((  1  2  3 )
      (  4  5  6 )
      (  7  8  9 )
      ( 10 11 12 )))
  '((1 4 7 10)
    (2 5 8 11)
    (3 6 9 12))
  )


; test against cases in other tests

(check-equal?
  (transpose rows)
  columns)
