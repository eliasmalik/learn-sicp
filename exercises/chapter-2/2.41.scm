; Exercise 2.41.

; Write a procedure to find all ordered triples of distinct positive integers i,
; j, and k less than or equal to a given integer n that sum to a given integer s

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (flatten l)
  (fold-right append '() l))

(define (ordered-triples n)
  (flatten
    (flatten
      (map (lambda (i)
        (map (lambda (j)
          (map (lambda (k)
            (list i j k))
            (enumerate-interval j n)))
          (enumerate-interval i n)))
        (enumerate-interval 1 n))))
)

(define (sum-list l)
  (fold-right + 0 l))

(define (trips-that-sum-to k n)
  (filter
    (lambda (l) (= k (sum-list l)))
    (ordered-triples n))
)

(trips-that-sum-to 7 5)
