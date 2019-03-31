#!/usr/local/bin/racket

#lang racket

(provide deep-reverse)

(define (deep-reverse items)
  (cond ((null? items) items)
        ((not (pair? items)) items)
        (else (append (deep-reverse (cdr items))
                      (list (deep-reverse (car items)))))))


; take 4 was right approach, missed using list in reduction
;   - why is this usage the fix?
;   - why did I miss this?
