; Section, 2.2.3
;   Exercise 33 -- accumulate
        ; complete template to implement << append >> using accumulate

; (define (append seq1 seq2)
;   (accumulate cons <??> <??>))

#lang racket

(require
  "../functions-local.rkt"
  )



(define (append-accumulate list1 list2)
  (accumulate cons      ; op
              list2     ; initial
              list1)    ; sequence
  )

; test
(require rackunit)

(define-test-suite append-accumulate-test
    (test-case
      "append-accumulate-test"
      (check-equal?
        (append-accumulate '(1 2) '(3 4))
        '(1 2 3 4))
      
      (check-equal?
        (append-accumulate '(3 4) '(1 2))
        '(3 4 1 2))))

(run-test append-accumulate-test)

; runs tests in suite, but, on failure, does not report particular failure

(provide append-accumulate-test)
