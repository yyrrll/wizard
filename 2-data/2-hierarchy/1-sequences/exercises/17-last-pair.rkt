#!/usr/local/bin/racket

;; Exercise 2.17

;; Define a procedure last-pair that returns the list that
;; contains only the last element of a given (nonempty) list:
;;    (last-pair (list 23 72 149 34))
;;    (34)

#lang racket

(require rackunit)

(define (last-pair items)
    (let ((rest (cdr items)))
        (if (null? rest)
        items
        (last-pair rest))))


(define subject-list
    (list 23 72 149 34))

(check-equal?  (last-pair subject-list) (list 34))
(check-equal?  (last-pair subject-list) '(34))  ;; alternative list notation


; or


;   vs above?
;       + less wordy
;       - does not "represent" the "meaning" of (cdr items)
(define (last-pair-2 items)
    (if (null? (cdr items))
        items
        (last-pair-2 (cdr items))))

(check-equal?  (last-pair-2 subject-list) '(34))

