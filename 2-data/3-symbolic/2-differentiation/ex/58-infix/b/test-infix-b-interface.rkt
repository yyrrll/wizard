#!/usr/local/bin/racket

#lang racket

(require
  "interface.rkt"
  rackunit
  )

    ; tests
(check-true (infix? '(x * y + z)))
(check-true (infix-product? '(x * y + z)))

    ; test make-sum with arbitrary arguments
(check-equal? (make-sum 1 2 3) 6)
(check-equal? (make-sum 'x 'y 'z) '(+ x y z))
(check-equal? (make-sum 0 'x 'y 'z) '(+ x y z))
(check-equal? (make-sum 1 'x 'y 'z) '(+ 1 x y z))
(check-equal? (make-sum 1 'x '(* y z)) '(+ 1 x (* y z)))

    ; test make-product with arbitrary arguments
(check-equal? (make-product 1 2 3) 6)
(check-equal? (make-product 'x 'y 'z) '(* x y z))
(check-equal? (make-product 0 'x 'y 'z) 0)
(check-equal? (make-product 1 'x 'y 'z) '(* x y z))
(check-equal? (make-product 2 'x 'y 'z) '(* 2 x y z))
(check-equal? (make-product 1 'x '(* y z)) '(* x (* y z)))

    ; second-term
(check-equal? 
    (infix-second-term '(x + 3 * (x + y +2)))
    '(3 * (x + y +2)))

(check-equal?
    (postfix-second-term '(+ 1 x (* y z)))
    '(+ x (* y z)))

(check-equal?
    (postfix-second-term '(+ 1 x (* y z i)))
    '(+ x (* y z i)))

(check-equal? (postfix-second-term '(+ x y)) 'y)        ; duplicative test?

    ;   operator?
(check-true (operator? '+))
(check-true (operator? '*))
(check-true (operator? '**))

(check-false (operator? 3))
(check-false (operator? 'x))
(check-false (operator? '(+ y x)))

    ; same-operator?

(check-true (same-operator? '+ '+))
(check-false (same-operator? '* '+))

    ;   terms
(check-equal? (terms-only '(+ x y)) '(x y))
(check-equal? (terms-only '(+ x (* y z))) '(x (* y z)))

    ; consolidate operations

(check-equal? (consolidate 1) 1)
(check-equal? (consolidate '(+ 1 2)) 3)

(check-equal? (consolidate '(+ y z)) '(+ y z))
(check-equal? (terms-only (consolidate '(+ y z))) '( y z))

(check-equal?
    (consolidate '(+ x (+ y z)))
    '(+ x y z))

(check-equal?
    (consolidate '(* x (* y z)))
    '(* x y z))

(check-equal?
    (consolidate '(+ x (* y z)))
    '(+ x (* y z)))


    ; from-infix

(check-equal?
    (from-infix '(x + y + 2))
    '(+ x 2 y))
    ; '(+ x 2 y))

(check-equal?
    (from-infix '(x + y + z))
    '(+ x y z))

        ;   order of operations

(check-equal?
    (from-infix '(x + y * z))
    '(+ x (* y z)))

(check-equal?
    (from-infix '(x * y + z))
    '(+ (* y z) x))

;   TODO
;--td--(check-equal?
;--td--    (from-infix '(x + 3 * (x + y + 2)))
;--td--    '(+ x (* 3 x) (* 3 y) 6)    ; (x + 3x + 3y + 6)


;---;_td_   TODO -- simplify nested additions
;---;_td_(check-equal? (make-sum 1 'x '(+ y z)) '(+ 1 x y z))
