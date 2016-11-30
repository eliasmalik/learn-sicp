; Exercise 1.7

; Dependencies
(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter test guess x)
  (if (test guess x)
      guess
      (sqrt-iter test (improve guess x)
                 x)))


; The good-enough? test used in computing square roots will not be very
; effective for finding the square roots of very small numbers. Also, in real
; computers, arithmetic operations are almost always performed with limited
; precision. This makes our test inadequate for very large numbers. Explain
; these statements, with examples showing how the test fails for small and large
; numbers. An alternative strategy for implementing good-enough? is to watch how
; guess changes from one iteration to the next and to stop when the change is a
; very small fraction of the guess. Design a square-root procedure that uses
; this kind of end test. Does this work better for small and large numbers?

; Original definition: good-enough0
(define (good-enough0 guess x)
  (< (abs (- (square guess) x)) 0.001))

;; Small numbers
; prints Value: .16004889...
; true square-root: 0.15811...
(sqrt-iter good-enough0 1 0.025)
; Not a million miles off

; prints Value: .03220324...
; true square-root: 0.0094868...
(sqrt-iter good-enough0 1 0.00009)
; Very inaccurate. This is because the value that we want to find the root of is
; smaller than the absolute tolerance of our iterative solver. Our specified
; tolerance (0.001) is the maximum accuracy of any solution that we could
; calculate. If the radicand is smaller than this, we have no hope of a good
; solution.

;; Large numbers
; TODO

;; Better test procedure
;; Using the first derivative of the guess
(define eps 0.001)

(define (good-enough1 g0 g1 x)
  (< (abs(- g0 g1)) (* eps g1)))

(define (sqrt-iter2 g0 g1 x)
  (if (good-enough1 g0 g1 x)
      g1
      (sqrt-iter2 g1
                  (improve g1 x)
                  x)))

;; Small numbers
; prints Value: 9.486833049684392e-3
; true square-root: 0.0094868...
(sqrt-iter2 0 1 0.00009)
; dead on!

;; Large numbers
; prints Value:
(sqrt-iter2 3330000 333000000 99999999999999999999999999999999999.0)
