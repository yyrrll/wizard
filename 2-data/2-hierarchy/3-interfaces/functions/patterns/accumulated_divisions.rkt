#!/usr/local/bin/racket

; TODO -- clean this up

#lang racket
(require "../accumulate.rkt"
         rackunit)

; interesting progression
  ; adding the next integer to the progression of divisions looks like this:
    ; (/ 1 (/ 2 (/ 3 (/ 4 (/ 5 (/ 6 7))
  ; for any given number, the result ends up being the multiplication of all
  ; the odd terms divided by the multiplicaton of all the even terms up to and
  ; including that given number

(check-equal?
  (accumulate / 1 (list 1))
  1)

(check-equal?
  (accumulate / 1 (list 1 2))
  (/ 1 2))

(check-equal?
  (accumulate / 1 (list 1 2 3))
  (/ (* 1 3) 2))

    (check-equal?
      (accumulate / 1 (list 1 2 3))
      (/ 3 2))
    
(check-equal?
  (accumulate / 1 (list 1 2 3 4))
  (/ (* 1 3) (* 2 4)))

    (check-equal?
      (accumulate / 1 (list 1 2 3 4))
      (/ 3 8))
    
(check-equal?
  (accumulate / 1 (list 1 2 3 4 5))
  (/ (* 1 3 5) (* 2 4)))

    (check-equal?
      (accumulate / 1 (list 1 2 3 4 5))
      (/ 15 8))
    
(check-equal?
  (accumulate / 1 (list 1 2 3 4 5 6))
  (/ (* 1 3 5) (* 2 4 6)))

    (check-equal?
      (accumulate / 1 (list 1 2 3 4 5 6))
      (/ 15 48))
    
        (check-equal?
          (/ 15 48)
          (/ 5 16))
        
(check-equal?
  (accumulate / 1 (list 1 2 3 4 5 6 7))
  (/ (* 1 3 5 7) (* 2 4 6)))

    (check-equal?
      (accumulate / 1 (list 1 2 3 4 5 6 7))
      (/ 105 48))

        (check-equal?
          (/ 105 48)
          (/ 35 16))
    
(check-equal?
  (accumulate / 1 (list 1 2 3 4 5 6 7 8))
  (/ (* 3 5 7) (* 2 4 6 8)))
