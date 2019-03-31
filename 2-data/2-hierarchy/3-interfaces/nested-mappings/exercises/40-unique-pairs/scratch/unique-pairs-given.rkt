#lang racket

; get list of "pairs" (lists of 2) of first and all integers greater than first and less than n

(require
  "../../../library-02-02-03.rkt"
  rackunit
  )

(define (unique-pairs-given n first)
  (map
   (lambda (x)
     (list first x))
   (enumerate-interval (+ first 1) (- n 1))))

(check-equal?
 (unique-pairs-given 4 1)
 '((1 2) (1 3)))


(provide
  (all-defined-out)     ; works here  . . . 
  )
