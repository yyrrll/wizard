#!/usr/local/bin/racket

;; Section 2.2.1

;;  list -- a tree of nested pairs, each holding a value and a nested pairs item or an nil / empty list nil.

;;  Section 2.2.1

;;    outline:
;;
;;	a representation of a sequence in terms of pairs:
;;
;;		chain of pairs
;;		for each:
;;			- first item (<< car >>) is "corresponding item" (ie, data
;;			  element / object)
;;			- second item ( <<< cdr >>> ) is next pair in chain
;;		end of sequence signaled in final pair by second element pointing to nil
;;			- nb: nil is "a distinguished value" (?) that is not a pair


#lang racket

(require rackunit)

; represent sequence / list with << cons >> calls
(check-equal?
  '(1 2 3 4)
  (cons 1
    (cons 2
      (cons 3
        (cons 4 '())
        ))))
