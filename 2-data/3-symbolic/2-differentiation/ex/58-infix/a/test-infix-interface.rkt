#!/usr/local/bin/racket

#lang racket

(require
  "interface.rkt"
  rackunit
  )
 
    ; test expressions
(check-true (infix-sum? '(x + (y * z))))
(check-true (infix-product? '(x * (y + z))))

(check-true (postfix? 3))
(check-true (postfix? 'x))

(check-true (postfix? '(+ 4 5)))
(check-false (infix? '(+ 4 5)))

(check-true (postfix? '(* 4 5)))
(check-false (infix? '(* 4 5)))

(check-true (postfix? '(** 4 5)))
(check-false (infix? '(** 4 5)))

(check-true  (infix?   '(x + (3 * (x + (y + 2))))))
(check-false (postfix? '(x + (3 * (x + (y + 2))))))

    ; terms and operators

        ;   postfix
(check-equal? (postfix-first-term '(+ 3 x)) 3)
(check-equal? (postfix-second-term '(+ 3 x)) 'x)
(check-equal? (postfix-operator '(+ 3 x)) '+)

        ; infix
(check-equal? (infix-first-term '(3 + x)) 3)
(check-equal? (infix-second-term '(3 + x)) 'x)
(check-equal? (infix-operator '(3 + x)) '+)

    ; from-infix
(check-equal? (from-infix '(3 + 4)) 7)
(check-equal? (from-infix '(3 * 4)) 12)

(check-equal? (from-infix '(3 + x)) '(+ 3 x))
(check-equal? (from-infix '(y + x)) '(+ y x))

(check-equal? (from-infix '(3 * x)) '(* 3 x))
(check-equal? (from-infix '(y * x)) '(* y x))

(check-equal? 
    (from-infix '(x + (3 * (x + (y + 2)))))
    '(+ x (* 3 (+ x (+ y 2)))))


    ; to-infix
(check-equal? (to-infix '(+ 3 x)) '(3 + x))

(check-equal? (to-infix '(+ y x)) '(y + x)) 
(check-equal? (to-infix '(* 3 x)) '(3 * x))
(check-equal? (to-infix '(* y x)) '(y * x))

(check-equal? (to-infix '(+ 3 4)) '(3 + 4))
(check-equal? (to-infix '(3 * 4)) '(* 3 4))
