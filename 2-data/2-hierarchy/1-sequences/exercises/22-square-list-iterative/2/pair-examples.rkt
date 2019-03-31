#lang racket

(require
  ; "2.rkt"
  "functions.rkt"
  rackunit)

; square-list return looks so:

(define shorter (list 1 2))
(define rv (square-list shorter))
(check-equal? rv '((() . 1) . 4))

;;      this is a pair of a pair and an item
;;      - we cannot "cdr down" this object, because the first cdr returns an item -- not a pair
;;      - the first car returns a pair, not an item
;;      - the implementation might be fixed by reversing the items in the cons call

; cons example
(check-equal? (cons 1 4) '(1 . 4))

; emulation of square-list return
(define pair-example (cons (cons '() 1) 4))

(check-equal?
  pair-example
 '((() . 1) . 4))

(check-equal?
  (pair? pair-example)
  #t)

;; data structure is a pair, dot represents divider between items (yes? verify in text TODO)

; examples of pairs and notation representation of same
(check-equal?
  (cons '() 1)
  '((). 1))

(check-equal?
  (cons (cons '() 1) 4)
 '((() . 1) . 4))
