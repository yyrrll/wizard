#!/usr/local/bin/racket

;; Exercise 2.22

;; Louis Reasoner tries to rewrite the first square-list procedure of exercise
;; 2.21 so that it evolves an iterative process:

;; (define (square-list items)
;;   (define (iter things answer)
;;     (if (null? things)
;;         answer
;;         (iter (cdr things)
;;               (cons (square (car things))
;;                     answer))))
;;         (iter items nil))

;; Unfortunately, defining square-list this way produces the answer list in the
;; reverse order of the one desired. Why?

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


#lang sicp

(define (square x)
    (* x x))

;; demo
(square 3)

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer)
        )
    )
  )

        (iter items nil)
)

;;  the << iter >> procedure is actually recursive.  its base case 
;;  does not return until the input list is exhausted, and this does not occur
;;  until the last item of the item is the answer


;; demo

(square-list (list 1 2 3 4))
