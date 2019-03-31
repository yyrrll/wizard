#lang racket

(require
  "interface.rkt"
  (rename-in "../../57-args/deriv.rkt"
    (deriv ur-deriv)
    ))

(provide (all-defined-out))

(define (deriv expr var)
    (if (infix? expr)
        (to-infix (ur-deriv (from-infix expr) var))
        (ur-deriv expr var)))
