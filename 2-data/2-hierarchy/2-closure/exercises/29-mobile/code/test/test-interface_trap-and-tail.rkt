#!/usr/local/bin/racket

; Test constructors

#lang racket

(require rackunit
         "../interface.rkt"
         "../trap-and-tail.rkt"
         )


;   Test Constructors

; test left side -- trap-branch

(check-equal?
 (car trap-and-tail)
 trap-branch)

(check-equal? trap-branch '(6 10))
(check-equal? trap-rod      6)
(check-equal? trap-weight  10)

(check-equal? (car trap-and-tail) trap-branch)
(check-equal? (car trap-and-tail) '(6 10))


;; right side -- tail-branch

(check-equal?
 (car (cdr trap-and-tail))
 tail-branch)

(check-equal?  tail-branch '(2 ((2 6) (1 4))))

(check-equal?  (car tail-branch) tail-rod)
(check-equal?  (car tail-branch) 2)
(check-equal?  tail-rod 2)

(check-equal?  (car (cdr tail-branch)) tail-mobile)
(check-equal?  tail-mobile '((2 6) (1 4)))


;; trap-and-tail -- top mobile

(check-equal? trap-and-tail (list trap-branch tail-branch))
(check-equal? trap-and-tail '((6 10) (2 ((2 6) (1 4)))))

(check-equal? (car trap-and-tail) trap-branch)
(check-equal? (car trap-and-tail) '(6 10))

(check-equal? (car (cdr trap-and-tail)) tail-branch)
(check-equal? (car (cdr trap-and-tail)) '(2 ((2 6) (1 4))))

; how does '(trap-branch tail-branch) differ from (list trap-branch
; tail-branch)?

; (check-equal? trap-and-tail '(trap-branch tail-branch) "shouldn't this
; work?")

; Test Selectors
    ; left-branch, right-branch

(check-equal? (left-branch trap-and-tail)  trap-branch)
(check-equal? (left-branch trap-and-tail)  '(6 10))

(check-equal? (right-branch trap-and-tail) tail-branch)
(check-equal? (right-branch trap-and-tail) '(2 ((2 6) (1 4))))

(check-equal? (left-branch  (left-branch trap-and-tail))  trap-rod)
(check-equal? (right-branch (left-branch trap-and-tail))  trap-weight)

(check-equal? (right-branch (right-branch trap-and-tail)) tail-mobile)

(define left-rod 15)
(define left-weight 20)

(define left-side (make-branch left-rod left-weight))

;; but, this should fail -- it is getting a branch of a branch, not a mobile
(check-equal? (left-branch left-side) left-rod)


;; branch-length, branch-structure

(check-equal? (branch-length left-side) left-rod)
(check-equal? (branch-length left-side) 15)

(check-equal? (branch-structure left-side) left-weight)
(check-equal? (branch-structure left-side) 20)

(check-equal? (branch-length tail-branch) tail-rod)
(check-equal? (branch-length tail-branch) 2)

(check-equal? (branch-structure tail-branch) tail-mobile)
(check-equal? (branch-structure tail-branch) '((2 6) (1 4)))

(check-equal? (branch-length (left-branch trap-and-tail)) trap-rod)
