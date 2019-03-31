;;  http://community.schemewiki.org/?sicp-ex-2.27

;;  meteorgan solution

;;  similar to my efforts, in that seems to flow from a recursive plan


#lang racket

(provide deep-reverse)

(define (deep-reverse li) 
  (cond ((null? li) li)  
  ;; (cond ((null? li) '()) ;; original -- works
        ((not (pair? li)) li) 
        (else (append (deep-reverse (cdr li))  
                      (list (deep-reverse (car li))))))) 
