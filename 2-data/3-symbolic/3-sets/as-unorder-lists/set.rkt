#!/usr/local/bin/racket

#lang racket

(require rackunit)


(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(check-true (element-of-set? 'x '(x y z)))
(check-false (element-of-set? 'a '(x y z)))


(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))


(check-equal? (adjoin-set 'x '(y z)) '(x y z))
(check-equal? (adjoin-set 'x '(x y z)) '(x y z))


(define (intersection-set set1 set2)
  ; (cond ((or (null? set1)) '())   ; -- also works -- set2 check not logically required
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))


(check-equal?  (intersection-set '(a b c) '(x y z)) '())
(check-equal?  (intersection-set '(a b c) '(x y a)) '(a))
(check-equal?  (intersection-set '(a b c) '(x b a)) '(a b))
(check-equal?  (intersection-set '(a b c) '()     ) '())
(check-equal?  (intersection-set '()      '(x y z)) '())

;   Exercise 2.59
    ; cost is O(n^2) + O(n)
        ; n element-of-set calls
        ;   each of which is itself O(n)
        ; plus, O(n) for cons calls
(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ; -- ((null? set2) set1)
        ((not (element-of-set? (car set1) set2))
         (cons (car set1)
               (union-set (cdr set1) set2)))
        (else (union-set (cdr set1) set2))))

; can also simply call adjoin-set, which returns set or set + item depending on inclusion
    ; still O(n^2) + O(n)
    ; n adjoin set calls
        ; each of which is O(n) + 1

(define (union-set-adjoining set1 set2)
  (cond ((null? set1) set2)
        (else (adjoin-set (car set1) (union-set (cdr set1) set2)))))

(define union-set-used union-set-adjoining)

(check-equal? (union-set-used '() '(x y z)) '(x y z))
(check-equal? (union-set-used '(x y z) '()) '(x y z))
(check-equal? (union-set-used '(a b c) '(x y z)) '(a b c x y z))
(check-equal? (union-set-used '(a b c) '(a b z)) '(c a b z))
(check-equal? (union-set-used '(a b z) '(a b z)) '(a b z))


;---Exercise 2.60
;---
;---Procedures
;---- element-of-set and intersection-set do not change -- must still check membership
;---- adjoin-set and union-set go faster
;---    - adjoin-set from O(n) + 1 to 1
;---        - because drops element check
;---    - union-set from O(n^2) + O(n) to O(n) ( O(2n)?)
;---        - simply append the two lists -- one operation for each item in set2 (and in set1?)
;---
;---Efficiency
;---- new methods generate larger n values for all-set operations -- union-set
;---- element-of not slowed because duplicates are found just as quickly as in limited sets
;---- so element-of and intersection are just as fast as before, adjoin and union much faster
;---
;---
;---Preferability?
;---- code will execute faster for all but union-set
;---- but, outputs will be harder to read and understand


