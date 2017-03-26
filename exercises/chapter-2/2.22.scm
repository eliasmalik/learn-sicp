; Exercise 2.22.

; Louis Reasoner tries to rewrite the first square-list procedure of exercise
; 2.21 so that it evolves an iterative process:

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items '()))

; Unfortunately, defining square-list this way produces the answer list in the
; reverse order of the one desired. Why?

; Because the cons operator adds the first parameter to the beginning of the
; list given as the second parameter. So as we iterate through the list we push
; elements onto the beginning of the list.

; Louis then tries to fix his bug by interchanging the arguments to cons:

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items '()))

; This doesn't work either. Explain.

; A list is defined as a cons structure where the left side is a value and the
; right side is a pointer to the next value/pointer cons-pair. The way cons is
; used here, the left side is a (empty) list and the right side is a value.
