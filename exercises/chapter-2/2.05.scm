; Exercise 2.5.

; Show that we can represent pairs of nonnegative integers using only numbers
; and arithmetic operations if we represent the pair a and b as the integer that
; is the product 2^a * 3^b. Give the corresponding definitions of the procedures
; cons, car, and cdr.

;    p = 2^a * 3^b

; To find `a`, count how many times `p` can be divided by 2 before leaving a remainder
; To find `b`, count how many times `p` can be divided by 3 before leaving a remainder

; need expt procedure and recursive division counter procedure in terms of
; procedures + - * / only

(define (expt-basic base n)
  (define (iter x result)
    (if (= x 0)
        result
        (iter (- x 1) (* base result))))
  (iter n 1))

(define (count-divs-till-remainder n d)
  (define (divides? a b) (= 0 (remainder a b)))
  (define (iter x count)
    (if (divides? x d)
        (iter (/ x d) (+ 1 count))
        count))
  (iter n 0))

(define (nnint-cons a b) (* (expt-basic 2 a) (expt-basic 3 b)))
(define (nnint-car nnint) (count-divs-till-remainder nnint 2))
(define (nnint-cdr nnint) (count-divs-till-remainder nnint 3))

(define q (nnint-cons 2 5))
q
(nnint-car q)
(nnint-cdr q)
