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
             (same-iter
                parity
                new-remaining
                (if (= parity (modulo next 2))
                    (append matched (list next))
                    matched)))))


;; Errors

;;  getting return order wrong
;;  inserting items of wrong parity 
