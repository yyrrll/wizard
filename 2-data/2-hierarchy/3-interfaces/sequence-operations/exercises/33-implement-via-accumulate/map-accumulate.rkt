; Section 2.2.3
;   Exercise 33 -- map
        ; complete template to implement << map >> using accumulate

; (define (map p sequence)
;   (accumulate (lambda (x y) <??>) nil sequence))

#lang racket

(require "../functions-local.rkt")

(define (map-accumulate p sequence)
    (accumulate (lambda (x y) (cons (p x) y)) nil sequence))


;; test / demonstrate

(require rackunit)

(define-test-suite map-accumulate-test
    (check-equal?
        (map abs (list -10 2.5 -11.6 17))
        (map-accumulate abs (list -10 2.5 -11.6 17))
        )
    
    (check-equal?
        (map (lambda (x) (* x x)) (list 1 2 3 4))
        (map-accumulate (lambda (x) (* x x)) (list 1 2 3 4))
        ))

(run-test map-accumulate-test)

(provide map-accumulate-test)
