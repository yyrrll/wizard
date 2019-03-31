#lang racket

(require
  ; no-op "nested-mappings/library-02-02-03-nested.rkt"

  "sequence-operations/examples/enumerate-interval.rkt"
  "functions/accumulate.rkt"
  )


(provide
  accumulate

  enumerate-interval

  flatmap

  ;     does not work:
  ; (all-defined-out)
  )


(define nil '())

; map and accumulate with append
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
