;   TODO -- consolidate

#lang racket

(require
  rackunit
  rackunit/text-ui
  "../../library-02-02-03.rkt"
  "../prime-sum-pairs.rkt"
  )


;   demonstrations of how flatmap differs from map

;   MAKING THIS TOO COMPLICATED
;   - looking for some profound transformation in flatmap
;   - it is the same as map, but collapses the internal lists
;   -   (or, at least, their first level; see below)

;   << flatmap >> is the same as << map >>, but, flattens the lists that map would produce

(define (make-list first second)
  (list first second))

(check-equal?
  (map
    (lambda (i) (make-list 1 i))
    (enumerate-interval 1 4))
  '((1 1) (1 2) (1 3) (1 4)))


(check-equal?
  (flatmap
    (lambda (i) (make-list 1 i))
    (enumerate-interval 1 4))
  '(1 1 1 2 1 3 1 4))

; demonstration that only first level is collapsed

(check-equal?
  (flatmap
    (lambda (i) (list (make-list 1 i)))
    (enumerate-interval 1 4))
  '((1 1) (1 2) (1 3) (1 4)))

; if map is given (list (make-list ...)), it returns a list of lists of lists
;   the first level of the interior lists is stripped off by flatmap

(check-equal?
  (map
    (lambda (i) (list (make-list 1 i)))
    (enumerate-interval 1 4))
  '(((1 1)) ((1 2)) ((1 3)) ((1 4))))

; ------
;   over-complicating stuff . . . 

(define (doubles first n)
  (map
    (lambda (x)
      (list first x))
    (enumerate-interval first n)))

(check-equal?
  (doubles 1 4)
  '((1 1) (1 2) (1 3) (1 4)))


;   when given a listing lambda, flatmap is same as map
(check-equal?
  (flatmap
    (lambda (i) (list i))           ; procedure
    (doubles 1 4))                  ; sequence
  '((1 1) (1 2) (1 3) (1 4)))


;   simply giving << list >> has same effect
(check-equal?
  (flatmap
    list                            ; procedure
    (doubles 1 4))                  ; sequence
  '((1 1) (1 2) (1 3) (1 4)))


;   when given lambda just returning item, collapses internal lists
(check-equal?
  (flatmap
    (lambda (i) i)          ; procedure
    (doubles 1 4))          ; sequence
  '(1 1 1 2 1 3 1 4))
  ; was '((1 1) (1 2) (1 3) (1 4)))



;   giving << append >> also collapses
(check-equal?
  (flatmap
    append                          ; procedure
    (doubles 1 4))                  ; sequence
  '(1 1 1 2 1 3 1 4))

; given appending procedure
(check-equal?
  (flatmap
    (lambda (i) (list (append (list 7) i)))     ; procedure
    (doubles 1 4))                              ; sequence
  '((7 1 1) (7 1 2) (7 1 3) (7 1 4)))


;   transforming procedure -- double first item 
;       flatmap collapses internal lists
(check-equal?
  (flatmap
    (lambda (item) (list (* 2 (car item)) (car (cdr item))))    
    (doubles 1 4))
  '(2 1 2 2 2 3 2 4))
  ;-'((2 2) (2 2) (2 3) (2 4)))


;   transforming procedure -- double first item 
;       to preserve internal lists through flatmap, wrap procedure return in list
(check-equal?
  (flatmap
    (lambda (item) (list (list (* 2 (car item)) (car (cdr item)))))
    (doubles 1 4))
  '((2 1) (2 2) (2 3) (2 4)))

; but, that wrapped usage is essentially the same as << map >>
(check-equal?
  (map
    (lambda (item) (list (* 2 (car item)) (car (cdr item))))
    (doubles 1 4))
  '((2 1) (2 2) (2 3) (2 4)))

; nb: when seeing wrapped usage, check if flatmap can be refactored to map


;   TODO: what is the motivation for flatmap -- is it simply to collapse lists?
