; Exercise 2.32.

#lang racket

(define (get-possibles-given binding)
  (let ((given binding))
    (lambda (possibles)
      (append (list given)
              (append possibles
                      (map (lambda (element)
                             (append (list given) element))
                           possibles))))))
;                      (map (lambda (element) 
;                             (append given element) possibles)))))))


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


; failing

;--------------------
;name:       check-equal?
;location:   subsets_32.rkt:33:0
;actual:     '(()
;  (3)
;  (2)
;  (2 3 (2 . 3))
;  (1)
;  (1 3 (1 . 3))
;  (1 2 (1 . 2))
;  (1 2 3 (2 . 3) (1 . 2) (1 . 3) (1 2 . 3)))
;expected:   '(() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
;--------------------