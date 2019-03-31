;; http://community.schemewiki.org/?sicp-ex-2.27

;; most concise jz solution

;; differs from my approach -- does not seem to use recursive plan

#lang racket

(provide deep-reverse)

(define (deep-reverse x) 
  (if (pair? x) 
      (append (deep-reverse (cdr x))  
              (list (deep-reverse (car x)))) 
      x)) 
