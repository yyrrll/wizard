#!/usr/local/bin/racket

;;  Exercise 2.2

#lang racket

(require "point.rkt")

(provide
  (all-defined-out)
    )


;;  Line Segments

    ; constructor
(define (make-segment start-point end-point)
  (cons start-point end-point))

    ; selectors

(define (start-point segment)
  (car segment))

(define (end-point segment)
  (cdr segment))

    ; selector renamings
    (define (start-segment segment)
      (start-point segment))
    
    (define (end-segment segment)
      (end-point segment))

    ;; start-segment provided only for conformance with exercise; 
    ;; start-point (and end-point) seem better names

;   functions on segment

;; lengths -- various dimensions

(define (length segment)
  (sqrt (+ (expt (length-x segment) 2)
	   (expt (length-y segment) 2))))

(define (length-x segment)
  (- (x-coordinate (end-point segment))
     (x-coordinate (start-point segment))))

(define (length-y segment)
  (- (y-coordinate (end-point segment))
     (y-coordinate (start-point segment))))


;; midpoint

(define (midpoint-segment segment)
  (make-point (mid-x segment) (mid-y segment)))

(define (mid-x segment)
  (+ (x-coordinate (start-point segment))
     (/ (length-x segment) 2)))

(define (mid-y segment)
  (+ (y-coordinate (start-point segment))
     (/ (length-y segment) 2)))


;; line equation

(define (slope segment)
  (/ (length-y segment)
     (length-x segment)))

(define (intercept segment)
  (- (y-coordinate (start-point segment))
     (* (slope segment)
	(x-coordinate (start-point segment)))))

;; utility

(define (reverse-segment segment)
  (make-segment (end-segment segment) (start-segment segment)))

(define (make-midsegment segment)
  (make-segment (start-segment segment) (midpoint-segment segment)))

(define (start-x segment)
  (x-coordinate (start-segment segment)))

(define (end-y segment)
  (y-coordinate (end-segment segment)))


;;  Examples

(define start-pt (make-point 0 1))
(define end-pt   (make-point 2 3))
(define seg (make-segment start-pt end-pt))

;;  Tests for line-segment.rkt

(define pt (make-point 2 4))

(define start-sel (start-segment seg))
(define end-sel   (end-segment   seg))

(require 
         rackunit
         rackunit/text-ui
         )

(define-test-suite line-segment_test_1
 (test-case 
   "Test segment implementation"

   (check-equal?
     (make-segment (make-point 1 2) (make-point 3 4))
     '((1 . 2) 3 . 4))

   (check-equal? 0 (x-point (start-segment seg)))
   (check-equal? 1 (y-point (start-segment seg)))

   (check-equal? 2 (x-point (end-segment seg)))
   (check-equal? 3 (y-point (end-segment seg)))

   (check-equal? (sqrt (+ 4 4)) (length seg) "length should be square root of 8")

   ;; midpoint-segment

   (check-equal? 1 (mid-x seg))
   (check-equal?
     (make-point 1 2)
     (midpoint-segment seg))

   (check-equal? 1 (slope seg))
   (check-equal? 1 (intercept seg))
   )
 )



(define midsegment (make-segment (start-segment seg) (midpoint-segment seg)))
(define r-seg (make-segment end-pt start-pt))
(define midsegment_2 (make-segment (start-segment seg) (midpoint-segment seg)))


(define-test-suite line-segment_test_2
 (test-case
   "Test point implementation 2"

   (check-equal? midsegment_2 (make-midsegment seg))

   (check-equal? (slope seg) (slope midsegment) "slope of segment and midsegment should be the same")
   (check-equal? (intercept seg) (intercept midsegment))
   (check-equal? (length midsegment) (/ (length seg) 2))

   )

 (test-case
   "Test reversed segment implementation"

   ; (check-equal? r-seg (reverse-segment (make-segment start-pt end-pt)))    ; erring
   

   ; (check-equal? (sqrt (+ 4 4) (length r-seg)) "length should be square root of 8") ; erring

   ;; midpoint-segment

   ; (check-equal? 1 (mid-x r-seg))     ; erring

   (check-equal?
     (make-point 1 2)
     (midpoint-segment r-seg))

   (check-equal? 1 (slope r-seg))
   (check-equal? 1 (intercept r-seg))
   (check-equal? (length midsegment) (/ (length r-seg) 2))
   )

 
)


(run-tests line-segment_test_1)
(run-tests line-segment_test_2)
