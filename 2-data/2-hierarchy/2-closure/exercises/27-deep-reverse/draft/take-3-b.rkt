#!/usr/local/bin/racket

#lang racket

(provide deep-reverse)

(require rackunit)

(define (deep-reverse items)
  (if (null? (cdr items))
      items
      (append (deep-reverse (cdr items))
              (if (pair? (car items))
                  (deep-reverse (car items))
;;                  (car items)))))
                  (list (car items))))))

(define x (list (list 1 2) (list 3 4)))

x
;; car of list of lists returns list
(car x)
;; cdr of list of lists returns list of lists -- just with the elements following
;; first cdr is getting a list of second element
(cdr x)
;; must car subsequently to retrieve the second element itself
(cadr x)

;; Object diagrammed in Figure 2.5
;;    representation is not what i expected -- structure implications?
;;    missing something fundamental here -- RESUME HERE

(display "x2\n")
(define x2
  (cons (list 1 2)
        (list 3 4)))

x2
(car x2)
(cdr x2)


(check-equal?  
    (deep-reverse x)
    '((4 3) (2 1)))

;; not reversing last element
;; reversing first element, but returning as elements, not list