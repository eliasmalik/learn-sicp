; Exercise 1.16.

; Design a procedure that evolves an iterative exponentiation process that uses
; successive squaring and uses a logarithmic number of steps, as does fast-expt.
; (Hint: Using the observation that (b^(n/2))2 = (b^2)^(n/2), keep, along with
; the exponent n and the base b, an additional state variable a, and define the
; state transformation in such a way that the product a*b^n is unchanged from
; state to state. At the beginning of the process a is taken to be 1, and the
; answer is given by the value of a at the end of the process. In general, the
; technique of defining an invariant quantity that remains unchanged from state
; to state is a powerful way to think about the design of iterative algorithms.)


(define (fast-expt-iter base exponent)
  (define (even n) (= (remainder n 2) 0))
  (define (decr n) (- n 1))
  (define (halve n) (/ n 2))
  (define (fe-iter b n a)
    (cond ((= n 0) a)
          ((even n) (fe-iter (square b) (halve n)         a))
          (else     (fe-iter (square b) (halve (decr n))  (* a b)))
    ))
  (fe-iter base exponent 1))

; prints Value: 1
(fast-expt-iter 2 0)

; prints Value: 16
(fast-expt-iter 4 2)

; prints Value: 1024
(fast-expt-iter 2 10)

; prints Value: 59049
(fast-expt-iter 3 10)
