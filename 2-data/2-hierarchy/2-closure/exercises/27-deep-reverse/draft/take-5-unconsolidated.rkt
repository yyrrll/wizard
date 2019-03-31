; take-5 as initially written

#lang racket

(provide deep-reverse)

(require rackunit)

(define (append-debug x y)
    (append x y))

(define (deep-reverse items)
  (display items)
  (newline)
  (cond ((null? items) items)
        ((not (pair? items)) items)
        (else
         (append-debug
         ; (append
          (if (null? (cdr items))
              (list (deep-reverse (car items)))
              (deep-reverse (cdr items)))
          (if (null? (cdr items))
              '()
              (deep-reverse (car items)))))))

(define two-list (list 8 9))
(define x '(7 8 9))

(check-equal?
 (deep-reverse x)
 '(9 8 7))


; passes '(9 . 8) to append -- generated so:

(deep-reverse '(8 9))
; or, 
; (deep-reverse two-list)

; append _will_ take a primitive argument for its _second_ argument

(append '(9) 8)
; '(9 . 8)

; this errs:
; (append 4 '(9))
