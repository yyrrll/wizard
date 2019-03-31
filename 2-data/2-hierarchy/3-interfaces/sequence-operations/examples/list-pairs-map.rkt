#lang racket

(require
  "../../library-02-02-03.rkt"
  )

; demonstrate use of map to make a list
;   simpler than accumulate

(define (list-pairs n seq)
    (map
      (lambda (x) (list n x))
      seq))


; tests / demonstrate

(require rackunit)

(check-equal? 
  (list-pairs 1 '(2 3 4))
  '((1 2) (1 3) (1 4)))

(check-equal?
  (map
    (lambda (x) (list 1 x))
    '(2 3 4))
  '((1 2) (1 3) (1 4)))


(check-equal?
  (list-pairs 1 (enumerate-interval 2 5))
  '((1 2) (1 3) (1 4) (1 5)))

