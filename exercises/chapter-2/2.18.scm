; Exercise 2.18.
; Define a procedure reverse that takes a list as argument and returns a list of
; the same elements in reverse order

(define (reverse ls)
  (if (null? ls)
      ls
      (append (reverse (cdr ls)) (list (car ls)))))

(reverse (list 1 2 3 4))
