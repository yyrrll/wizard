#!/usr/local/bin/racket

#lang racket

(provide (all-defined-out))

(require
  rackunit
  rackunit/text-ui
    "../../../../library-02-02-03.rkt"
    "../../../library-02-02-03-nested.rkt"
  )



; =====================================
;   get-complement-pairs

;   -------------------------------------
;   get list of "complement pairs" (my term)
;   - "pair" sums to target number << whole >>
;   - first < second, starting from n
;   - list is ordered by first items
;   - all terms greater than or equal to given (<< n >>)
;
;   TODO: tighten description

(define (get-complement-pairs n whole)
    (flatmap
      (lambda (i)
        (list (list i (- whole i))))
      (enumerate-interval n (/ (- whole 1) 2))
      )
    )

;   -------------------------------------
;   tests

(check-equal?
  (get-complement-pairs 1 8)
  '((1 7)
    (2 6)
    (3 5)))

(check-equal?
  (get-complement-pairs 1 9)
  '((1 8)
    (2 7)
    (3 6)
    (4 5)))

(check-equal?
  (get-complement-pairs 2 9)
  '(
    (2 7)
    (3 6)
    (4 5)))

;   TODO: figure out test-case re-use
;   - run these same tests against different function implementations, without
;     pasting the tests

;   -------------------------------------

;   re: (/ (- whole 1) 2))
;       "pairs" are ordered unique items
;       -- for 8, (3 5), but not (5 3), and not (4 4)
;       thus no need to check values greater than or equal half the whole
;       --  for 8, stop at 3; 9, at 4
;       when whole is even, (/ whole 2) places the half in the range, eg (4 4)
;       -- (- whole 1) handles this case, removing the even half from the range

;   Nota Bene:

;   - much effort getting the algorithm to return nothing but the expected "pairs"
;   - better to just generate all the pairs and then filter for conditions?
;   - see .jetsam/gcp-filtered.txt for implementation

; -------------------------------------

; =====================================
