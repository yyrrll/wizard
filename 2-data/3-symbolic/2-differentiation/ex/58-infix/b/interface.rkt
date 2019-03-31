#lang racket

(require "../a/interface.rkt")

(provide 
    (all-defined-out)
    (all-from-out "../a/interface.rkt")
)

    ; redefine infix? for semi-standard
(define (infix? expr)
    (not (postfix? expr)))

    ; repeat definition of infix-product? to pick up local redefinition of infix?
(define (infix-product? expr)
    (and 
         (expression? expr)
         (infix? expr)
         (same-variable? (infix-operator expr) '*)
         ))

    ; redfine postfix-second-term to return list of remaining elements when longer than 1
(define (postfix-second-term expr)
    (let ((remaining (cddr expr)))
         (cond ((not (pair? remaining) )  remaining )
               ((= (length remaining) 1) (car remaining))
               (else (append (list (postfix-operator expr)) remaining)))))

    ; redfine infix-second-term to return list of remaining elements when longer than 1
(define (infix-second-term expr)
    (let ((remaining (cddr expr)))
         (cond ((not (pair? remaining) )  remaining )
               ((= (length remaining) 1) (car remaining))
               (else remaining))))

;   supporting arbitrary arguments to make-sum and make-product

    ;   see accumulate.rkt
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define operator postfix-operator)
(define first-term postfix-first-term)
(define second-term postfix-second-term)

(define (operator? expr)
    (or (eq? expr '+)
        (eq? expr '*)
        (eq? expr '**)))
    
(define (same-operator? op1 op2)
    (and (operator? op1) (operator? op2) (eq? op1 op2)))

    ; return only the terms of an expression
(define (terms-only expr)
    (list (first-term expr) (second-term expr)))
    
    ;   collapse nesting of common associative operations to single term
(define (consolidate terms)
    (if (not (expression? terms))
        terms
        (let (
              (op (operator terms))
              (arg1 (first-term terms))
              (remaining (second-term terms))
             )
             (cond 
                   ((and (not (expression? arg1)) (not (expression? remaining)))
                        (if (product? terms)
                            (make-product arg1 remaining)
                            (make-sum arg1 remaining)))
                   ((not (expression? remaining)) terms)
                   ((not (same-operator? op (operator remaining))) terms)
                   (else 
                        (append (list op arg1) (terms-only (consolidate remaining)))
                   )
             ))))


    ; redefine make-sum to handle arbitrary number of arguments
(define (make-sum . items)
    (let ((symbols (filter (lambda (x) (or (symbol? x) (pair? x))) items))
          (numeric (accumulate + 0 (filter number? items))))
         (cond  ((null? symbols) numeric)
                ((= numeric 0) 
                   (if (= (length symbols) 1) (car symbols)
                   (append (list '+ ) symbols)))
                (else (append (list '+ numeric) symbols)))))

    ; redefine make-product to handle arbitrary number of arguments
(define (make-product . items)
    (let ((symbols (filter (lambda (x) (or (symbol? x) (pair? x))) items))
          (numeric (accumulate * 1 (filter number? items))))
         (cond ((= numeric 0) 0)
               ((null? symbols) numeric)
               ((= numeric 1)
                   (if (= (length symbols) 1) (car symbols)
                   (append (list '*) symbols)))
               (else (append (list '* numeric) symbols)))))


    ; redefine from_infix for semi-standard notation
        ;   expressions no longer guaranteed to have only one operation

    ; take infix expression (constrained standard) and return postfix
        ; same definition as in ../interface.rkt, but must restate here to use redefined infix-second-term
(define (from-infix expr)
    (if (not (expression? expr))
        expr
        (let ((first-term (infix-first-term expr))
              (operator (infix-operator expr))
              (second-term (infix-second-term expr)))
              (if (infix-product? expr)
                    (cond
                        ((not (expression? second-term))
                            (consolidate (make-product first-term second-term)))
                        ((infix-sum? second-term)
                            (consolidate
                                (make-sum 
                                    (make-product first-term (infix-first-term second-term))
                                    (from-infix (infix-second-term second-term)))
                              )
                            )
                        (else
                            (consolidate (make-product first-term second-term))
                        )
                      )
                    (consolidate (make-sum first-term second-term))
                    )
                                
;-no-order-              (if (same-variable? operator '+)
;-no-order-                (consolidate (make-sum first-term second-term))
;-no-order-                (consolidate (make-product first-term second-term))
;-no-order-             )
        )
     )
    )
