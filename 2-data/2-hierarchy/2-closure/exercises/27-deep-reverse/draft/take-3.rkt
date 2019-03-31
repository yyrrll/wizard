#!/usr/local/bin/racket

#lang racket

(provide deep-reverse)

(require rackunit)

(define (deep-reverse items)
  (if (null? (cdr items))
      items
      (append (deep-reverse (cdr items))
              (if (pair? (car items))
                  (deep-reverse (car items))
                  (car items)))))

(check-equal?  
    (deep-reverse '((1 2) (3 4)))
    '((4 3) (2 1)))