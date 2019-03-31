#!/usr/local/bin/racket

#lang racket

(provide deep-reverse)

(require rackunit)

(define (deep-reverse items)
  ;; begin debug
;  (display "top\n")
;  (display items)
;  (newline)
;  (display (cdr items))
;  (newline)
;  (display (null? (cdr items)))
;  (newline)
  ;; end debug
  (if (null? (cdr items))
      items
      (append (deep-reverse (cdr items))
              (if (pair? (car items))
                  (deep-reverse (car items))
                  (list (car items))))))



(check-equal?
 (deep-reverse '(1 2 3))
 '(3 2 1))

(check-equal?
 (deep-reverse '(1 2))
 '(2 1))

(check-equal?
 (deep-reverse '((1)))
 '((1)))

(check-equal?
 (deep-reverse '((1)( (2))))
 '((2) (1)))
 

 ;; WRONG
 
;; (deep-reverse '((1 2) (3 4)));;


 ;(define x (list (list 1 2) (list 3 4)))
; 
;(check-equal?  
;    (deep-reverse x)
;    '((4 3) (2 1)))

;; not reversing last element
;; reversing first element, but returning as elements, not list