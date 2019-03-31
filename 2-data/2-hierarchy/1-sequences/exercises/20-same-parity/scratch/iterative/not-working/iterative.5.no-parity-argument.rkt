#!/usr/local/bin/racket

;;  Use block scope rather than separate definition of same-iter

;; TODO: what is the proper formatting of this?

#lang racket

(provide same-parity)

(define (same-parity . items)
    (define (same-iter matched remaining)

        (define next 
            (if (null? remaining)
                remaining
                (car remaining)))

        (if (null? next)
            matched
            (let ((new-remaining (cdr remaining))
                  (new-matched
                    (if (= (car matched) (modulo next 2))
                        (append matched (list next))
                        matched)))
                 (same-iter
                    new-matched
                    new-remaining))))

    (same-iter
        (list (car items))
        (cdr items)))


;; failing in one case
