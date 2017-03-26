; Exercise 2.17.
; Define a procedure last-pair that returns the list that contains only the last
; element of a given (nonempty) list

(define (last-pair ls)
  (if (null? (cdr ls))
      ls
      (last-pair (cdr ls))))

(define l1 (list 1 2 3 4 5))

(last-pair l1)
