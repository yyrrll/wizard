#!/usr/local/bin/racket

#lang racket

(provide same-parity)


(define (same-parity . items)
    (same-iter
        (modulo (car items) 2)
        (list)
        items))

(define (same-iter parity matched remaining)
    (if (null? remaining)
        matched
        (if (= parity (modulo (car remaining) 2))
            (same-iter
                parity
                (append matched (list (car remaining)))
                (cdr remaining))
            (same-iter
                parity
                matched 
                (cdr remaining)))))
