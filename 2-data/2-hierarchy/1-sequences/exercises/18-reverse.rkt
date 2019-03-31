#!/usr/local/bin/racket


; Exercise 2.18

;   Define a procedure reverse that takes a list as argument and returns a list
;   of the same elements in reverse order:

;       (reverse (list 1 4 9 16 25))
;       (25 16 9 4 1)

;   NOTE Racket already does define a << reverse >> procedure


#lang racket

(require rackunit)

(provide (all-defined-out))

(define nil '()) 
 
;   the reverse of a list is the reverse of the list of items after the first
;   and the first item appended

;   recursive plan:
;       takes a list 
;       base case -- the last item of that list is empty -- return the list
;           (list has only item and is thus the reverse of itself
;       reductive step -- the reverse of the list is the reverse of the list of
;           its items after the first, with that first item appended to that
;           reverse

;       note that the initial item is reduced by one item with each recursive call

    ; community solution?
        ;; http://community.schemewiki.org/?sicp-ex-2.18

(define (reverse items) 
  (if (null? (cdr items)) 
      items 
      (append (reverse (cdr items)) 
              (cons (car items) nil)))) 
 

;; nb: calling reverse over and over again, once in each call -- expensive
;;  the iterative version will be more efficient, less elegant / clear

(check-equal?
    (reverse (list 1 2 3 4))
    '(4 3 2 1))

(define example
    (list 1 4 9 16 25))

(check-equal?  
    (reverse example)
    '(25 16 9 4 1))


; -------------------------------------------------------
; also 

;   recursive, list call rather than cons

    ; my initial (recursive) solution?
(define (reverse-with-list items) 
  (if (null? (cdr items)) 
      items 
      (append (reverse-with-list (cdr items)) 
              (list (car items))))) 

(check-equal?
    (reverse-with-list example)
    '(25 16 9 4 1))

;   iterative

;   approach
;       store prior reversal in object, pass that and list to reverse to
;       function putting first element of to-be-reversed at head of prior reversal;
;       repeat until to-be-reversed is empty

;   - inner functions takes a list to reverse and the reversal of prior items
;   - if list is null, done, return the reversal
;   - otherwise, call inner again, 
;       result -- reversal to date -- is the pair of the first item and the current reversal
;       items is the list of items after first (to be reversed) 
;           thus at each step, the first of the remaining items is put at the
;           start of a list containing all the prior reversals

(define (reverse-iterative items) 
  (define (iter to-be-reversed already-reversed) 
    (if (null? to-be-reversed) 
        already-reversed 
        (iter (cdr to-be-reversed) (cons (car to-be-reversed) already-reversed)))) 
  (iter items nil)) 
 
  
(check-equal?
    (reverse-iterative example)
    '(25 16 9 4 1))


; =============================================================================
;   style experiment -- intermediate term definitions
    ;   idea is, naming objects in let clause makes their "meaning" clearer in the operations

    ;   + ? I supposed the body clearly states the recursive plan?
    ;   - the "representations" defined in let seem tightly bound to their usage
    ;       reader must puzzle out why they are defined as they are

    ;   approach might make sense in some cases -- here, not sure it is more
    ;   readable than the solution, might be less so, and takes much longer to
    ;   write

(define (reverse-represented items) 
    (let ((to-be-reversed
                (cdr items))
          (current-first
                (if (null? (cdr items))     ; must guard car from empty list case
                    '()
                    (list (car items))))
          (already-reversed items)
         )

         (if (null? to-be-reversed)
           already-reversed
           (append
                (reverse-represented to-be-reversed)
                current-first)))) 


(check-equal?
    (reverse-represented '(25))
    '(25))

(check-equal?
    (reverse-represented '(25 16))
    '(16 25))

(check-equal?
    (reverse-represented example)
    '(25 16 9 4 1))

; =============================================================================
