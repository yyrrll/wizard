#lang racket

(require "interface.rkt"
         "trap-and-tail.rkt")

(provide 
         balanced?
         branch-weight
         torque
         total-weight
         )


(define (total-weight mobile)
  (+
   (branch-weight (left-branch mobile))
   (branch-weight (right-branch mobile))))

(define (branch-weight branch)
  (let ((structure (branch-structure branch)))
    (if (not (pair? structure))
        structure
        (total-weight structure))))

(define (balanced? mobile)
  (= (torque (left-branch mobile))
         (torque (right-branch mobile))))
  
(define (torque branch)
  (* (branch-length branch)
     (branch-weight branch)))
