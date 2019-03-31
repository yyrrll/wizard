; problem #1
; (define (matrix-*-vector m v)
;   (map <??> m))

#lang racket

(require "dot-product.rkt")

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row v)) m))

; test
;   duplicative of test-operations.rkt

(require rackunit)

(define matrix-2-3
  '(( 1 -1  2)
    ( 0  3  1)))

(define vector-3
  '(2 1 0))

(check-equal?
  (matrix-*-vector matrix-2-3 vector-3)
  '(1 3))

(provide matrix-*-vector)
