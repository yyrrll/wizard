(define (queens board-size)
  (define (queen-cols k)  
    (if (= k 0)
        (list empty-board)      ;; provide
        (filter
         (lambda (positions) (safe? k positions))   ;; provide safe?
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))  ;; provide adjoin-position
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))


; needed

- representation of sets of board positions
- 


In this procedure rest-of-queens is a way to place k - 1 queens in the first k
- 1 columns, and new-row is a proposed row in which to place the queen for the
kth column. 

Complete the program by 

- implementing the representation for sets of board positions 
    adjoin-position
        adjoins a new row-column position to a set of positions
    empty-board
        represents an empty set of positions. 

safe?
    determines for a set of positions, whether the queen in the kth column is safe
with respect to the others.

(Note that we need only check whether the new queen
is safe -- the other queens are already guaranteed safe with respect to each
other.)
