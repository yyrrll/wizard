#!/usr/local/bin/racket

#lang racket

(require rackunit)

; Lisp provide abbrevations for nested applications of car and cdr

(define example '(1 (2 3)))

(check-equal? (car (car (cdr example))) 2)
(check-equal? (caadr example) 2)
(check-equal? (car (car (cdr example))) (caadr example))


; however, there seems to be a limit on the length of the abbreviations -- 
;  << cadaddr >> errs as undefined
