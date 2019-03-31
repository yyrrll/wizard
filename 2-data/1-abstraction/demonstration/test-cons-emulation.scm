;;  SICP emulation of cons, car, cdr

(load "exercises/test-manager/load.scm")
(load "cons-emulation.scm")

(in-test-group
 cons-emulation

 (define-test (basic)
   "Document workings of the cons emulation"

   (define ex1 (cons-em 2 3))
   (define ex2 (cons-em 4 5))

   (check (= (ex1 0)))
   (check (= (ex1 1)))

   (check (= 4 (ex2 0)))
   (check (= 5 (ex2 1)))

   (check (= 2 (car-em ex1)))
   (check (= 3 (cdr-em ex1)))

   (check (= 4 (car-em ex2)))
   (check (= 5 (cdr-em ex2)))

   )
 )

(run-test '(cons-emulation))


;; ex1 is a particular << dispatch >> procedure, bound to x = 2 and y = 3
;; ex2 is a different particular << dispatch >> procedure, bound to different values

;; (ex1 0) runs the particular dispatch procedure, passing 0 as the << m >> argument to the dispatch procedure, which uses it in its body to decide whether to return its (bound) x value or (bound) y value

;; the definition of << car-em >> is simply a wrapper around this behavior.  It takes the bound dispatch object (eg, ex1) and calls it, passing it 0 as the m argument.

;; this is only possible because Scheme treats procedures as "first class objects" (nomenclature?), as discussed in chapter 1
