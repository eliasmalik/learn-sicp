; Exercise 2.39.

; Complete the following definitions of reverse (exercise 2.18) in terms of
; fold-right and fold-left from exercise 2.38:

(define (reverse-r sequence)
  (fold-right (lambda (x y) (append y (list x))) '() sequence))
(define (reverse-l sequence)
  (fold-left (lambda (x y) (cons y x)) '() sequence))

(reverse-r (list 1 2 3 4))
(reverse-l (list 1 2 3 4))
