#lang racket

(require
  rackunit
  rackunit/text-ui

  "40-unique-pairs/prime-sum-pairs-40.rkt"

  "41-triples/ordered-triples.rkt"

  )


(run-tests prime-sum-pairs-40_test)


(run-tests ordered-triples_test)
