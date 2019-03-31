#!/usr/local/bin/racket

;; Section 2.2.3 -- Sequences as Conventional Interfaces

#lang racket

(define nil '())

;; accumulate

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(provide accumulate)


(require rackunit)

;; examples / demonstrations -- << accumulate >> usage

(check-equal?
    (accumulate + 0 (list 1 2 3 4 5))
    15)

(check-equal?
  (accumulate * 1 (list 1 2 3 4 5))
  120)

(check-equal?
 (accumulate cons nil (list 1 2 3 4 5))
 '(1 2 3 4 5))

(check-equal?
  (accumulate list nil (list 1 2 3))
  '(1 (2 (3 ()))))

(check-equal?  (- 13 (- 8 5)) 10)
