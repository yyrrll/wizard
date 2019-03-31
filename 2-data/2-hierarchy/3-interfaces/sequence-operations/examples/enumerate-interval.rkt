#!/usr/local/bin/racket

#lang racket

(define nil '())

; generate sequence of integers in a given range

; return list of integers from low to high

(define (enumerate-interval low high)
  (if (> low high)
    nil
    (cons low (enumerate-interval (+ low 1) high))))



(provide enumerate-interval)

; test / demonstrate

(require rackunit)

(check-equal?
  (enumerate-interval 2 7)
  '(2 3 4 5 6 7))


; NB: provides pattern for 
;   - halting iteration through recursive calls
;   - constructing list with checking for halt

(provide enumerate-interval)
