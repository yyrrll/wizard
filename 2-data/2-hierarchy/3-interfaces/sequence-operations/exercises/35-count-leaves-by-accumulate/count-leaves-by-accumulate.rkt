#!/usr/local/bin/racket

; Exercise 2.35.
; 
; Redefine count-leaves from section 2.2.2 as an accumulation:
; 
; (define (count-leaves t)
;   (accumulate <??> <??> (map <??> <??>)))


#lang racket

(require 
         "../functions-local.rkt"
         ; "../../functions/accumulate.rkt"

         ; TODO: move these to functions-local
         "../../examples/enumerate-tree.rkt"
         "../../../../02-hierarchical-data-closure/count-leaves.rkt"
         )

(define (count-leaves-solution t)
  (accumulate
    (lambda (x y) (+ 1 y))
    0
    (map (lambda (x) x) (enumerate-tree t))))


;   test / demonstrate

(require rackunit)

(define tree-1 '((1 2) (3 4)))

(define-test-suite count-leaves-by-accumulate-test
    (test-case
      "checkout count-leaves by accumulate solution"
      
      (check-equal? (count-leaves-solution tree-1) 4)
      (check-equal? (count-leaves-solution tree-1) (count-leaves tree-1))))

(run-test count-leaves-by-accumulate-test)

(provide
  count-leaves-by-accumulate-test
  )
