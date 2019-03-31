#lang racket

(provide same-parity)

(define (same-parity . items)
    (define (same-iter parity matched remaining)
      (if (null? remaining)
        matched
        (let
          ((new-remaining (cdr remaining))
           (new-matched
             (if (= parity (modulo (car remaining) 2))
               (append matched (list (car remaining)))
               matched)))
          (same-iter parity new-matched new-remaining))))
    (same-iter (modulo (car items) 2) (list) items))


;;  Changes from 2.block-scope.rkt
;;      Use block scope rather than separate definition of same-iter

;;  Improvements:
;;      would like to get rid of dual (car remaining) calls, but cannot assign
;;          to variable in let and re-use in let
;;      would like to get rid of parity argument -- should information be in
;;          (car matched)?
;;          - done in 2c, but not sure it really is an improvement
