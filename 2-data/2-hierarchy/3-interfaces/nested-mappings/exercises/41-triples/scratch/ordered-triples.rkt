#!/usr/local/bin/racket

#lang racket

(require
  rackunit
  rackunit/text-ui
  "complements.rkt"
  "../../../../library-02-02-03.rkt"
  "../../../library-02-02-03-nested.rkt"
  )


; ========================================

; ----------------------------------------
; ordered-triple
;   - list of three integers
;   - first item equal to << given >>
;   - each internally sorted
;   - items summing to << s >>

(define (ordered-triple given s)
  (flatmap
    (lambda (complement-pair)
      (list (append (list given) complement-pair)))
    (get-complement-pairs (+ given 1) (- s given)))
  )
    
;   - - - - - - - - - - - - - - - - - - - - 

; ----------------------------------------
;   test

(define-test-suite ordered-triple_test
    (test-case
      ""

      (check-equal?
        (ordered-triple 1 6)
        '((1 2 3)))

      (check-equal?
        (ordered-triple 1 7)
        '((1 2 4)))

      (check-equal?
        (ordered-triple 1 8)
        '((1 2 5)
          (1 3 4)))

      (check-equal?
        (ordered-triple 1 11)
        '((1 2 8)
          (1 3 7)
          (1 4 6)
          )
        )

      (check-equal?
        (ordered-triple 2 11)
        '(
          (2 3 6)
          (2 4 5)
          ))

      (check-equal?
        (ordered-triple 3 11)
        '()
        )
      ))

(run-tests ordered-triple_test)

; - - - - - - - - - - - - - - - - - - - - 
; ----------------------------------------
; ========================================

; ----------------------------------------
; ordered-triples
;   - list of ordered-triples, each item less than max-n
;   - ordered by first, second, third values

;   various implementations of solution

; - - - - - - - - - - - - - - - - - - - - 
; uses abtraction layers
(define (solution-abstracted max-n whole)
  (flatmap
    (lambda (i) (ordered-triple i whole))
    (enumerate-interval 1 (- max-n 1))))

; - - - - - - - - - - - - - - - - - - - - 
; problem abtraction layers defined in local scope

(define (solution-local-abstracted max-n whole)

  (define (get-complement-pairs n whole)
      (flatmap
        (lambda (i)
          (list (list i (- whole i))))
        (enumerate-interval n (/ (- whole 1) 2))))

  (define (ordered-triple given s)
    (flatmap
      (lambda (complement-pair)
        (list (append (list given) complement-pair)))
      (get-complement-pairs (+ given 1) (- s given))))

  (flatmap
    (lambda (i) (ordered-triple i whole))
    (enumerate-interval 1 (- max-n 1))))

; - - - - - - - - - - - - - - - - - - - - 
;   removes ordered-triple abstraction / indirection

(define (dft-2 max-n whole)
  (flatmap
    ; procedure --
    (lambda (given)
      (flatmap
        ; inner procedure -- 
        (lambda (complement-pair)
          (list (append (list given) complement-pair))
          )
        ; inner sequence --
        (get-complement-pairs (+ given 1) (- whole given))
        )
      )
    ; sequence --
    (enumerate-interval 1 (- max-n 1))
    ))

; - - - - - - - - - - - - - - - - - - - - 
;   removes more abstractions

(define (dft-3 max-n whole)
  (flatmap
    ; l1 procedure --
    (lambda (given)
      (flatmap
        ; l2 procedure -- 
        (lambda (complement-pair)
          (list (append (list given) complement-pair))
          )
        ; l2 inner sequence --

        (flatmap
          ; l3 procedure --
          (lambda (i)
            (list (list i (- (- whole given) i))))
          ; l3 inner sequence --
          (enumerate-interval (+ given 1)  (/ (- (- whole given) 1) 2))
          )
        )
      )
    ; l1 sequence --
    (enumerate-interval 1 (- max-n 1))
    )
  )

; - - - - - - - - - - - - - - - - - - - - 
;   no abstractions

(define (no-abstractions max-n whole)
  (flatmap
    (lambda (given)
      (flatmap
        (lambda (complement-pair)
          (list (append (list given) complement-pair))
          )
        (flatmap
          (lambda (i)
            (list (list i (- (- whole given) i)))
            )
          (enumerate-interval (+ given 1)  (/ (- (- whole given) 1) 2))
          )
        )
      )
    (enumerate-interval 1 (- max-n 1))
    )
  )

; - - - - - - - - - - - - - - - - - - - - 
; conform no-abstraction to community solution variables

(define (no-abstraction-community-format n s)
  (flatmap
    (lambda (i)
      (flatmap
        (lambda (j)
          (list (append (list i) j))
          )
        (flatmap
          (lambda (k)
            (list (list k (- (- s i) k)))
            )
          (enumerate-interval (+ i 1)  (/ (- (- s i) 1) 2))
          )
        )
      )
    (enumerate-interval 1 (- n 1))
    )
  )

; - - - - - - - - - - - - - - - - - - - - 
; conform no-abstraction to community solution variables and formatting

(define (no-abstraction-community-all n s)
  (flatmap
   (lambda (i)
     (flatmap
      (lambda (j)
        (list (append (list i) j)))
      (flatmap
       (lambda (k)
         (list (list k (- (- s i) k))))
       (enumerate-interval (+ i 1)  (/ (- (- s i) 1) 2)))))
   (enumerate-interval 1 (- n 1))))


; - - - - - - - - - - - - - - - - - - - - 
; community

;   works, but reverses order of triples and order within
;       do i have the proper ordering?
;       - seems that orderings are not specified

; (define (ordered-triples-sum n s)
(define (community n s)
   (filter (lambda (list) (= (accumulate + 0 list) s))
          (flatmap
           (lambda (i)
             (flatmap (lambda (j)
                  (map (lambda (k) (list i j k))
                       (enumerate-interval 1 (- j 1))))
                  (enumerate-interval 1 (- i 1))))
             (enumerate-interval 1 n))
          )
   )

;   why the filter call?
; output of first test without filter call:
; actual:     '((3 2 1) (4 2 1) (4 3 1) (4 3 2))
; expected:   '((1 2 3))

; - - - - - - - - - - - - - - - - - - - - 
;   switch implementation of solution
;       (all should have same interface and output)

; (define ordered-triples solution-abstracted)
(define ordered-triples solution-local-abstracted)

; (define ordered-triples community)    ; fails -- different ordering
; (define ordered-triples no-abstraction-community-all)

; - - - - - - - - - - - - - - - - - - - - 

; ----------------------------------------
; tests

(define-test-suite ordered-triples_test
    (test-case
      ""

      (check-equal?
        (ordered-triples 4 6)
        '((1 2 3)))

      (check-equal?
        (ordered-triples 5 7)
        '((1 2 4)))

      (check-equal?
        (ordered-triples 6 8)
        '((1 2 5)
          (1 3 4)))

      (check-equal?
        (ordered-triples 8 11)
        '(
          (1 2 8)
          (1 3 7)
          (1 4 6)
          (2 3 6)
          (2 4 5)))

      ))

(run-tests ordered-triples_test)

; ----------------------------------------

; ========================================

(provide   ordered-triples_test)

; ========================================

; Sun Jul 29 17:52:00 EDT 2018
;   - strip abstractions out of solution
; Sun Jul 29 18:37:48 EDT 2018

;   NEXT
;   - proper style for solution?


