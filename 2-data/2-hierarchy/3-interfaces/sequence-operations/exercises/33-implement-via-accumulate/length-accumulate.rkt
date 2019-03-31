; Section, 2.2.3
;   Exercise 33 -- length
        ; complete template to implement << length >> using accumulate

; (define (length sequence)
;   (accumulate <??> 0 sequence))

#lang racket

(require "../functions-local.rkt")

(define (length-accumulate sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

; test

(require rackunit)

(define example-list (list 1 3 5 7 9))

(define-test-suite length-accumulate-test
    (check-equal?
      (length example-list)
      (length-accumulate example-list)))

(run-test length-accumulate-test)

(provide example-list
         length-accumulate-test
         )
