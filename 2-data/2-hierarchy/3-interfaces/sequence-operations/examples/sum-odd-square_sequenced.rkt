#!/usr/local/bin/racket

; implement sum-odd-squares using accumulate

#lang racket

(require "accumulate.rkt"
         "enumerate-tree.rkt"
         "square.rkt")

(define (sum-odd-squares tree)
  (accumulate
    + 0 (map square (filter odd? (enumerate-tree tree)))))


; test 
(require rackunit)

; TODO: anyway to import this test from sum-odd-squares.rkt (or other file)?
; rather than duplicate?

(check-equal?
  (sum-odd-squares '((1 2) (3 4)))
  10)

