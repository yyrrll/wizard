rewrite template to abstract inner procedures to functions?
- really, cannot -- the inner procedures rely on local scope


; (define (queens board-size)
;   (define (queen-cols k)  
;     (if (= k 0)
;         (list empty-board)      ;; provide
;         (filter
;          (lambda (positions) (safe? k positions))   ;; provide safe?
;          (flatmap
;           (lambda (rest-of-queens)
;             (map (lambda (new-row)
;                    (adjoin-position new-row k rest-of-queens))  ;; provide adjoin-position
;                  (enumerate-interval 1 board-size)))
;           (queen-cols (- k 1))))))
;   (queen-cols board-size))


(define (prior-positions)
  (


(define (queen-cols k)  
  (if (= k 0)
      (list empty-board)      ;; provide
      (filter
       (lambda (positions) (safe? k positions))   ;; provide safe?
       (prior-positions

       (flatmap
        (lambda (rest-of-queens)
          (map (lambda (new-row)
                 (adjoin-position new-row k rest-of-queens))  ;; provide adjoin-position
               (enumerate-interval 1 board-size)))
        (queen-cols (- k 1)))
       )))

(define (queens board-size)
  (queen-cols board-size))

