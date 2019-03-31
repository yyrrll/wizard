#lang racket

; craft, validate lambda to append given to a list of possibles

(define (unite-given-possibles given possibles)
  (map (lambda (element)
         (append (list given) element))
       possibles))

(require rackunit)

(check-equal?
 (unite-given-possibles 3 '(()))
 '((3)))

(check-equal?
 (unite-given-possibles 2 '(() (3)))
 '((2) (2 3)))

(check-equal?
 (unite-given-possibles 1 '(() (2) (3) (2 3)))
 '((1) (1 2) (1 3) (1 2 3)))


;; demonstrate lambda usage without wrapping in defined procedure

(check-equal?
 (map (lambda (element)
        (append (list 1) element))
      '(() (2) (3) (2 3)))
 '((1) (1 2) (1 3) (1 2 3)))
