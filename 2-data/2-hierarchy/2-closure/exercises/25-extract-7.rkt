#!/usr/local/bin/racket

; Exercise 2.25.  Give combinations of cars and cdrs that will pick 7 from each
;  of the following lists:

    ;;  Motivation: intuitions on car and cdr sequences on nested lists

#lang racket

(require rackunit)
(provide (all-defined-out))

(define x1
  (list 1 3 (list 5 7) 9))

(check-equal?
    (car 
        (cdr 
            (car 
                (cdr 
                    (cdr x1)))))
    7
)

;; alternative notation:

(check-equal?
    (car (cdaddr x1))
    7
)

;   NOTE
; (car (cdaddr x1))
;        errs
;   "cadaddr: undefined;"
;
;   perhaps there is a limit on the length of car-cdr abbreviation sequences?
;       also
;        cdadadr: undefined
;
;       seems to be limit of 4 operations in any one sequence
;


;; #2 Extract y from ((7))

(define x2 '((7)))

(check-equal?
    (car (car x2))
    7)


(check-equal?
    (caar x2)
    7)


;; #3 Extract 7 from (1 (2 (3 (4 (5 (6 7)))))

(define x3
    '(1 (2 (3 (4 (5 (6 7)))))))


(check-equal?
    (cadadr (cadadr (cadadr x3)))
    7)

; note: sequence is nested list; at each level, its length is two
;   each << cadr operation >> pulls out the second item

(check-equal?
    (cadr x3)
    '(2 (3 (4 (5 (6 7))))))

;   thus, retrieving the 7 requires a sequences of << cadr >> operations -- as
;   many as there are lists, less one
