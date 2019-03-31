#!/usr/local/bin/racket

;; Exercise 2.21
;; 
;; The procedure square-list takes a list of numbers as argument and returns a
;; list of the squares of those numbers.
;; 
;; (square-list (list 1 2 3 4))
;; (1 4 9 16)
;; 
;; Here are two different definitions of square-list. Complete both of them by
;; filling in the missing expressions:
;; 
;; 
;; (define (square-list items)
;;   (if (null? items)
;;      nil
;;      (cons <??> <??>)))
;; 
;; (define (square-list items)
;;  (map <??> <??>))


#lang racket

(require rackunit)

;; First

(define (square-list_1 items)
  (if (null? items)
    '()         ;; nil
    (cons (* (car items) (car items))
          (square-list_1 (cdr items)))))

(check-equal?
    (square-list_1 (list 1 2 3 4))
    (list 1 4 9 16))

;; Second

(define (square-list_2 items)
    (map (lambda (x) (* x x)) items))

(check-equal?
    (square-list_2 (list 1 2 3 4))
    (list 1 4 9 16))
