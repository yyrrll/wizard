#!/usr/local/bin/racket

#lang racket

(require
  "transpose.rkt"
  "matrix-times-vector.rkt"
  )

; template given

; (define (matrix-*-matrix m n)
;   (let ((cols (transpose n)))
;     (map <??> m)))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row)(matrix-*-vector cols row)) m)))

(provide matrix-*-matrix)


; test 

(require rackunit)

(check-equal?
  (matrix-*-matrix
    '((  0  4 -2 )
      ( -4 -3 -0 ))
    '((  0  1 )
      (  1 -1 )
      (  2  3 )))
  '((  0 -10 )
    ( -3  -1 )))
