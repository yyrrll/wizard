#lang racket


(require "append-accumulate.rkt"
         "length-accumulate.rkt"
         "map-accumulate.rkt"
         rackunit)

(run-test append-accumulate-test)
(run-test length-accumulate-test)
(run-test map-accumulate-test)

(provide
    append-accumulate-test
    length-accumulate-test
    map-accumulate-test
    )

; works, but, runs test twice (because append-accumulate also calls run-test

;   TODO
;   - avoid duplicative test runs
;   - get information on failure
;   - prevent << (#<test-success>) >> notices?
