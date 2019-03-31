;; use block scope for helper function


#lang racket

(provide same-parity)

(define (same-parity . items)
    (define (of-parity parity items)
      (if (null? items)
          '()
          (if (= parity (modulo (car items) 2))
              (cons (car items) (of-parity parity (cdr items)))
              (of-parity parity (cdr items)))))

    (let ((parity (modulo (car items) 2)))
        (of-parity parity items)))
