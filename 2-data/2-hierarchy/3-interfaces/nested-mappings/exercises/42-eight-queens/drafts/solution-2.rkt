#!/usr/local/bin/racket

; initial solution after by-abstraction

#lang racket

(require "../../../../../library-02-02-03.rkt")

(provide (all-defined-out))

(define (queens board-size)

  (define empty-board '())

  (define (adjoin-position new-row k rest-of-queens) ; new queen at list head
    (append (list (cons k new-row)) rest-of-queens)) ; position (list column row)

  (define (can-attack? first second)
    (let ((row-diff (- (cdr second) (cdr first)))
          (col-diff (- (car second) (car first))))
        (= 0 (* (abs row-diff)
                (abs col-diff)
                (- (abs row-diff) (abs col-diff))))))

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
