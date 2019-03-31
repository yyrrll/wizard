;; Is this really a recursive procedure?

;;  of-parity calls itself, but is it passing in state variables?

;;      I think not.  

;;          It doesn't carry an accumulated return value from call to call.
;;          -- the reduction step (eg, the << if >> clause checking parity ?) builds its list list with recursive calls on of-parity
;;          -- for any given element, the list of matches is:
;;              if matched, the pair of that item and the list of matches from the remaining items
;;              if not matched, the list of matches from the remaining items

#lang racket

(provide same-parity)

(define (of-parity parity items)
  (if (null? items)
      '()
      (if (= parity (modulo (car items) 2))
          (cons (car items) (of-parity parity (cdr items)))
          (of-parity parity (cdr items)))))

(define (same-parity . items)
    (let ((parity (modulo (car items) 2)))
        (of-parity parity items)))
