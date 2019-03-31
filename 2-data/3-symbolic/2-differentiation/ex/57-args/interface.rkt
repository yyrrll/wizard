#lang racket

(require "../56-exponent/interface.rkt")

(provide 
    (all-defined-out)
    (all-from-out "../56-exponent/interface.rkt")
)


;   redefine augend, multiplicand to support arbitrary arguments to make-sum and make-product

(define (augend s)
    (let ((remainder (cddr s)))
        (if (= 1 (length remainder))
            (car remainder)
            (append '(+) remainder))))
                ;   or: (cons '+ remainder))))
        
(define (multiplicand s)
    (let ((remainder (cddr s)))
        (if (= 1 (length remainder))
            (car remainder)
            (append '(*) remainder))))
                ;   or: (cons '* remainder))))
