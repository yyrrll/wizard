#lang racket

;   draft algorithms, increasing order of elegance

(provide
  (all-defined-out))

(define (is-symbol? obj)
  (not (pair? obj)))


; explicit return #t when conditions satisified
;   works, but ugly
(define (df1-equal? a b)
  (cond ((and
           (is-symbol? a)
           (is-symbol? b)
           (eq? a b)) #t)
        ((and
           (pair? a)
           (pair? b)
           (and
             (equal? (car a) (car b))
             (equal? (cdr a) (cdr b)))) #t)
        (else #f))
  )


; return the evaluation of the conditions
;   -   remove explicit return of #t

; logic branching with << if >>
(define (branch-with-if-equal? a b)
  (if
    (and
       (is-symbol? a) (is-symbol? b))
    (eq? a b)
    (if
        (and
           (pair? a)
           (pair? b))
        (and
          (equal? (car a) (car b))
          (equal? (cdr a) (cdr b)))
        #f)
  )
)


;   logic branching with << cond >>
;   - branching more clear than with << if >>
;   - but, still explicitly returns #f -- ugly
(define (branch-with-cond-equal? a b)
  (cond
    ((and
       (is-symbol? a)
       (is-symbol? b))
     (eq? a b))
    ((and
       (pair? a)
       (pair? b))
     (and
       (equal? (car a) (car b))
       (equal? (cdr a) (cdr b))))
    (else #f)
  )
)


;   simply lists conditions to be true at all steps
;   - no branching, uses << or >>, << and >>
;   - best
(define (equal? a b)
  (or
    (and        ; a and b both symbols, and have the same value
      (is-symbol? a)
      (is-symbol? b)
      (eq? a b))
    (and        ; a and b both lists, and with equal items in the same order
       (pair? a)
       (pair? b)
       (equal? (car a) (car b))
       (equal? (cdr a) (cdr b)))
    )
)
