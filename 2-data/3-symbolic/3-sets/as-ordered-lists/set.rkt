#!/usr/local/bin/racket

#lang racket

(require rackunit)


(define (element-of-set? x set)
    (cond ((null? set) false)
          ((= x (car set)) true)
          ((< x (car set)) false)
          (else (element-of-set? x (cdr set)))))

(check-true (element-of-set? 1 '(1 2 3)))
(check-false (element-of-set? 4 '(1 2 3)))


; pasted from adjoin-set
(define (adjoin-set x ordered)
    (cond 
          ((null? ordered)     (list x))
          ((< x (car ordered)) (cons x ordered))
          ((= x (car ordered)) ordered)
          ((> x (car ordered))      ; greater-than more explicit than << else >>
            (cons (car ordered) (adjoin-set x (cdr ordered))))))

(check-equal? (adjoin-set 1 '(2 3)) '(1 2 3))
(check-equal? (adjoin-set 1 '(1 2 3)) '(1 2 3))


(define (intersection-set set1 set2)
    (if (or (null? set1) (null? set2))
        '()
        (let ((x1 (car set1)) (x2 (car set2)))
          (cond ((= x1 x2)
                     (cons x1
                           (intersection-set (cdr set1)
                                             (cdr set2))))
                ((< x1 x2)
                 (intersection-set (cdr set1) set2))
                ((< x2 x1)
                 (intersection-set set1 (cdr set2)))))))

(check-equal?  (intersection-set '(1 2 3) '(4 5 6)) '())
(check-equal?  (intersection-set '(1 2 3) '(1 4 5)) '(1))
(check-equal?  (intersection-set '(1 2 3) '(1 2 4)) '(1 2))
(check-equal?  (intersection-set '(1 2 3) '()     ) '())
(check-equal?  (intersection-set '()      '(4 5 6)) '())

    ; Solution -- Exercise 2.62
(define (union-set set1 set2)
    (cond ((and (null? set1) (null? set2)) '())
          ((null? set1) set2)
          ((null? set2) set1)
          ((= (car set1) (car set2))
            (cons (car set1) (union-set (cdr set1) (cdr set2))))
          ((< (car set1) (car set2))
            (cons (car set1) (union-set (cdr set1) set2)))
          ((> (car set1) (car set2))
            (cons (car set2) (union-set set1 (cdr set2))))))



(check-equal? (union-set '(1) '(2)) '(1 2))
(check-equal? (union-set '() '(1 2 3)) '(1 2 3))
(check-equal? (union-set '(1 2 3) '()) '(1 2 3))
(check-equal? (union-set '(4 5 6) '(1 2 3)) '(1 2 3 4 5 6))
(check-equal? (union-set '(4 5 6) '(4 5 6)) '(4 5 6))
(check-equal? (union-set '(1 3 5) '(2 4 6)) '(1 2 3 4 5 6))
