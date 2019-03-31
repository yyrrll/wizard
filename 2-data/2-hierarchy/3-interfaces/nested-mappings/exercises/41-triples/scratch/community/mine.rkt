(define (ordered-triples-sum n s)
  (flatmap
   (lambda (i)
     (flatmap
      (lambda (j)
        (list (append (list i) j)))
      (flatmap
       (lambda (k)
         (list (list k (- (- s i) k))))
       (enumerate-interval (+ i 1)  (/ (- (- s i) 1) 2)))))
   (enumerate-interval 1 (- n 1))))
