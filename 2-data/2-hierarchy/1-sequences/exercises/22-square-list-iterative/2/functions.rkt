#lang racket

(require rackunit)


(define (square x)
    (* x x))

(check-equal? 16 (square 4))


(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items '()))

(provide
  square
  square-list)
