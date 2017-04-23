; Exercise 2.31.

; Abstract your answer to exercise 2.30 to produce a procedure tree-map with the
; property that square-tree could be defined as

(define (tree-map procedure tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (procedure tree))
        (else (cons (tree-map procedure (car tree))
                    (tree-map procedure (cdr tree))))))

(define (square-tree tree) (tree-map square tree))

; prints Value: (1 (4 (9 16) 25) (36 49))
(square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
