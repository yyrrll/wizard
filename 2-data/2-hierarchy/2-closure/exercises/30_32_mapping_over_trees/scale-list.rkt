#!/usr/local/bin/racket

#lang sicp

(define (scale-list items factor)
  (if (null? items)
      nil

      (cons (* (car items) factor)
            (scale-list (cdr items) factor))))

(scale-list (list 1 2 3 4 5) 10)
;; (10 20 30 40 50)
