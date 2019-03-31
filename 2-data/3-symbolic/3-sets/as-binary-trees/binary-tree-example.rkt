#!/usr/local/bin/racket

#lang racket

(require "set.rkt")

(define e1 (make-tree 10 '() '()))
(define e2 (adjoin-set 20 e1))
(define e3 (adjoin-set 5 e2))
(define e4 (adjoin-set 15 e3))
(define e5 (adjoin-set 17 e4))
(define final (adjoin-set 1 e5))

(define example (adjoin-set 2 final))

(display "example")
(newline)
example

(display "(entry example)")
(newline)
(entry example)

(display "(left-branch example)")
(newline)
(left-branch example)

(display "(right-branch example)")
(newline)
(right-branch example)


(right-branch 
    (right-branch example))


; tree looks like so:
;
;               10
;       5               20
;   1       2       15      17

; example
;
; '(10 (5 (1 () (2 () ())) ()) (20 (15 () (17 () ())) ())


;   Representation of binary tree
;
;    Each node will be a list of three items: the entry at the node, the left
;    subtree, and the right subtree. A left or a right subtree of the empty list
;    will indicate that there is no subtree connected there.

(display e1)
(newline)
(display e2)
(newline)
(display e3)
(newline)
(display e4)
(newline)
(display e5)
(newline)

