; Exercise 1.46.

; Several of the numerical methods described in this chapter are instances of an
; extremely general computational strategy known as iterative improvement.
; Iterative improvement says that, to compute something, we start with an
; initial guess for the answer, test if the guess is good enough, and otherwise
; improve the guess and continue the process using the improved guess as the new
; guess. Write a procedure iterative-improve that takes two procedures as
; arguments: a method for telling whether a guess is good enough and a method
; for improving a guess. Iterative-improve should return as its value a
; procedure that takes a guess as argument and keeps improving the guess until
; it is good enough. Rewrite the sqrt procedure of section 1.1.7 and the
; fixed-point procedure of section 1.3.3 in terms of iterative-improve.

(define (iterative-improve good-enough? improve)
  (lambda (guess) (if (good-enough? guess (improve guess))
                      (improve guess)
                      ((iterative-improve good-enough? improve) (improve guess)))))

(define (average x y)
 (/ (+ x y) 2))

(define (relative-tolerance a b)
  (let ((tol 1.e-4))
       (< (/ (abs (- a b)) b) tol)))

(define (sqrt-iter x)
  ((iterative-improve relative-tolerance
                      (lambda (y) (average y (/ x y))))
   1.0))

(define (fixed-point f first-guess)
  ((iterative-improve relative-tolerance
                      f)
   first-guess))


(sqrt-iter 4)
(sqrt-iter 256)

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
