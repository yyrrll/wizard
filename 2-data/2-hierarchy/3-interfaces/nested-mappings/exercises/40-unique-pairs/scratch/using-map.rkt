#lang racket

(require
  "../../../../library-02-02-03.rkt"
  "../../../prime-sum-pairs.rkt"
  rackunit)

(define (u-pairs-rev n)
    (accumulate
      append '() (map (lambda (i)
                        (map (lambda (j) (list j i))
                             (enumerate-interval 1 (- i 1))))
                      (enumerate-interval 1 n)))
    )

(check-equal?
    (u-pairs-rev 4)
    '((1 2) (1 3) (2 3) (1 4) (2 4) (3 4)))
    
