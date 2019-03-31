#!/usr/local/bin/racket

; TODO -- clea  this up

#lang racket

(require "../accumulate.rkt"
         rackunit)

; subtraction patterns
;   accumulated subtraction (of positive integers) can be thought of as
;   addition, beginning with an integer and the negative of the subtractand
;   (?).  For each postive integer placed in the accumulation, that integer is
;   added to the items to be added, with the sign opposite the item added before
;   it.

(check-equal?
  (accumulate - 0 '(13 8 5))
  (+ 13 -8 5 0))

    (check-equal?
      (accumulate - 0 '(13 8 5))
      10)
    
    (check-equal?
      (- 13 (- 8 (- 5 0)))
      10)
    
(check-equal?
  (accumulate - 0 '(13 8 5 3))
  (- 13 (- 8 (- 5 (- 3 0)))))

    (check-equal?
      (accumulate - 0 '(13 8 5 3))
      7)
    
    (check-equal?
      (- 13 (- 8 (- 5 (- 3 0))))
      7)
    
    (check-equal?
      (+ 13 -8 5 -3 0)
      (- 13 (- 8 (- 5 (- 3 0)))))
    
(check-equal?
  (accumulate - 0 '(13 8 5 3 2))
  (- 13 (- 8 (- 5 (- 3 (- 2 0))))))

    (check-equal?
      (accumulate - 0 '(13 8 5 3 2))
      9)
    
    (check-equal?
      (- 13 (- 8 (- 5 (- 3 (- 2 0)))))
      9)
    
    (check-equal?
      (- 13 (- 8 (- 5 (- 3 (- 2 0)))))
      (+ 13 -8 5 -3 2 0))
