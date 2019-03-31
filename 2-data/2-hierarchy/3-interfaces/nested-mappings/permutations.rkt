#lang racket

(require
  rackunit
  rackunit/text-ui
  "library-02-02-03-nested.rkt"
  )


;   Return permutations of "set" s
;       that is, all the ways of ordering the items in the "set"
;
;       nb: from text.  strictly speaking, i believe sets are generally
;       considered unordered

(define (permutations s)
  (if (null? s)                    ; empty set?
      (list '())                   ; sequence containing empty set
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))

(define-test-suite permutations_test
    (test-case
      ""

      (check-equal?
        (permutations '(1 2 3))
        '((1 2 3)
          (1 3 2)
          (2 1 3)
          (2 3 1)
          (3 1 2)
          (3 2 1))
        )
      ))

(run-tests permutations_test)

; " Here is a plan for generating the permutations of S: For each item x in S,
; recursively generate the sequence of permutations of S - x, and adjoin x to the
; front of each one. This yields, for each x in S, the sequence of permutations
; of S that begin with x. Combining these sequences for all x gives all the
; permutations of S"
; 
; "Notice how this strategy reduces the problem of generating permutations of S
; to the problem of generating the permutations of sets with fewer elements than
; S."
; 
; "remove can be expressed as a simple filter:
; 
; (define (remove item sequence)
;   (filter (lambda (x) (not (= x item)))
;           sequence))
; 
; nb: is provided by Scheme (racket?) as built-in, below
;       does not seem to work quite as defined in text


; << remove >> item list
;   builtin
;   returns list with item removed

(define-test-suite show-remove_test
    (test-case
      "show how builtin << remove >> works "

      (check-equal?
        (remove 1 '(1 2 3))
        '(2 3))
      
      (check-equal?
        (remove 1 '(2 3 1))
        '(2 3))
      
      (check-equal?
        (remove 2 '(1 2 3))
        '(1 3))
      
      ; seems to remove only the first occurence of the item
      (check-equal?
        (remove 1 '(1 2 3 1))
        '(2 3 1))
        
      ; returns list without item, whether present in given or not
      (check-equal?
        (remove 1 '(2 3))
        '(2 3))
      
      ))

(run-tests show-remove_test)

(provide permutations)
