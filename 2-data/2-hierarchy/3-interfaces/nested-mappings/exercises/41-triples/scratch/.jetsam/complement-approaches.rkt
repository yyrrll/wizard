#!/usr/local/bin/racket

#lang racket

(require
  rackunit
  rackunit/text-ui
    "../../../../library-02-02-03.rkt"
    "../../../library-02-02-03-nested.rkt"
  )


(require
  "get-complement-pair.rkt"
  )



; -------------------
;   developing
;   -   remove get-complement-pair indirection


(define (get-complement-pairs n whole)
    (flatmap
      (lambda (i)
        (list (list i (- whole i))))
      (enumerate-interval 1 (/ (- whole 1) 2))
    ))


; -------------------
;   incumbent
;   -   removes filter


(define (get-complement-pairs-inc-2 n whole)
    (flatmap
      (lambda (i)
        (list (get-complement-pair i whole)))
      (enumerate-interval 1 (/ (- whole 1) 2))
    ))

; -------------------
;   incumbent

;   doing this wrong -- should not need filter to clean up these pairs ?

(define (get-complement-pairs-inc n whole)
  (filter
    ; predicate -- 
    (lambda (x) (not (null? x)))
    ; sequence --
    (flatmap
      (lambda (i)
        (list (get-complement-pair i whole)))
      (enumerate-interval 1 whole))     ; (/ whole 2) would avoid always nil cases
    ))


; avoid filter by checking i against whole / 2 before calling get-complement-pair?



; -------------------
;   test

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
