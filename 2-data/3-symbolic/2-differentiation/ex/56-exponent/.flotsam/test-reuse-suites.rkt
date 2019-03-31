#!/usr/local/bin/racket

;   Experiment in re-using test suites

;   Does not work as expected -- importing the deriv function from the same file as imported by the test case, not the file in the same directory as these tests

;   need some way of importing different definitions for the same function name and applying the tests to those

#lang racket

(require
  "deriv.rkt"
  "../../test-deriv.rkt"
  rackunit
  rackunit/text-ui
 )


(run-tests test-deriv)
