#lang racket

;; Exercise 2.1

;;  Improve make-rat to normalize signs of numerator and denominator
;;  - if rational number is 
;;      positive, both are positive
;;      negative, numerator is negative

; getting << numer >> and << denom >> from rational-interface.rkt; required by tests/01-normalize

(require
    "../demonstration/rational/rational-interface.rkt"
    )

(provide
    make-rat
    numer
    denom
    )


(define (make-rat n d)
  (let (
    (n (if (> 0 (/ n d))
            (* -1 (abs n))
            (abs n)))
    (d (abs d))
    (g (abs (gcd n d))))
    (cons (/ n g) 
          (/ d g))))
