; Exercise 1.18.

; Using the results of exercises 1.16 and 1.17, devise a procedure that
; generates an iterative process for multiplying two integers in terms of
; adding, doubling, and halving and uses a logarithmic number of steps.


; Again, assuming the following functions are provided by the language
(define (double n) (* 2 n))
(define (halve n) (/ n 2))

; The iterative process can be written as
(define (*-iter a b)
  (define (even n) (= (remainder n 2) 0))
  (define (decr n) (- n 1))
  (define (** a b c)
    (cond ((= b 0) c)
          ((even b) (** (double a) (halve b) c))
          (else (** a (decr b) (+ c a)))))
  (** a b 0))

; prints Value: 4
(*-iter 2 2)

; prints Value: 72
(*-iter 4 18)

; prints Value: 20
(*-iter 1 20)
