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
         "../../../../02-hierarchical-data-closure/count-leaves.rkt"
            ; TODO -- move above to functions-local
         )

(define (count-leaves-community t)
  (accumulate + 0 (map (lambda (node)
                         (if (pair? node)
                             (count-leaves-community node)
                             1))
                       t)))


;   test / demonstrate

(require rackunit)

(define tree-1 '((1 2) (3 4)))

(define-test-suite count-leaves-by-accumulate-community-test
    (test-case
      "checkout count-leaves by accumulate solution"
      
      (check-equal? (count-leaves-community tree-1) 4)
      (check-equal? (count-leaves-community tree-1) (count-leaves tree-1))))

(run-test count-leaves-by-accumulate-community-test)


(provide
  count-leaves-by-accumulate-community-test
  )

; TODO check online solutions
;   solutions without enumerate-tree available at http://community.schemewiki.org/?sicp-ex-2.35


;-;   test re-use effort -- abortive, failing
;-(require "count-leaves-by-accumulate.rkt")
;-(define (count-leaves-recursive t)
;-  0)
;-(require rackunit)
;-(check-true #f "tests pass -- false-positive, should fail but do not")
;-(run-test count-leaves-by-accumulate-test)
; (define count-leaves-solution count-leaves-recursive)
;-(provide count-leaves-solution)

; FAILS -- test should fail on this code
;   TODO -- how to re-use tests for different implementations of the same function?
