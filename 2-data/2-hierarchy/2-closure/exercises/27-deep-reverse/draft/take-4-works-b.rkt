#!/usr/local/bin/racket

;; Combines the two base cases into an << or >> (doable because they each return the argument)

#lang racket

(provide deep-reverse)

(define (deep-reverse items)
  (if (or (null? items)
          (not (pair? items)))
       items
       (append (deep-reverse (cdr items))
               (list (deep-reverse (car items))))))


;; can be further consolidated
;;      (pair? '()) -> #f
;;
;;      so, base case test can be (pair? items)
;;          only, reduce if _true_
;;          return base case default if _false_

;;      might be somewhat hard to see path from recursive plan to implementing code that way
