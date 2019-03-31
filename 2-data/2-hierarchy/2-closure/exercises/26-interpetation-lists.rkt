#!/usr/local/bin/racket


; Exercise 2.26: 
; 
; Suppose we define x and y to be two lists:
; 
; (define x (list 1 2 3))
; (define y (list 4 5 6))
; 
; What result is printed by the interpreter in response to eval-
; uating each of the following expressions:
; 
; (append x y)
; (cons x y)
; (list x y)


#lang racket

(require rackunit)

(define x (list 1 2 3))
(define y (list 4 5 6))

;   << append >> combines the two lists into one
(check-equal?
    (append x y)
    (list 1 2 3 4 5 6)
)

;   << cons >> -- creates a pair of the first item and the second
(check-equal?
    (cons x y)
    '((1 2 3) 4 5 6)
)

    ; aside: the list representation of << y >> obscures that the list y is itself
    ; a construction of pairs
    
    (check-equal?
        y
        (cons 4 (cons 5 (cons 6 '())))
    )
    
    (check-equal?
        '(4 5 6)
        (cons 4 (cons 5 (cons 6 '())))
    )


;   << list >> creates a nested listed -- list of the two items, each as a list
;   in its own right

(check-equal?
    (list x y)
    '((1 2 3) (4 5 6))
)


    ;   TODO -- move note (on pair representation, '() as end of list of pairs)
    ;   to other file?

    ; aside
        ; note that racket notation << '() signifies both a pair and a list
        ; in racket -- the pair is differentiated by a dot separating elements

    (check-equal?
        (cons 5 6)
        '(5 . 6)
    )

    ;   note also the role of the empty list -- '() -- in denoting the end of a
    ;   list as a sequence of cons calls
    ;   -- without this, the last item of the "list" is the pair (5 . 6)

    (check-equal?
        '(4 5 . 6)
        (cons 4 (cons 5 6 ))
    )
