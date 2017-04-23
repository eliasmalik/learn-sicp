; Exercise 2.33.

; Fill in the missing expressions to complete the following definitions of some
; basic list-manipulation operations as accumulations:

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))
(define (append seq1 seq2)
  (accumulate cons seq1 seq2))
(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))
