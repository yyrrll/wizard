#lang racket

;; 1.2.2

;; count-change:
;;   - count the number of ways to make an amount using available coins
;;
;;   See tests for examples

;; How many dif- ferent ways can we make change of $1.00, given half-dollars, quarters, dimes, nickels, and pennies? More generally, can we write a procedure to compute the number of ways to change any given amount of money?

;; the number of ways to change amount a using n kinds of coins equals
;;      ;; reductive step?
;;  • the number of ways to change amount a using all but the first kind of coin, plus
;;      ;; base case?
;;  • the number of ways to change amount a − d using all n kinds of coins, where d is the denomination of the first kind of coin.

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0)
             (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1)  1)       ;; penny
        ((= kinds-of-coins 2)  5)       ;; nickel
        ((= kinds-of-coins 3) 10)       ;; dime
        ((= kinds-of-coins 4) 25)       ;; quarter
        ((= kinds-of-coins 5) 50)))     ;; half-dollar

; tests

(require rackunit)

; test << count-change >>

;; make amounts with all available denominations

;; $0.11
(check-equal? (count-change 11) 4)

; $1.00
(check-equal? (count-change 100) 292)

;   test << cc >>

;; ways for $0.01 with nickels and pennies
(check-equal? (cc 1 1) 1)

;; ways for $0.04 with nickels and pennies
(check-equal? (cc 4 1) 1)

;; ways for $0.05 with nickels and pennies
(check-equal? (cc 5 2) 2)

;; ways for $0.06 with pennies
(check-equal? (cc 6 1) 1)

;; ways for $0.06 with nickels and pennies
(check-equal? (cc 6 2) 2)

;; ways for $0.10 with nickels, dimes and pennies
(check-equal? (cc 10 5) 4)

;; ways for $0.11 with nickels, dimes and pennies
(check-equal? (cc 11 5) 4)

;; ways for 11 without half-dollar or quarter
(check-equal? (cc 11 3) 4)

;; ways for 11 without a dime
(check-equal?  (cc 11 2) 3)

;; ways for 11 - pennies only
(check-equal? (cc 11 1) 1)




(check-equal? (first-denomination 1)  1)
(check-equal? (first-denomination 2)  5)
(check-equal? (first-denomination 3) 10)
(check-equal? (first-denomination 4) 25)
(check-equal? (first-denomination 5) 50)

(check-equal? (cc 11 5) 4)
(check-equal? (cc 11 3) 4)
(check-equal? (cc 11 2) 3)
(check-equal? (cc 1 3) 1)
(check-equal? (cc 11 1) 1)
(check-equal? (cc 6 2) 2)

(check-equal? (count-change 100) 292)
(check-equal? (count-change 11) 4)


(provide count-change
         cc
         first-denomination)



