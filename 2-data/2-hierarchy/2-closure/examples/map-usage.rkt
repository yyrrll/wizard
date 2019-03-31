#!/usr/local/bin/racket

#lang racket

(require rackunit
         "../../map.rkt")

;; Initial -- scales all numbers in list by a factor

(define (scale-list-0 items factor)
  (if (null? items)
      '()       ;; nil
      (cons (* (car items) factor)
            (scale-list-0 (cdr items) 
                        factor))))

(check-equal?
    (scale-list-0 (list 1 2 3 4 5) 10)
    (list 10 20 30 40 50))


; test / demonstrate map

(check-equal?
    (map abs (list -10 2.5 -11.6 17))
    (list 10 2.5 11.6 17))

(check-equal?
    (map (lambda (x) (* x x)) (list 1 2 3 4))
    (list 1 4 9 16))


; redefine scale-list in terms of map

(define (scale-list items factor)
  (map (lambda (x) (* x factor))
       items))

(check-equal?
    (scale-list (list 1 2 3 4 5) 10)
    (list 10 20 30 40 50))
