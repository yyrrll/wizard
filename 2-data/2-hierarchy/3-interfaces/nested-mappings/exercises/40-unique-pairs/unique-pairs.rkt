#lang racket 

(require
   "../../../library-02-02-03.rkt"
  "../../prime-sum-pairs.rkt"
  rackunit)


; return pairs of numbers smaller than i, each internally ordered
(define (unique-pairs i)
  (map (lambda (j) (list j i))
       (enumerate-interval 1 (- i 1))))

(check-equal?
 (unique-pairs 4)
 '((1 4) (2 4) (3 4)))


; add unique-pairs abstraction to flatmap check
;   satisfies ex 40
(check-equal?
 (flatmap
  unique-pairs
  (enumerate-interval 1 4))
 '((1 2) (1 3) (2 3) (1 4) (2 4) (3 4)))

(provide unique-pairs)
