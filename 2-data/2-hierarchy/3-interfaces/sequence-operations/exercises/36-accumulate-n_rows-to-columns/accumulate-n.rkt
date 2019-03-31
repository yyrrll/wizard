; community solution -- http://community.schemewiki.org/?sicp-ex-2.36

#lang racket

(require
  "../functions-local.rkt"
  ; "../../functions/accumulate.rkt"
 "../columns-rows.rkt"
  rackunit
)

(define nil '())

; accumulate-n 

;   given operation, initial value, and a sequence of sequences (each with the
;   same number of elements)

;   for each index in the sequences, return accumulation of operation on
;   initial value and the indexed item of each sequence

(define (accumulate-n op init sequence-of-sequences) 
  (if (null? (car sequence-of-sequences)) 
      nil 
      (cons (accumulate op init (map car sequence-of-sequences)) 
            (accumulate-n op init (map cdr sequence-of-sequences))))) 
 
(provide accumulate-n)

;; Usage: 
; (accumulate-n + 0 t) 

;   test

(define-test-suite accumulate-n-test
    (test-case
      "test solution to Exercise 36"

      (check-equal?
        (accumulate-n + 0 rows)
        '(22 26 30))
      
      (check-equal?
        (accumulate-n
          +
          0
          '(
            (   1   2   3 )
            (  10  20  30 )
            ( 100 200 300 )
            )
          )
           '( 111 222 333 )
           )
      
      )
    )

(run-test accumulate-n-test)

(provide accumulate-n-test)

; Exercise 2.36
; 
; The procedure accumulate-n is similar to accumulate except that it takes as its
; third argument a sequence of sequences, which are all assumed to have the same
; number of elements. It applies the designated accumulation procedure to combine
; all the first elements of the sequences, all the second elements of the
; sequences, and so on, and returns a sequence of the results. For instance, if s
; is a sequence containing four sequences, ((1 2 3) (4 5 6) (7 8 9) (10 11 12)),
; then the value of (accumulate-n + 0 s) should be the sequence (22 26 30). Fill
; in the missing expressions in the following definition of accumulate-n:
; 
; 
; (define (accumulate-n op init seqs)
;   (if (null? (car seqs))
;       nil
;       (cons (accumulate op init <??>)
;             (accumulate-n op init <??>))))
; 
