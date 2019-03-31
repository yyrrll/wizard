#lang racket

(require
  "../functions-02-02-03.rkt"
  "../sequence-operations/examples.rkt"
  "../../../../library.rkt"
  rackunit
  )

; remember enumerate-interval generates list of integers from arguments low to high
(check-equal?
 (enumerate-interval 1 6)
 '(1 2 3 4 5 6))


; get pairs under n
(define (get-pairs n)
  (accumulate append
              nil
              (map (lambda (i)
                     (map (lambda (j) (list i j))
                          (enumerate-interval 1 (- i 1))))
                   (enumerate-interval 1 n))))

(check-equal?
 (get-pairs 6)
 '((2 1)
   (3 1) (3 2)
   (4 1) (4 2) (4 3)
   (5 1) (5 2) (5 3) (5 4)
   (6 1) (6 2) (6 3) (6 4) (6 5)))

; map and accumulate with append
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))


; demonstrate action of inner map passed to flatmap
;   map gets sequence from 1 to 5, procedure making list of 1 and that number
(check-equal?
  (map (lambda (j) (list 1 j))
       (enumerate-interval 1 5))
  '((1 1) (1 2) (1 3) (1 4) (1 5)))

; why isn't (1 1) in output?
(check-equal?
  (map (lambda (j) (list 1 j))
       (enumerate-interval 1 (- 1 1 )))
  '())

(check-equal?
  (map (lambda (j) (list 1 j))
       (enumerate-interval 1 (- 2 1)))
  '((1 1)))

(check-equal?
  (map (lambda (j) (list 1 j))
       (enumerate-interval 1 1))
  '((1 1)))

(check-equal?
  (map (lambda (j) (list 1 j))
       (enumerate-interval 1 (- 2 1)))
  '((1 1)))


; demonstrate flatmap usage
;   for each i in range, maps list creation function over range of 1 to i less 1
(check-equal?
 (flatmap
  (lambda (i)
    (map (lambda (j) (list i j))
         (enumerate-interval 1 (- i 1))))       ; nb: does nothing until i is 2
  (enumerate-interval 1 6))
 (get-pairs 6))
; ? why isn't (1 1) in output?

; here, flatmap is given a range of numbers, and a procedure 

(check-equal?
  (enumerate-interval 1 (- 1 1))
  '())

(check-equal?
  (enumerate-interval 1 (- 2 1))
  '(1))

(check-equal?
  (enumerate-interval 1 (- 3 1))
  '(1 2))

; check if sum of pair (really, a list of two) is prime
(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(check-equal?
 (prime-sum? '(1 3))
 #f)

(check-equal?
 (prime-sum? '(2 3))
 #t)


; make a triple of a pair and its sum
(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(check-equal?
 (make-pair-sum '(2 3))
 '(2 3 5))

; get list of pairs, under n, whose sum is prime
(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (flatmap
                (lambda (i)
                  (map (lambda (j) (list i j))
                       (enumerate-interval 1 (- i 1))))
                (enumerate-interval 1 n)))))


(check-equal?
 (prime-sum-pairs 6)
 '((2 1 3) (3 2 5) (4 1 5) (4 3 7) (5 2 7) (6 1 7) (6 5 11)))


; further simplification / abstraction of textbook code

; return list of pairs of i and positive integers smaller than i
(define (pairs-smaller i)
  (map
    (lambda (j) (list i j))
    (enumerate-interval 1 (- i 1))
    ))

(check-equal?
 (pairs-smaller 4)
 '((4 1) (4 2) (4 3)))

; add pairs-smaller abstraction to flatmap check
(check-equal?
 (flatmap
  pairs-smaller
  (enumerate-interval 1 4))
 '((2 1) (3 1) (3 2) (4 1) (4 2) (4 3)))


;   NB: difference between pairs-smaller and flat-mapping this
;   - pairs-smaller takes a number and generates a list of corresponding pairs
;   - flatmap takes the procedure and a sequence -- it gets the procedure's
;     return for each item in the sequence, returning the return for each item 
;     as a list


;; get list of pairs, under n, whose sum is prime -- with pairs-smaller abstraction
(define (prime-sum-pairs-ps n)
  (map make-pair-sum
       (filter prime-sum?
               (flatmap
                pairs-smaller
                (enumerate-interval 1 n)))))

; prime-sum-pairs-ps:
;   maps make-pair-sum -- tripleting pairs
;     on the list from the filter prime-sum?
;         on the list of pairs of smaller-than numbers

(check-equal?
 (prime-sum-pairs-ps 6)
 '((2 1 3) (3 2 5) (4 1 5) (4 3 7) (5 2 7) (6 1 7) (6 5 11)))


; racket code, not in textbook
;    see https://docs.racket-lang.org/reference/require.html#%28form._%28%28lib._racket%2Fprivate%2Fbase..rkt%29._rename-out%29%29
(provide
 (rename-out [prime-sum-pairs-ps prime-sum-pairs]
             )
 prime-sum?
 flatmap
 make-pair-sum
 )
