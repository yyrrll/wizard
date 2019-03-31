#lang racket

(provide not-null?)

(require rackunit)

(define (not-null? item)
  (not (null? item)))

(check-equal?
  (not-null? '(1))
  #t)

(check-equal?
  (not-null? '())
  #f)


; move to filter examples
(check-equal?
  (filter
    not-null?
  '((1 7)
    (2 6)
    (3 5)
    () () () () ()
    )
  )
  '((1 7)
    (2 6)
    (3 5))
  )


