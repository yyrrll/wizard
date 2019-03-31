#!/usr/local/bin/racket

;; demonstration of << append >> -- combines two lists

#lang racket

(require rackunit)

(check-equal?  (append '(2 4) '(3 7)) '(2 4 3 7))
(check-equal?  (append '(3 7) '(2 4)) '(3 7 2 4))
