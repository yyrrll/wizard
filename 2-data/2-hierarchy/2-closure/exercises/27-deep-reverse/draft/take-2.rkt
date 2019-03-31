#!/usr/local/bin/racket

#lang racket

(provide deep-reverse)

(require rackunit)

(define (deep-reverse items)
;  (display items)
;  (newline)
  (define next
    (if (pair? (car items))
        (deep-reverse (car items))
        (list (car items))))
;  (display next)
;  (newline)
  (if (null? (cdr items))
      items
      (append (deep-reverse (cdr items))
              next)))


(check-equal?  
    (deep-reverse '('(1 2) '(3 4)))
    '((4 3) (2 1)))