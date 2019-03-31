;   Exercise 2.29 

#lang racket

(require "interface.rkt")

(provide 
 from-branch-components
 from-primitives
 left-scale-branch left-scale-rod left-scale-weight
 right-scale-branch right-scale-rod right-scale-weight
 tail-branch tail-mobile tail-rod
 trap-and-tail
 trap-branch trap-rod trap-weight
 )

; Mobile with a weight (a lobster trap) on the left side and a mobile (of a
; lobster tail) on the right

;  Trap Side -- left side of main mobile -- trap-branch
(define trap-rod 6)
(define trap-weight 10)

;; trap-branch -- branch of top mobile holding weight
(define trap-branch
  (make-branch trap-rod trap-weight))

    ; Tail side -- right side of main mobile -- tail-branch

; Left Scale (nested mobile)
(define left-scale-rod 2)
(define left-scale-weight 6)
(define left-scale-branch
  (make-branch left-scale-rod left-scale-weight))

; Right Scale (nested mobile)
(define right-scale-rod 1)
(define right-scale-weight 4)
(define right-scale-branch
  (make-branch right-scale-rod right-scale-weight))

; tail-mobile -- Mobile of Left-Scale and Right-Scale
(define tail-rod 2)
(define tail-mobile
  (make-mobile left-scale-branch right-scale-branch))

;   tail-branch -- top mobile branch holding tail-mobile
(define tail-branch
  (make-branch tail-rod tail-mobile))

; The Mobile: Tail-And-Trap
(define trap-and-tail
  (make-mobile trap-branch tail-branch))


;;  Directly
(define from-primitives
  (make-mobile
   (make-branch 6 10)
   (make-branch 2 (make-mobile
                   (make-branch 2 6)
                   (make-branch 1 4)))))

(define from-branch-components
  (make-mobile
   (make-branch trap-rod trap-weight)
   (make-branch tail-rod (make-mobile
                          (make-branch left-scale-rod left-scale-weight)
                          (make-branch right-scale-rod right-scale-weight)))))
