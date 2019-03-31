#!/usr/local/bin/racket

#lang racket

(require
  "position.rkt"
  "diagonal.rkt"
  )

(provide (all-defined-out))

(define (adjoin-position new-row k rest-of-queens)
  (add-position rest-of-queens (make-position k new-row)))

(define (can-attack? position-1 position-2)
  (or
    (same-column?    position-1 position-2)
    (same-row?       position-1 position-2)
    (share-diagonal? position-1 position-2)))

(define (safe? k position-set)
  (let ((latest (latest-position position-set))
        (prior  (prior-positions  position-set)))
    (null?  (filter (lambda (pos) (can-attack? latest pos))
                    prior))))
