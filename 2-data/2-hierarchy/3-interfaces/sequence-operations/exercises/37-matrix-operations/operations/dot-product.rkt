; dot-product given by exercise

#lang racket

(require
  "../../functions-local.rkt"
  )

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(provide dot-product)
