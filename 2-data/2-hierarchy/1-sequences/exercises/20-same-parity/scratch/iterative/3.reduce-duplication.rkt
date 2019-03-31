#!/usr/local/bin/racket

;;  Use block scope rather than separate definition of same-iter

;; TODO: what is the proper formatting of this?

#lang racket

(provide same-parity)

(define (same-parity . items)
    (define (same-iter parity matched remaining)

        (define next 
            (if (null? remaining)
                remaining
                (car remaining)))

        (if (null? remaining)
            matched
            (let ((new-remaining (cdr remaining))
                        ;; cannot assign << (car remaining) >> to variable in <<
                        ;; let >> and use that variable in subsequent assignments
                        ;; within let 
                        
                        ;; cannot assign (car remaining to variable before let -- "define not allowed in expression context"

                  (new-matched
                    (if (= parity (modulo (car remaining) 2))
                        (append matched (list (car remaining)))
                        matched )))
                 (same-iter
                    parity
                    new-matched
                    new-remaining))))

    (same-iter
        (modulo (car items) 2)
        (list)
        items))

