#lang racket

(provide same-parity)

(define (same-parity . items)
    (define (same-iter matched remaining)

        (if (null? remaining)
            matched
            (let ((new-remaining (cdr remaining))
                  (new-matched
                        (if (= (modulo (car matched) 2) (modulo (car remaining) 2))
                            (append matched (list (car remaining)))
                            matched)))
                    (same-iter
                        new-matched
                        new-remaining))))

    (same-iter
        (list (car items))
        (cdr items)))


;; Changes from 2b.block-scope.rkt:

;;      removes << parity >> argument from same-iter
;;          -- not sure this is actually an improvement

;;  todo

;;      would like to get rid of dual (car remaining) calls, but cannot assign to variable in let and re-use in let
;;      use cons, per recursive solution?
;;      set value of parity to match in variable, refer to same in block scope?
