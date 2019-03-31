;   Usage:
;
;       racket all-tests.rkt | grep fail

;   Notes
;       works, but, runs test twice (because append-accumulate also calls
;       run-tests

;   TODO
;   - avoid duplicative test runs
;   - prevent << (#<test-success>) >> notices?
;   - get information on failure
;   - make test failures more prominent

#lang racket

(require
  "33-implement-via-accumulate/33-by-accumulate-test.rkt"

  "34-horner-polynomial/horner-rule.rkt"

  "35-count-leaves-by-accumulate/count-leaves-by-accumulate-community.rkt"
  "35-count-leaves-by-accumulate/count-leaves-by-accumulate.rkt"

  "36-accumulate-n_rows-to-columns/accumulate-n.rkt"
  "36-accumulate-n_rows-to-columns/my-solution.rkt"

  "37-matrix-operations/operations/test-operations.rkt"

  "38-fold_left-right.rkt"

  "39-reverse-by-folds/reverse-by-fold-left.rkt"
  "39-reverse-by-folds/reverse-by-fold-right.rkt"

  rackunit
  rackunit/text-ui
  )


;   Exercise 33
(run-tests append-accumulate-test)
(run-tests length-accumulate-test)
(run-tests map-accumulate-test)

;   Exercise 34
(run-tests horner-polynomial-test)

;   Exercise 35
(run-tests count-leaves-by-accumulate-test)
(run-tests count-leaves-by-accumulate-community-test)

;   Exercise 36
(run-tests accumulate-n-test)
(run-tests accumulate-n-my-solution-test)

;   Exercise 37
(run-tests matrix-*-vector-test)
(run-tests transpose-test)
(run-tests matrix-*-matrix-test)

;   Exercise 38
(run-tests fold-right-test)

;   Exercise 39
(run-tests reverse-fold-left-test)
(run-tests reverse-fold-right-test)
