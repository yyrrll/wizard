;;  http://community.schemewiki.org/?sicp-ex-2.20

#lang racket

(provide same-parity)


(define (same-parity first . rest) 
   (define (same-parity-iter source dist remainder-val) 
     (if (null? source) 
         dist 
         (same-parity-iter (cdr source) 
                           (if (= (remainder (car source) 2) remainder-val) 
                               (append dist (list (car source))) 
                               dist) 
                           remainder-val))) 
    
   (same-parity-iter rest (list first) (remainder first 2))) 
