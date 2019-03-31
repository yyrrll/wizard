#!/usr/local/bin/racket

; factor out position interface

#lang racket

(require "../../../library-02-02-03.rkt")

(provide (all-defined-out))

(define (queens board-size)

  (define empty-board '())

  (define (adjoin-position new-row k rest-of-queens) ; new queen at list head
    (append (list (cons k new-row)) rest-of-queens)) ; position (cons column row)

  (define (can-attack? col row prior-col prior-row)
    (or (= row prior-row)
        (= col prior-col)
        (= 1 (/ (abs (- prior-row row) )
                (abs (- prior-col col) )))))

  (define (safe? k positions)
    (null? (filter (lambda (pos)
                     (can-attack? k (cdar positions) (car pos) (cdr pos)))
                   (cdr positions))))

  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))
