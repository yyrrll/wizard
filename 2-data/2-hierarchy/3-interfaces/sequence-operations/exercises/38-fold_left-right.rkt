#!/usr/local/bin/racket

#lang racket
(define nil '())
(require "functions-local.rkt")
(define fold-right accumulate)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

; test / demonstrate
(require rackunit)

(define-test-suite fold-right-test
    (test-case 
      "test fold-right code"

    (check-equal?
      (fold-right / 1 (list 1 2 3))
      (/ 3 2))  ; (/ 1 (/ 2 3))
    
    (check-equal?
      (fold-left / 1 (list 1 2 3))
      (/ 1 6))  ; (/ 1 (/ 2 (/ 3)))
    
    (check-equal?
      (fold-right list nil (list 1 2 3))
      '(1 (2 (3 ()))))
    
    (check-equal?
     (fold-left list nil (list 1 2 3))
     '(((() 1) 2) 3))
    
    ; operation must satisify the property of associativity to guarantee that
    ; fold-left and fold-right return the same value
        ;   that is, the operation must be indifferent to the order in which it is
        ;   applied to the terms of the expression
    
    (check-equal?
      (fold-right * 1 (list 1 2 3))
      (fold-left * 1 (list 1 2 3)))
    
    (check-equal?
      (fold-right + 0 (list 1 2 3))
      (fold-left + 0 (list 1 2 3)))))

(run-test fold-right-test)

(provide
  fold-right
  fold-right-test
  )



; Exercise 2.38
; 
; The accumulate procedure is also known as fold-right, because it combines the
; first element of the sequence with the result of combining all the elements to
; the right. There is also a fold-left, which is similar to fold-right, except
; that it combines elements working in the opposite direction:
; 
; (define (fold-left op initial sequence)
;   (define (iter result rest)
;     (if (null? rest)
;         result
;         (iter (op result (car rest))
;               (cdr rest))))
;   (iter initial sequence))
; 
; What are the values of
; 
; (fold-right / 1 (list 1 2 3))
; (fold-left / 1 (list 1 2 3))
; (fold-right list nil (list 1 2 3))
; (fold-left list nil (list 1 2 3))
; 
; Give a property that op should satisfy to guarantee that fold-right and
; fold-left will produce the same values for any sequence.
