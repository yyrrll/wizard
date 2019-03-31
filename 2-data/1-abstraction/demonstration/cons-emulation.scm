;;  SICP emulation of cons, car, cdr

(define (cons-em x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (error "Argument not 0 or 1 -- CONS" m))))
  dispatch)

(define (car-em z) (z 0))
(define (cdr-em z) (z 1))

;;  cons-em takes two values and returns a procedure << dispatch >>

;;  dispatch takes a flag value, 0 or 1

;;  the procedure << dispatch >> is local to the cons-em procedure call, and is bound to the particular value of x and y passed to that procedure call


