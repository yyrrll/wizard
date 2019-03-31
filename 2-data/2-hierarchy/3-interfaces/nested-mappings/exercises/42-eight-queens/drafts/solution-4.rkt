#!/usr/local/bin/racket

; no predicates same-row?, etc ; can-attack? take k, row from safe?; renaming

#lang racket

(require "../../../../../library-02-02-03.rkt")
(provide (all-defined-out))

(define (queens board-size)

  (define empty-board '())

  (define (make-position column row)   (cons column row))

  (define (pos-row position)      (cdr position))
  (define (pos-col position)      (car position))

  (define (adjoin-position new-row k rest-of-queens) ; new queen at list head
    (append (list (make-position k new-row)) rest-of-queens)) ; position (cons column row)

  (define (can-attack? col row prior-q)
    (or (= row (pos-row prior-q))
        (= col (pos-col prior-q))
        (= 1 (/ (abs (- (pos-row prior-q) row) )
                (abs (- (pos-col prior-q) col) )))))

  (define (safe? k positions)
    (null? (filter (lambda (pos) (can-attack?
                                   k (pos-row (car positions)) pos))
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
