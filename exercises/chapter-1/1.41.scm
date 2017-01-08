; Exercise 1.41.

; Define a procedure double that takes a procedure of one argument as argument
; and returns a procedure that applies the original procedure twice. For
; example, if inc is a procedure that adds 1 to its argument, then (double inc)
; should be a procedure that adds 2. What value is returned by

; (((double (double double)) inc) 5)


(define (double f)
  (lambda (x) (f (f x))))

; Helper
(define (inc x) (+ 1 x))

; prints Value: 21
(((double (double double)) inc) 5)


; Explanation:
; (double double) returns a procedure that takes a unary procedure and applies
; it four times, i.e. it is the composition:
;
; ((double double) f) -> f(f(f(f(x))))
;
; (double (double double)) then applies a procedure that applies its input four
; times to itself; this results in a procedure that applies itself 16 times
