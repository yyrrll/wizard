; Exercise 2.32.

#lang racket


(define (unite-given-possibles given possibles)
  (map (lambda (element)
         (append (list given) element))
       possibles))

(define (subsets s)         ; given
  (if (null? s)
      (list '())
      ;   (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map
                      (lambda (element)
                        (append (list (car s)) element))
                      rest)))))

(provide subsets)

; test

(require rackunit)

(check-equal?
 (subsets '(1 2 3))
 '(() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3)))
