#!/usr/local/bin/racket

#lang racket

(require
  "deriv.rkt"
  rackunit
  )

; add exponents / chain rule (?)

(check-equal?  (deriv '(** x 2) 'x) '(* 2 x))

; x^3 --> 3x^2
(check-equal?  (deriv '(** x 3) 'x) '(* 3 (** x 2)))

; (xy + x)^3 --> 3(xy)^2 * (y + 1)
; (x^2 * y)^3  --> 3 * (x^2 * y)^2 * 2xy
(check-equal?
  (deriv '(** (* (** x 2) y) 3) 'x)
  '(* 
     (* 3 (** (* (** x 2) y) 2))
     (* (* 2 x) y))
  )
