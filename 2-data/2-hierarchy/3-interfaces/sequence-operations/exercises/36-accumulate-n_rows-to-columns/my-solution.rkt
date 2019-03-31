#!/usr/local/bin/racket

; working out procedure to transpose (remap?) list of rows to list of columns

#lang racket

(require "../functions-local.rkt")
; (require "../../functions/accumulate.rkt")

(define nil '())

; get row of first column values
(define (get-first-row nesting)
  (if (null? nesting)
    '()
    (append (list (car (car nesting)))
            (get-first-row (cdr nesting)))))

;   get sequence of rows with first column removed from initial
(define (first-items-removed nesting)
  (if (null? nesting) '()
    (cons (cdr (car nesting))
            (first-items-removed (cdr nesting)))))


(define (accumulate-n op init seqs)
  (if (null? (car seqs))
             nil
             (cons (accumulate op init (get-first-row seqs))
                   (accumulate-n op init (first-items-removed seqs)))))

; test

(require
  "../columns-rows.rkt"
  rackunit
  )

;   test internals


;   test solution


(define-test-suite accumulate-n-my-solution-test

    (test-case
      "test internal dependencies"

      (check-equal? (get-first-row rows) (car columns))
      (check-equal? (get-first-row rows) '(1 4 7 10))
      
      
      (check-equal?
        (first-items-removed rows)
        '(( 2  3 )
          ( 5  6 )
          ( 8  9 )
          (11 12 )))
      )

    (test-case
      "test solution to Exercise 36"

      (check-equal?
        (accumulate-n + 0 rows)
        '(22 26 30))

      (check-equal?
        (accumulate-n
          +
          0
          '(
            (   1   2   3 )
            (  10  20  30 )
            ( 100 200 300 )
            )
          )
           '( 111 222 333 )
           )

      )
    )

(run-test accumulate-n-my-solution-test)

(provide accumulate-n-my-solution-test)
