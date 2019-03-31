#lang racket

; recursion is within function -- of-parity calls itself

(provide same-parity)

(define (same-parity . items)
  (define parity (modulo (car items) 2))
  (define (of-parity remaining)
    (if (null? remaining)
        '()
        (let
          ((next (car remaining))
           (next-remaining (cdr remaining)))
          (if (= parity (modulo next 2))
            (cons next (of-parity next-remaining))
            (of-parity next-remaining)))))
  (of-parity items))


;; Changes from 1c.remove-duplication.rkt;

;;  Use block scope for value of parity to be matched
