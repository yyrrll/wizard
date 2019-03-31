;;  Section 2.1.1

;;  Implementation of rational numbers

;;      Extend implementation to used greatest common denominator in creation of rational number

#lang racket

(require "../rational-interface.rkt"
         "../../../../../library.rkt"
         )

(define (make-rat n d)
  (let
    ((g (gcd n d)))
    (cons (/ n g) 
          (/ d g))))

(provide 
    make-rat
    numer
    denom
    )

