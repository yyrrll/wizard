#lang racket

(provide get-complement-pair)

(require rackunit)


; --------------------
;   developing simpler

(define (get-complement-pair i whole)
  (if (< i (/ whole 2))
    (list i (- whole i))
    '()))


; --------------------
;   incumbent
; get list of i and complement; or nil
(define (get-complement-pair-inc i whole)
    (let
      ((comp (- whole i)))
      (if (> comp i)
        (list i comp)
        '())
      ))


; --------------------
;   tests

(check-equal?
  (get-complement-pair 1 8)
  '(1 7))

(check-equal?
  (get-complement-pair 2 8)
  '(2 6))

(check-equal?
  (get-complement-pair 5 8)
  '())

; --------------------
