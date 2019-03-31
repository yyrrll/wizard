(define (ordered-triples-sum n s)
   (filter (lambda (list) (= (accumulate + 0 list) s))
          (flatmap
           (lambda (i)
             (flatmap (lambda (j)
                  (map (lambda (k) (list i j k))
                       (enumerate-interval 1 (- j 1))))
                  (enumerate-interval 1 (- i 1))))
             (enumerate-interval 1 n))))
