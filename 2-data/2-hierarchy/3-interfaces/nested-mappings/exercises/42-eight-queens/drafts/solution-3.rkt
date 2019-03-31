#!/usr/local/bin/racket

; restore some abstraction (position interface -- constructor, selectors, predicates),
; renaming -- "first" -> "new-q", etc

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

  (define (same-row?      new-q prior-q)
    (= (pos-row new-q) (pos-row prior-q)))
  (define (same-column?   new-q prior-q)
    (= (pos-col  new-q) (pos-column prior-q)))
  (define (same-diagonal? new-q prior-q)
    (= (abs (- (pos-row    new-q) (pos-row    prior-q)))
       (abs (- (pos-col new-q) (pos-column prior-q)))))

  (define (can-attack? new-q prior-q)
    (or (same-row?      new-q prior-q)
        (same-column?   new-q prior-q)
        (same-diagonal? new-q prior-q)))

  (define (safe? k positions)   ; nb: argument << k >> not used
    (null? (filter (lambda (pos) (can-attack? (car positions) pos))
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
