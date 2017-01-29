; Exercise 2.6.

; In case representing pairs as procedures wasn't mind-boggling enough, consider
; that, in a language that can manipulate procedures, we can get by without
; numbers (at least insofar as nonnegative integers are concerned) by
; implementing 0 and the operation of adding 1 as

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; This representation is known as Church numerals, after its inventor, Alonzo
; Church, the logician who invented the calculus.

; Define one and two directly (not in terms of zero and add-1). (Hint: Use
; substitution to evaluate (add-1 zero)). Give a direct definition of the
; addition procedure + (not in terms of repeated application of add-1).

(define (one f)
  (lambda (x) (f x)))

(define (two f)
  (lambda (x) (f (f x))))

; A number `n` is the n-fold composition of a function `f`
; Addition of numbers `m` and `n` gives (n+m)-fold composition of a function `f`

(define (add a b)
  (lambda (f) (lambda (x) ((b f) ((a f) x)))))

; (a f) -> unary function applying f to argument a times
; (b f) -> unary function applying f to argument b times

(define (inc n) (+ n 1))
(define three (add one two))

((one inc) 0)
((two inc) 0)
((three inc) 0)
