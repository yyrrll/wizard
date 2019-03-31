#!/usr/local/bin/racket

#lang racket

(require
  "chess-rules/functions.rkt"
  "chess-rules/position.rkt"
  "../../../../../library-02-02-03.rkt"
  )

(provide (all-defined-out))

(define (queens board-size)     ; template
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
