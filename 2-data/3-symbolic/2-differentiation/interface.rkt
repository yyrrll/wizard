#lang racket

;   From 2.3.2

(provide (all-defined-out))

    ; The variables are symbols. They are identified by the primitive predicate symbol?:
(define (variable? x) (symbol? x))

    ; Two variables are the same if the symbols representing them are eq?:
(define (same-variable? v1 v2)
   (and (variable? v1) (variable? v2) (eq? v1 v2)))

    ; =number?, which checks whether an expression is equal to a given number:
(define (=number? exp num)
  (and (number? exp) (= exp num)))


    ; represent / construct sums and products as lists: '(<operation> <arg1> <arg2>)

    ; if given two numbers, make-sum returns their sum
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

    ; if an argument is 0, make-product returns 0; if a 1, returns the other argument
(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))

    ; A sum is a list whose first element is the symbol +:
(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

    ; The addend is the second item of the sum list:
(define (addend s) (cadr s))
    ; The augend is the third item of the sum list:

(define (augend s) (caddr s))

    ; A product is a list whose first element is the symbol *:
(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

    ; The multiplier is the second item of the product list:
(define (multiplier p) (cadr p))

    ; The multiplicand is the third item of the product list:
(define (multiplicand p) (caddr p))
