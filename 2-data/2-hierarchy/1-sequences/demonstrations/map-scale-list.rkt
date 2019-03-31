#!/usr/local/bin/racket

#lang sicp

;; "Defining scale-list in terms of map suppresses that level of detail and
;; emphasizes that scaling transforms a list of elements to a list of results. The
;; difference between the two definitions is not that the computer is performing a
;; different process (it isn't) but that we think about the process differently."


(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (scale-list items factor)
  (map (lambda (x) (* x factor))
items))


(scale-list (list 1 2 3 4 5) 10)
;; (10 20 30 40 50)
