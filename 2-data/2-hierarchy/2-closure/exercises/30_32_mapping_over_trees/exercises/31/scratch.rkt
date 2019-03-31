#!/usr/local/bin/racket

; Iterating toward tree-map

#lang racket

(require "../../../../map.rkt"
         rackunit)

(define (square-tree tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
           (square-tree sub-tree)
           (* sub-tree sub-tree)))
       tree))


(define tree
  '(1 (2 (3 4) 5) (6 7)))


(check-equal?
  (square-tree tree)
    '(1 (4 (9 16) 25) (36 49)))

(define (square x)
  (* x x))


; square-tree, with (square) call

(define (square-tree-fnc tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
           (square-tree sub-tree)
           (square sub-tree)))
       tree))


(check-equal?
  (square-tree tree)
  (square-tree-fnc tree))


; square-tree, passing in procedure square

(define (square-tree-fnc-passed proc-inner tree)
  (map (lambda (sub-tree)
  ; (map (lambda (proc-inner sub-tree)      ; fails because << map >> passes only one argument to its << proc >> internal
         (if (pair? sub-tree)
           (square-tree-fnc-passed proc-inner sub-tree)
           (proc-inner sub-tree)))
       tree))

(check-equal?
  (square-tree tree)
  (square-tree-fnc-passed square tree))



;-fail-; extend map to pass function to mapped proc
;-fail-(define (map-two proc proc-inner items)
;-fail-  (if (null? items)
;-fail-      '() ;; nil
;-fail-      (cons (proc proc-inner (car items))
;-fail-            (map proc proc-inner (cdr items)))))
;-fail-
;-fail-
;-fail-(define (square-tree-fnc-proc proc-inner tree)
;-fail-  (map-two (lambda (proc proc-inner sub-tree)
;-fail-         (if (pair? sub-tree)
;-fail-           (square-tree-fnc-passed proc proc-inner sub-tree)
;-fail-           (proc-inner sub-tree)))
;-fail-       tree))
;-fail-
;-fail-
;-fail-(check-equal?
;-fail-  (square-tree tree)
;-fail-  (square-tree-fnc-proc square tree))


(define (outer-proc inner-proc items)
  (if (null? items)
    '()
    (if (pair? items)
        (cons (outer-proc inner-proc (car items))
              (outer-proc inner-proc (cdr items)))
        (inner-proc items))))

(define (square-tree-outer tree)
     (outer-proc square tree))


(check-equal?
  (square-tree tree)
  (square-tree-outer tree))



(define (tree-map proc tree)
  (if (null? tree)
    '()
    (if (pair? tree)
        (cons (tree-map proc (car tree))
              (tree-map proc (cdr tree)))
        (proc tree))))

(define (square-tree-tm tree)
     (tree-map square tree))


(check-equal?
  (square-tree tree)
  (square-tree-tm tree))



(define (tree-map-cond proc tree)
  (cond ((null? tree) '())
        ((pair? tree)
         (cons (tree-map proc (car tree))
              (tree-map proc (cdr tree))))
        (else (proc tree))))

(define (square-tree-cond tree)
     (tree-map-cond square tree))


(check-equal?
  (square-tree tree)
  (square-tree-cond tree))