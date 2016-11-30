; Exercise 1.8

; Dependencies
(define eps 0.001)

(define (good-enough g0 g1 x)
  (< (abs(- g0 g1)) (* eps g1)))

; Newton's method for cube roots is based on the fact that if y is an
; approximation to the cube root of x, then a better approximation is given by
; the value
; ((x/y^2) + 2*y)/3
; Use this formula to implement a cube-root procedure analogous to the square-
; root procedure.

(define (improve guess x)
  (/ (+ (* 2 guess)
        (/ x
           (square guess)))
     3))

(define (cbrt-iter g0 g1 x)
  (if (good-enough g0 g1 x)
      g1
      (cbrt-iter g1
                 (improve g1 x)
                 x)))


; prints Value: 2.00000...
; true cube-root: 2
(cbrt-iter 1 3 8.0)
