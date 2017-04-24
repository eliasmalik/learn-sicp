; Exercise 2.38.

; The accumulate procedure is also known as fold-right, because it combines the
; first element of the sequence with the result of combining all the elements to
; the right. There is also a fold-left, which is similar to fold-right, except
; that it combines elements working in the opposite direction:

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

; What are the values of

(fold-right / 1 (list 1 2 3))
; (/ (/ (/ 3 1) 2) 1) = 3/2

(fold-left / 1 (list 1 2 3))
; (/ (/ (/ 1 1) 2) 3) = 1/6

(fold-right list (list ) (list 1 2 3))
; (1 (2 (3 ())))

(fold-left list (list ) (list 1 2 3))
; (((() 1) 2) 3)

; Give a property that op should satisfy to guarantee that fold-right and
; fold-left will produce the same values for any sequence.

; Operator must be abelian, in the sense that (op A B) = (op B A) must be true.
