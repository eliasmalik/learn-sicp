; Exercise 2.37.

; Suppose we represent vectors v = (vi) as sequences of numbers, and matrices
; m = (mij) as sequences of vectors (the rows of the matrix). For example, the
; matrix

; [ 1 2 3 4 ]
; | 4 5 6 6 |
; [ 6 7 8 9 ]

; is represented as the sequence ((1 2 3 4) (4 5 6 6) (6 7 8 9)). With this
; representation, we can use sequence operations to concisely express the basic
; matrix and vector operations. These operations (which are described in any
; book on matrix algebra) are the following:

; (dot-product v w)     returns the scalar s, where s    = \sigma_i { v_i  w_i }
; (matrix-*-vector m v) returns the vector t, where t_i  = \sigma_j { m_ij v_j }
; (matrix-*-matrix m n) returns the matrix p, where p_ij = \sigma_k { m_ik n_kj }
; (transpose m)         returns the matrix n, where n_ij = m_ji

; We can define the dot product as17

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

; Fill in the missing expressions in the following procedures for computing the
; other matrix operations. (The procedure accumulate-n is defined in exercise
; 2.36.)

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))
(define (transpose mat)
  (accumulate-n cons '() mat))
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x)) m)))

(define v (list 1 (- 1) 0))
(define m (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
(define n (list (list 1 0 0) (list 0 1 0) (list 0 0 1)))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

; prints Value: 2
(dot-product v v)

; prints Value: (1 -1 0)
(matrix-*-vector n v)

; prints Value: (-1 -1 -1)
(matrix-*-vector m v)

; prints Value: ((1 4 7) (2 5 8) (3 6 9))
(transpose m)

; prints Value: ((1 2 3) (4 5 6) (7 8 9))
(matrix-*-matrix m n)
(matrix-*-matrix n m)
