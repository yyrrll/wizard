#lang racket

; TODO -- figure out library structure
;       prime-sum-pairsd cannot be required into top-level library because imports from that library
;       solution is to import from chapter 1 library?

(require
  ; "get-interval-pairs.rkt"
  "prime-sum-pairs.rkt"
  )

(provide
  (all-defined-out)
  flatmap
  )
