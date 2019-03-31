#!/usr/local/bin/racket

#lang racket

(require
  rackunit
  rackunit/text-ui
  "test_solution.rkt"
  "../chess-rules/tests/test_functions.rkt"
  "../chess-rules/tests/test_position.rkt"
  "../chess-rules/tests/test_diagonal.rkt"
)

(run-tests position-set-interface)
(run-tests adjoin-position_test)
(run-tests queens-test)
(run-tests diagonal-interface)
(run-tests diagonal-predicates)
(run-tests can-attack-predicate)
(run-tests position-interface)
(run-tests position-predicates)
