#lang racket

(require
  "../../library-02-02-03.rkt"
  )

; demonstrate use of accumulate to make a list
;   NB: using map is simpler

(define (list-pairs n seq)
  (accumulate
    cons
    '()
    (map
      (lambda (x) (list n x))
      seq)))


; tests / demonstrate

(require rackunit)

(check-equal? 
  (list-pairs 1 '(2 3 4))
  '((1 2) (1 3) (1 4)))
