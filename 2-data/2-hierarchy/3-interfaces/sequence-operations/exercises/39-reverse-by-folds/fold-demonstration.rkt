#!/usr/local/bin/racket

#lang racket

(require "../../../library-02-02-03.rkt")

(define fold-right accumulate)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

; test / demonstrate
(require rackunit)

;   subtraction operations

(check-equal?  (fold-right - 0 '(13 8 5 3 2)) 9)
(check-equal?  (fold-right - 2 '(13 8 5 3)) 9)
    ; in fold-right << initial >> is the last item passed to << op >>

    ; thus, moving element from start of sequence to << initial >> puts it at end of operations
(check-equal?  (fold-right - 13 '(8 5 3 2)) 17)
(check-equal?  (fold-right - 0 '(8 5 3 2 13)) 17)

(check-equal?  (fold-left - 0 '(13 8 5 3 2)) -31)
(check-equal?  (fold-left - -13 '(8 5 3 2)) -31)
    ; in fold-left, << initial >> is the first item passed to << op >>
    ;   nb: moving sequence first element to initial also requires sign change


; fold-right characteristics
    ; op on item and succession (?) of op on remaining items
    ; initial item is last argument passed in 
    ; sequence items are passed as arguments in sequence order

(check-equal?
  (fold-right - 0 '(13 8 5 3 2))
  (- 13 (- 8 (- 5 (- 3 (- 2 0)))))) ; or, (+ 13 -8 5 -3 (- 2 0)))

(check-equal?
  (fold-right - 2 '(13 8 5 3))
  (- 13 (- 8 (- 5 (- 3 2 ))))) ; or, (+ 13 -8 5 -3 2))

(check-equal?
  (fold-right - 13 '(8 5 3 2))
  (- 8 (- 5 (- 3 (- 2 13)))))

(check-equal?
  (fold-right - 6 '(1 3))
   (- 1 (- 3 6))) ; 4)

(check-equal?
  (fold-right - 6 '(1 3 2))
   (+ 2 -3 1 -6)) ; (- 2 (- 3 (- 1 6))) ; -6

; fold-left characteristics
    ; open on item and nesting of op on remaining items
    ; initial item is first argument passed in
    ; sequence items are passed in as arguments in  ??? order

(check-equal?
  (fold-left - 0 '(13 8 5 3 2))
  (- (- (- (- (- 0 13) 8) 5) 3) 2))

(check-equal?
  (fold-left - 0 '(0 13 8 5 3 2))
  (- (- (- (- (- (- 0 0) 13) 8) 5) 3) 2))

(check-equal?
  (fold-left - 6 '(1 3))
   (- (- 6 1) 3)) ; 2)

(check-equal?
  (fold-left - 6 '(3 1))
   2) ; (- (- 6 3) 1))


; other notions

(check-equal?
  (fold-left - 6 '(3 1 2))
   (+ 6 -3 -1 -2)) ; (- (- (- 6 3) 1) 2))



(check-equal?  (fold-right - 17 '(8 5 3 2)) 21)
(check-equal?
  (fold-right - 17 '(8 5 3 2))
  (- 8 (- 5 (- 3 (- 2 17)))))

; internals / examples
(check-equal?
  (fold-left - 0 '(13 8 5 3 2))
  (- (- (- (- (- 0 13) 8) 5) 3) 2))

(check-equal?
  (fold-left - 0 '(13 8 5 3 2))
  (+ -13 -8 -5 -3 -2 0))

; pattern detail for subtraction and fold-left
(check-equal?
  (fold-left - 0 '(13))
  (- 0 13))

(check-equal?
  (fold-left - 0 '(13 8 ))
  (- (- 0 13) 8))


; test cons

(check-equal?
  (fold-right cons '() '(1 2 3))
  '(1 2 3))

(check-equal?
  (fold-left cons '() '(1 2 3))
  '(((() . 1 ) . 2 ) . 3))
