#!/usr/local/bin/racket

#lang racket

(require 
         rackunit
         "../interface.rkt"
         "../procedures.rkt"
         "../trap-and-tail.rkt"
         )


(check-equal? (branch-weight trap-branch) 10)

(check-equal? (total-weight tail-mobile) 10)
(check-equal? (total-weight trap-and-tail) 20)


(check-equal? (torque trap-branch) 60)
(check-equal? (torque tail-branch) 20)

(check-equal? (balanced? trap-and-tail) #f)

(define x
  (make-mobile tail-branch tail-branch))


(check-equal? (balanced? x) #t)

(print "ran test-procedures.rkt")
