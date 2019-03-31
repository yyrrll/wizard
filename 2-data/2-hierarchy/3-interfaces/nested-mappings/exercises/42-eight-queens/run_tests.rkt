#!/usr/local/bin/racket

#lang racket

(require
  "tests/test_eight-queens.rkt"
  rackunit
  rackunit/text-ui
  )


(run-tests queens-test)
