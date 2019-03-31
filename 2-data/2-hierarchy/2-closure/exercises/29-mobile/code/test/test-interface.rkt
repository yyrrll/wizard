#!/usr/local/bin/racket

#lang racket

(require rackunit
         "../interface.rkt")


(check-equal?
  (make-branch 6 10)
  '(6 10))


(define simple_branch
  (make-branch 6 10))

(check-equal? simple_branch '(6 10))
(check-equal? (branch-length simple_branch) 6)
(check-equal? (branch-structure simple_branch) 10)


(check-equal?
  (make-mobile
    (make-branch 2 6)
    (make-branch 1 4))
  '((2 6) (1 4)) )

(define simple_mobile
  (make-mobile
    (make-branch 2 6)
    (make-branch 1 4)) )

(check-equal? simple_mobile '((2 6) (1 4)) )
(check-equal? (left-branch simple_mobile) '(2 6) )
(check-equal? (right-branch simple_mobile) '(1 4) )


(define complex_branch
  (make-branch 2 (make-mobile
                     (make-branch 2 6)
                     (make-branch 1 4))))

(check-equal? complex_branch '(2 ((2 6) (1 4))) )
(check-equal? (branch-length complex_branch) 2 )
(check-equal? (branch-structure complex_branch) '((2 6) (1 4)) )


(define mobile_example
  (make-mobile
   (make-branch 6 10)
   (make-branch 2 (make-mobile
                   (make-branch 2 6)
                   (make-branch 1 4)))) )

(check-equal? mobile_example '((6 10) (2 ((2 6) (1 4)))) )

(check-equal? (left-branch mobile_example) '(6 10) )
(check-equal? (right-branch mobile_example) '(2 ((2 6) (1 4))) )
