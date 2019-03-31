; Exercise 2.32.
; 
; Complete the following definition of a procedure that generates the set of
; subsets of a set and give a clear explanation of why it works:

#lang racket

(define (get-possibles-given binding)
  (let ((given binding))
    ((define (unite element)
       (append (list given) element))
     (define (possibles-given possibles)
       (append (list given)
               (append possibles
                       (map unite possibles))))
     possibles-given)))

    ; syntax / pattern for procedure returning a procedure?



; must define (append) ?


(define (subsets s)         ; given
  (if (null? s)
      (list '())
        ;   (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (get-possibles-given (car s)) rest)))))
        ; (append rest (map <??> rest)))))


(provide subsets)

; target -- not passing

(require rackunit)

(check-equal?
    (subsets '(1 2 3))
    '(() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3)))

; FAIL

; "define: not allowed in an expression context in: (define (unite element) (append (list given) element))"