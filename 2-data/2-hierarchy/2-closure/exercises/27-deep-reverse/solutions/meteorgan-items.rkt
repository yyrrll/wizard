;;  http://community.schemewiki.org/?sicp-ex-2.27

;;  meteorgan solution

;;  similar to my efforts, in that seems to flow from a recursive plan

;;  same as meteorgan, but slight changes to match take 4:
;;      << li >> -> << items >>
;;      base case 1 returns items, not '()

#lang racket

(provide deep-reverse)

(define (deep-reverse items)
  (cond ((null? items) items)
        ((not (pair? items)) items)
        (else (append (deep-reverse (cdr items))
                      (list (deep-reverse (car items)))))))
