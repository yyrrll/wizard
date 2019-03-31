#lang racket

(provide deep-reverse)

(define (deep-reverse items)
    (if (null? (cdr items))
        (if (pair? (car items))
            (deep-reverse (car items))
            (car items))
        (if (pair? (car items))
            (deep-reverse (car items))
            (car items))))



