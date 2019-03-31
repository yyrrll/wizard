#lang racket

(require "../../57-args/interface.rkt")

(provide 
    (all-defined-out)
    (all-from-out "../../57-args/interface.rkt")
)

    ; test if object is an expression -- a list of of operators and terms
(define (expression? expr)
    (pair? expr))

    ; is expression in postfix notation?
(define (postfix? expr)
    (or (number? expr)
        (variable? expr)
        (same-variable? (car expr) '+)
        (same-variable? (car expr) '*)
        (same-variable? (car expr) '**)
        ))
 
    ; extract terms from postfix expression
(define (postfix-first-term expr)
    (cadr expr))

(define (postfix-second-term expr)
    (caddr expr))

(define (postfix-operator expr)
    (car expr))

        ; constrained standard: all expressions are enclosed by parentheses and have only one operation
    ; is expression in infix notation?
 (define (infix? expr)
    (and (not (postfix? expr))
         (= (length expr) 3)))

    ; extract terms from infix expression
(define (infix-first-term expr)
    (car expr))

(define (infix-second-term expr)
    (caddr expr))

(define (infix-operator expr)
    (cadr expr))

(define (infix-product? expr)
    (and 
         (expression? expr)
         (infix? expr)
         (same-variable? (infix-operator expr) '*)
         ))

(define (infix-sum? expr)
    (and 
         (expression? expr)
         (infix? expr)
         (same-variable? (infix-operator expr) '+)
         ))


    ; take infix expression (constrained standard) and return postfix
(define (from-infix expr)
    (if (not (expression? expr))
        expr
        (let ((first-term (from-infix (infix-first-term expr)))
              (second-term (from-infix (infix-second-term expr))))
              (if (infix-sum? expr)
                (make-sum first-term second-term)
                (make-product first-term second-term)))))

    ; take postfix expression and return infix
(define (to-infix expr)
    (if (not (expression? expr))
        expr
        (cond
            ((and (not (number? postfix-first-term))
                 (not (number? postfix-second-term)))
                (list 
                    (to-infix (postfix-first-term expr))
                    (postfix-operator expr)
                    (to-infix (postfix-second-term expr))))
            ((number? (postfix-first-term expr))
                (list 
                    (to-infix (postfix-first-term expr))
                    (postfix-operator expr)
                    (to-infix (postfix-second-term expr))))
            (else
                (list 
                    (to-infix (postfix-second-term expr))
                    (postfix-operator expr)
                    (to-infix (postfix-first-term expr)))
            )
                )))
