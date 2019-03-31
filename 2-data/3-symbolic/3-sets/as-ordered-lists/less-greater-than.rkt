#!/usr/local/bin/racket

#lang racket

(require rackunit)

    ; "ordered" means ascending ordered

; return items in ordered list less than x
(define (less-than x ordered)
    (cond ((or (null? ordered)
               (<= x (car ordered)))
             '())
          (else (cons (car ordered) (less-than x (cdr ordered))))))

(define example '(1 2 3 5 8 13 21))

(check-equal? (less-than  0 '()) '())
(check-equal? (less-than  1 '()) '())
(check-equal? (less-than  0 example) '())
(check-equal? (less-than 22 example) '(1 2 3 5 8 13 21))
(check-equal? (less-than  7 example) '(1 2 3 5))
(check-equal? (less-than  8 example) '(1 2 3 5))
(check-equal? (less-than  9 example) '(1 2 3 5 8))


; return items in ordered list greater than x
(define (greater-than x ordered)
    (cond ((null? ordered    ) '())
          ((< x (car ordered)) ordered)
          (else  (greater-than x (cdr ordered)))))

(check-equal? (greater-than  0 '()) '()) 
(check-equal? (greater-than  1 '()) '())
(check-equal? (greater-than  0 example) '(1 2 3 5 8 13 21))
(check-equal? (greater-than 22 example) '())
(check-equal? (greater-than  1 example) '(2 3 5 8 13 21))
(check-equal? (greater-than  7 example) '(8 13 21))
(check-equal? (greater-than  8 example) '(13 21))
(check-equal? (greater-than  9 example) '(13 21))


; implement adjoin-set with lesser-than, greater-than
;   cleaner version in adjoin-set.rkt
(define (adjoin-set x set)
    (append (less-than x set)
            (list x)
            (greater-than x set)))

(check-equal?  (adjoin-set 5 '()) '(5))
(check-equal?  (adjoin-set 5 '(5 8 13 21)) '(5 8 13 21))
(check-equal?  (adjoin-set 6 '(5 8 13 21)) '(5 6 8 13 21))
(check-equal?  (adjoin-set 13 '(5 8 13 21)) '(5 8 13 21))
(check-equal?  (adjoin-set 34 '(5 8 13 21)) '(5 8 13 21 34))

(check-equal? (adjoin-set  0 '()) '(0))
(check-equal? (adjoin-set  1 '()) '(1))

(check-equal? (adjoin-set  1 example) '(  1 2 3 5   8   13 21    ))
(check-equal? (adjoin-set  0 example) '(0 1 2 3 5   8   13 21    ))
(check-equal? (adjoin-set 22 example) '(  1 2 3 5   8   13 21 22 ))
(check-equal? (adjoin-set  7 example) '(  1 2 3 5 7 8   13 21    ))
(check-equal? (adjoin-set  8 example) '(  1 2 3 5   8   13 21    ))
(check-equal? (adjoin-set  9 example) '(  1 2 3 5   8 9 13 21    ))
