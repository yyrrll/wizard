#!/usr/local/bin/racket



#lang racket

(require
  "../../../exercises/accumulate-n.rkt"
  "../../columns-rows.rkt"
  )

(define (transpose mat)
  (accumulate-n cons '() mat))

(define (transpose-accumulate mat)
  (accumulate-n cons '() mat))

(provide transpose)


; test

(require rackunit)

(check-equal?
 (transpose
  '((1) (2)))
 '((1 2))
 )

(check-equal?
 (transpose
  '(( 1 2 3 )
    ( 4 5 6 )
    ))
 '((1 4)
   (2 5)
   (3 6)
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

; test implementations

(check-equal?
  (transpose rows)
  (transpose-accumulate rows))
