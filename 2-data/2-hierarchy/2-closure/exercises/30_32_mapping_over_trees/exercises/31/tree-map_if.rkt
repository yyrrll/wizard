#lang racket

(define (tree-map proc tree)
  (if (null? tree)
    '()
    (if (pair? tree)
        (cons (tree-map proc (car tree))
              (tree-map proc (cdr tree)))
        (proc tree))))


(provide tree-map)
