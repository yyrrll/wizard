;; use block scope for helper function


#lang racket

(provide same-parity)

(define (same-parity . items)
    (define (of-parity parity remaining)
      (if (null? remaining)
          '()
          (if (= parity (modulo (car remaining) 2))
              (cons (car remaining) (of-parity parity (cdr remaining)))
              (of-parity parity (cdr remaining)))))

    (of-parity (modulo (car items) 2) items))
