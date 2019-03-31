;; remove duplication


#lang racket

(provide same-parity)

(define (same-parity . items)
    (define (of-parity parity remaining)
        (if (null? remaining)
            '()
            (let ((next (car remaining))
                  (next-remaining (cdr remaining)))
    
                  (if (= parity (modulo next 2))
                      (cons next (of-parity parity next-remaining))
                      (of-parity parity next-remaining)))))

    (of-parity (modulo (car items) 2) items))
