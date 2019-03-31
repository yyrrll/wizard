#lang racket

(require
  "unique-pairs-given.rkt"
  "../../../library-02-02-03.rkt"
  rackunit
  rackunit/text-ui
  )


;   List unique "pairs" such that 1 < first < second < n

;  (map
;      (lambda (x) (list n x))
;      seq))

(define (unique-pairs n)
  (map
    (lambda (x)
      (unique-pairs-given n x))
    (enumerate-interval 1 (- n 1))))


(define-test-suite unique-pairs-test
    (test-case
      ""

      (check-equal?
        (unique-pairs 4)
        ;'(((1 2) (1 3)) ((2 3)) ())     ; wrong result -- playing with run-tests
         '((1 2) (1 3) (2 3))
        )
      
        ; demonstrate pattern for getting lists via map
      (check-equal?
          (map
            (lambda (x) (list 1 x))
            (enumerate-interval 2 4))
          '((1 2) (1 3) (1 4)))
      ))

(run-tests unique-pairs-test)
