#lang racket 

(require
  "../../../library-02-02-03.rkt"
  "../../prime-sum-pairs.rkt"
  "unique-pairs.rkt"
  rackunit
  rackunit/text-ui
  )

;; get list of pairs, under n, whose sum is prime -- with pairs-smaller abstraction
(define (prime-sum-pairs-40 n)
  (map make-pair-sum
       (filter prime-sum?
               (flatmap
                unique-pairs
                (enumerate-interval 1 n)))))

(define-test-suite prime-sum-pairs-40_test
    (test-case
     ""
     (check-equal?
       (prime-sum-pairs-40 6)
       '((1 2 3) (2 3 5) (1 4 5) (3 4 7) (2 5 7) (1 6 7) (5 6 11)))))

(run-tests prime-sum-pairs-40_test)
(provide prime-sum-pairs-40_test)
