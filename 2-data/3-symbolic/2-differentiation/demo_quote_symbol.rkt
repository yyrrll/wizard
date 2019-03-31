#!/usr/local/bin/racket

#lang racket

(require rackunit)

; Concepts

; demonstrate quote
(check-equal? (quote (x - 3)) '(x - 3))

; usage, concepts for << symbol? >> 
(check-true (symbol? 'x))

; note that << 'x >> a "symbol", but << '(+ x 3) >> is not
;   why?
;       '(+ x 3) is a _list_
;           comprised, I think, of symbols

(check-false (symbol? '(+ x 3)))
(check-false (symbol? '(x)))
              
(check-false (symbol? (quote (x - 3))))

(check-true (pair? (quote (- x 3))))
(check-true (pair? '(- x 3)))
(check-equal? (car '(- x 3)) '-)
(check-true (symbol? (car '(- x 3))))
(check-false (pair? 'x))
