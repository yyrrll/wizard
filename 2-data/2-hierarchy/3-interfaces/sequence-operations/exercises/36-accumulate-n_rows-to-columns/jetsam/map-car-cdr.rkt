#lang racket

(require rackunit)

; demonstrate map of car, cdr

;   TODO: move to section on map operations

(check-equal?
  (map
    car
    '(
      (   1   2   3 )
      (  10  20  30 )
      ( 100 200 300 )
      )
    )
     '(   1  10 100)
     )


(check-equal?
  (map
    cdr
    '(
      (   1   2   3 )
      (  10  20  30 )
      ( 100 200 300 )
      )
    )
     '(
       (   2   3 )
       (  20  30 )
       ( 200 300 )
       )
     )

