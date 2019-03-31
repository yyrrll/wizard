; reformatting and annotation of given function template
;   motivation: understand interface and return requirements of missing pieces

(define (queens board-size)
  ; return "8 queens" solutions for a given board size

  ; =_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_
  ; todo: provide these

  (define (safe? k positions)
    (void))
  (define (adjoin-position new-row k rest-of-queens)
    (void))
  (define empty-board
    (void)
    ; (define empty-board '(()))   ; guess
  ; =_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_=_
  (define (queen-cols k)
    ; get solutions for board size k
    ; << k >> : integer representing number of columns of board
    ;   motivation: helper for << queens >>, called to provide solution
        ; ? why not implement directly, rather than define within? interface is the same
        ;   -- perhaps hint to define missing items within queens scope

    (if (= k 0)
        ; ====================================================================
        ; base case -- if no columns, return empty board
        (list empty-board)      ;; provide << empty-board >>
            ; << empty-board >> represents an empty set of positions
                ; guess: '(()) -- list of empty list
                ; nb: "position" is location of a queen on the board
                ; a set of "positions" comprise a "proposed solution"
                ; "solution": a set of positions wherein all queens are safe
        ; ====================================================================
        ; reduction step
            ; for board size k, solution is the set of solutions for k - 1, each extended to add positions of a queen in the kth column where the queen is safe
                ; nb: extended -- for a set of positions, creation of valid sets of positions including the kth column
                ;   - extension of a set can lead to several sets

            ; column terms (vs "board")
                ; for the kth column, the solution set is the set of possible solutions for the k-1 column, each extended to add solutions for the kth column

        (filter
          ; -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
          ; predicate
          ;     removes kth position permutations where queen is not safe

          (lambda (positions) (safe? k positions))   ;; provide << safe? >>
                ; << safe? >>   (provide)
                ;   "determines for a set of positions, whether the queen in
                ;   the kth column is safe with respect to the others"

                        ; weird -- << safe? takes << k >> and << positions >>, but not a queen position
                        ;   - implies that the queen position to be checked is in the kth column
                        ;       - new queen positions must be added to << positions >> before filter (duh, given)
                        ;       - << k >> would serve to limit checks to that column
                        ;           ? --> positions must include some indexing by column ?

                ;   << positions >> -- ? 
                ;       set of positions, including queens through k -1, and
                ;       k; only need check k queen 
                ;       - implies << positions >> is a k - 1 solution, plus the
                ;         position of the kth queen

                ;   nb: using lambda to bind local (? terminology ?) value of k
                ;   to function

          ; -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
          ; filter sequence
          ;     list of positions, for each possible solution for k - 1, with
          ;     the kth queen placed in every new position made available by
          ;     the kth column  (TODO -- fix wording) -- these include positions
          ;     where kth queen is in check
          
          ;     must generate, for each possible solution, a set that
          ;     solution's positions plus each of the possible positions of the
          ;     kth queen
          ;     - for each prior solution, there will be eight new positions

          ;     could go as high as 8^8 -- 16.7mm

          ;     printf "%'d" $(echo "8 ^ 8" | bc)
          ;         16,777,216

          (flatmap
            ;   will map addition of new positions to prior solutions
            ;       to be filtered above
            ; --=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=-
            ; flatmap proc
            (lambda (rest-of-queens)
            ;       maps function returning possible positions for kth queen,
            ;       by file / column and rank / row, over sequence of 1 to
            ;       number of columns in board size
            ;       -- further -- _addition_ of those possible solutions to the prior solutions
            ;       
            ;       flatmap'ed procedure will take those positions
            ;
            ;       meaning, generates the eight possible positions of the kth
            ;       queen in kth column / file, one for each row / rank
            ;       - positions will be aware of file and rank
            ;
            ; << rest-of-queens >> -- prior solutions? -- NO -- just new
            ; possibles -- to be adjoined to those solutions and then filtered
            ; above

            ;       design: define << rest-of-queens >> in local scope, then call here?
            ;       - note -- need value of k, board-size
            ;       - if abstracting to local, must pass these in, and use lambda here to bind local values

              (map
                    ; this map generates list of positions for kth column
                ; ---=---=---=---=---=---=---=---=---=---=---=---=---=---=---=
                ; map proc
                (lambda (new-row)
                  (adjoin-position new-row k rest-of-queens)
                  )  ;; provide << adjoin-position >>
                        ; "adjoins new row-column position to a set of
                        ; positions"

                        ;   positions --> _solutions_ for k - 1 ?

                     ; << new-row >> ?
                     ;      apparently, adding a position, for a given row, for
                     ;      the local-scoped k
                     ;
                     ;      this implies that here procedure adds a particular square?
                     ;      - duh, stated in problem

                     ;  CONFUSED -- << new-row >> is passed to lambda, and i think i must generate for 8 rows
                     ;      lambda gets a new-row (presumably, 1-8) and adjoins a queen position for that row and the current column to the positions given
                     ;      maybe board _is_ square?
                     ;  but, sequence passed to lambda is interval from 1 to board size -- 2, 3, 4
                        ; BUT this is not position generation -- the mapped function is calling adjoin-position

                ; ---=---=---=---=---=---=---=---=---=---=---=---=---=---=---=
                ; map sequence

                (enumerate-interval 1 board-size)

                ;   board sizes from 1 through top (in solution, 8)
                ;       - meaning / use: provides sequence of board sizes to generate
                ;   provides integer values for k (yes?)
                ; ---=---=---=---=---=---=---=---=---=---=---=---=---=---=---=
                )
              )
            ; --=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=-
            ; flatmap sequence
            (queen-cols (- k 1))
            ;   list of solutions for k - 1
            ;       recursive processing will call this down to base case, then
            ;       propagate solutions up through evaluation of the nested
            ;       calls   (WORDING)

            ; --=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=-
            )
          ; -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
          )
        ; ====================================================================
        )
    )
  (queen-cols board-size)
  )

; given board-size, return set of solutions
;   NB: "board-size" is number of columns / files
;       always has 8 rows / ranks

;   size 1
;       1 queen
;       8 solutions

;   size 2
;       2 queens
;       42 solutions



; queen-cols
;   takes 
;       queen-cols
;           ? set of solutions for k - 1 ?
;       k
;           number of queens

;   base case
;       k = 0 -- no queens
;           returns empty-board (why?)
;   
;   reduction step
;       filter 
;           predicate -- takes << positions >>
;           calls << safe? >> on k and << positions >>
;               "determines for a set of positions, whether the queen in the
;               kth column is safe with respect to the others
;
;           ??? "queen in kth column" ??? 
;               checking a position's safety requires file and rank
;               if only value is k (an integer (? yes ?), how to check?
;
;               could mean, positions passed to safe include positions of
;               queens through k - 1; these would not need to be checked (per
;               the plan logic)

