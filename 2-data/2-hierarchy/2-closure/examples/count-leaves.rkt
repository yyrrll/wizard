#!/usr/local/bin/racket

#lang racket

(require rackunit)

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))


(provide count-leaves)


(define x (cons (list 1 2) (list 3 4)))


(check-equal? 3 (length x))

(check-equal? 4 (count-leaves x))

(check-equal? 
    (list (list (list 1 2) 3 4) (list (list 1 2) 3 4))
    (list x x))

(check-equal? 2 (length (list x x)))

(check-equal? 8 (count-leaves (list x x)))


; nb -- case that requires two base cases
;   recursion terminates at with argument is either null? or (not pair?)
