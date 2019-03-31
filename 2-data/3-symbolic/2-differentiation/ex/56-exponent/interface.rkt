#lang racket

(require "../../interface.rkt")

(provide 
    (all-defined-out)
    (all-from-out "../../interface.rkt")
)

    ; make-exponent list of symbols, unless arguments are numbers
    ;   exponent 0 --> 1; exponent 1 --> base, 
(define (make-exponent base exponent)
  (cond
    ((=number? exponent 0) 1)
    ((=number? exponent 1) base)
    ((and (number? base) (number? exponent)) (expt base exponent))
    (else (list '** base exponent))))

    ; base is second item of exponent expression list:
(define (base s) (cadr s))

    ; The exponent is the third item of the sum list:
(define (exponent s) (caddr s))

    ; An exponentiation is a list whose first element is the symbol **:
(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))

