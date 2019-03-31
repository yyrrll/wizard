#!/usr/local/bin/racket

;; TODO

;;      clean up -- simplify
;;          what is the right fix?  right iterative fix?
;;      what is the significance of all this?
;;          can map like processes be implemented iteratively?  if not, why not?
;;          if so, how so?
;;              how would iterative and recursive implementations compare?
;;      are these efforts recursive?

;; Exercise 2.22

;; Louis then tries to fix his bug by interchanging the arguments to cons:

;; (define (square-list items)
;;   (define (iter things answer)
;;     (if (null? things)
;;         answer
;;         (iter (cdr things)
;;               (cons answer
;;                     (square (car things))))))
;;   (iter items nil))

;; This doesn't work either. Explain.


#lang racket

(require
  "functions.rkt"
  rackunit)

;; demo

(square-list (list 1 2 3 4))


;; Here:
;;      from wiki:
;;          the function constructs a list of answers with cons, but those answers are lists; so the accumulation results in a list of lists
            ;; but -- don't understand where returned list comes from
            ;; doesn't seem right -- i don't think cons is returning a list at all
            ;;  the implementation is pairing an item (a list?) with an item 
            ;;      but representation of lists with cons is done by pairing an item with another pair
            ;;      this is not supplying a pair for the second item -- it is instead supplying a ...?

;;      also, places this at the from of the list


(define example-list (list 1 2 3 4))

;; example-list

;; (car example-list)

;; (square (car example-list))

(display "cons-example\n")

(define cons-example
    (cons
        (square 1)
        (square 2)))

cons-example

;; (car cons-example)
;; (cdr cons-example)


;; (cons
;;     (square 1)
;;     (cons 
;;         (square 2)
;;         '()))


;; fixed returns a list, but again in reversed order -- because recursive, not truly iterative
;;      fix would have to be, make the procedure truly iterative
;;      - pass in items calculated to date? but this will be a list -- would have to use append, not cons

(define (square-list-fixed items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons 
                    (square (car things))
                    answer
                                         ))))
  (iter items '()))
        ;; (iter items nil))

(display "fixed?\n")
(define fixed (square-list-fixed example-list))

fixed

(car fixed)
(cdr fixed)

(provide square-list)
