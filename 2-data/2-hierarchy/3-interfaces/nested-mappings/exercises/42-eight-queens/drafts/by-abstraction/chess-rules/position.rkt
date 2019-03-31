#!/usr/local/bin/racket

#lang racket

(provide (all-defined-out))

; board

(define empty-board '())

;  queen positions

; constructor
(define (make-position x y) (list x y))

; selectors
(define (get-column position) (car  position))
(define (get-row    position) (cadr position))


; predicates

(define (same-column? first second)
  (= (get-column first) (get-column second)))

(define (same-row? first second)
  (= (get-row first) (get-row second)))


; position-set -- set of queen positions

; constructor

(define (add-position position-set position)
  (append (list position) position-set))

; selectors

(define (latest-position position-set)
  (car position-set))

(define (prior-positions position-set)
  (cdr position-set))
