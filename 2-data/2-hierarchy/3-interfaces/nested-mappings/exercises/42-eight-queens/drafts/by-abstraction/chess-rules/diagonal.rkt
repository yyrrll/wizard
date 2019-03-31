#!/usr/local/bin/racket

#lang racket

(require "position.rkt")

(provide (all-defined-out))

;;  Diagonals -- from positions

; constructor
(define (make-diagonal start-position end-position)
  (list start-position end-position))

; predicates
(define (share-diagonal? first second)
  (= (abs (/ (- (get-row second) (get-row first))
             (- (get-column second) (get-column first))))
     1))
