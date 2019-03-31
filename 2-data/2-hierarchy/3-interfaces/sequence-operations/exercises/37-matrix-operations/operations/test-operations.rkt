#!/usr/local/bin/racket

#lang racket

(require 
         "operations.rkt"
         "../../columns-rows.rkt"
         rackunit
         )


;   test objects

(define matrix-2-3
  '(( 1 -1  2)
    ( 0  3  1)))

(define vector-3
  '(2 1 0))

; should vector-3 be '((2) (1) (0)) ?

; output of matrix-2-3 times vector-3:
(define matrix-2-3_*_vector-3
  '(1 3))

; should that be '((1) (3)) ?


(define A
  '(( 0  4 -2)
    (-4 -3  0)))

(define B
  '(( 0  1)
    ( 1 -1)
    ( 2  3)))


(define A*B
  '(( 0 -10)
    (-3  -1)))


(define dot-a
  '(1 2 3))

(define dot-b
  '(4 -5 6))


(provide
  dot-b
  dot-a
  A*B
  B
  A
  matrix-2-3_*_vector-3
  vector-3
  matrix-2-3
  )

; test dot product

(check-equal?
  (dot-product dot-a dot-b)
  12)

(check-equal?
  (dot-product '(1 2 3) '(4 -5 6))
  '12)

(check-equal?
  (dot-product '(1 2 3) '(4 5 6))
  '32)

(check-equal?
  (dot-product '(1 1) '(2 2))
  4)

(check-equal?
  (dot-product '(1 1) '(-1 -1))
  -2)

(check-equal?
  (dot-product '(1 1) '(3 3))
  6)


; test matrix vector multiplication

(define-test-suite matrix-*-vector-test
  (test-case
    "test matrix vector multiplication"
    (check-equal?
      (matrix-*-vector matrix-2-3 vector-3)
      '(1 3))))

(run-test matrix-*-vector-test)

; test transpose

(define-test-suite transpose-test
    (test-case
      "test matrix transpose"
      (check-equal?
        (transpose rows)
        columns)
      
      (check-equal?
       (transpose
        '((1) (2)))
       '((1 2)))
      
      (check-equal?
       (transpose
        '(( 1 2 3 )
          ( 4 5 6 )
          ))
       '((1 4)
         (2 5)
         (3 6)))
      
      (check-equal?
        (transpose
          '((  1  2  3 )
            (  4  5  6 )
            (  7  8  9 )
            ( 10 11 12 )))
        '((1 4 7 10)
          (2 5 8 11)
          (3 6 9 12)))))

(run-test transpose-test)


; test matrix-time-matrix / matrix-*-matrix

(define-test-suite matrix-*-matrix-test
    (test-case
      "test matrix matrix multiplication"
      (check-equal?
        (matrix-*-matrix
          '((  0  4 -2 )
            ( -4 -3 -0 ))
          '((  0  1 )
            (  1 -1 )
            (  2  3 )))
        '((  0 -10 )
          ( -3  -1 )))))

(run-test matrix-*-matrix-test)

(provide
    matrix-*-vector-test
    transpose-test
    matrix-*-matrix-test
    )
