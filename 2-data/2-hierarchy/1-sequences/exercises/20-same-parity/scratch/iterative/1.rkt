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
        (let ((next (car remaining))
              (new-remaining (cdr remaining)))
             (if (= parity (modulo next 2))
                (same-iter
                    parity
                    (append matched (list next))
                    new-remaining)
                (same-iter
                    parity
                    matched 
                    new-remaining)))))
