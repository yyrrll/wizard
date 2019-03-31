#!/usr/local/bin/racket

#lang racket

(provide deep-reverse)

(require rackunit)

(define (deep-reverse items)
  (cond ((null? items) items)
;;        ((not (pair? items)) (list items))
        ((not (pair? items)) items)
        (else
         (if (null? (cdr items))
             (list (deep-reverse (car items)))
             (append (deep-reverse (cdr items))
                     (deep-reverse (car items)))))))
