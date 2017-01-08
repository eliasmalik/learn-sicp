; Exercise 1.45.

; We saw in section 1.3.3 that attempting to compute square roots by naively
; finding a fixed point of y -> x/y does not converge, and that this can be fixed
; by average damping. The same method works for finding cube roots as fixed
; points of the average-damped y -> x/y^2. Unfortunately, the process does not
; work for fourth roots -- a single average damp is not enough to make a fixed-
; point search for y -> x/y^3 converge. On the other hand, if we average damp
; twice (i.e. use the average damp of the average damp of y -> x/y^3) the fixed-
; point search does converge. Do some experiments to determine how many average
; damps are required to compute nth roots as a fixed-point search based upon
; repeated average damping of y -> x/y^n-1. Use this to implement a simple
; procedure for computing nth roots using fixed-point, average-damp, and the
; repeated procedure of exercise 1.43. Assume that any arithmetic operations you
; need are available as primitives.

; Pre-reqs:
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (< n 2)
      f
      (repeated (compose f f) (- n 1))))

; Experiments
(define (rt2 x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

(define (rt3 x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
               1.0))

(define (rt4 x)
  (fixed-point (average-damp (average-damp (lambda (y) (/ x (expt y 3)))))
               1.0))

(define (rt5 x)
  (fixed-point (average-damp (average-damp (lambda (y) (/ x (expt y 4)))))
               1.0))

(define (rt6 x)
  (fixed-point (average-damp (average-damp (lambda (y) (/ x (expt y 5)))))
               1.0))

(define (rt7 x)
  (fixed-point (average-damp (average-damp (lambda (y) (/ x (expt y 6)))))
               1.0))

(define (rt8 x)
  (fixed-point (average-damp (average-damp (average-damp (lambda (y) (/ x (expt y 7))))))
               1.0))

(rt2 4)
(rt3 8)
(rt4 16)
(rt5 32)
(rt6 64)
(rt7 128)
(rt8 256)

;
; x^1/2 => y -> x/y   => damp             ; 1 ; 2 = 2^1
; x^1/3 => y -> x/y^2 => damp             ; 1 ;
; x^1/4 => y -> x/y^3 => damp(damp)       ; 2 ; 4 = 2^2
; x^1/5 => y -> x/y^4 => damp(damp)       ; 2 ;
; x^1/6 => y -> x/y^5 => damp(damp)       ; 2 ;
; x^1/7 => y -> x/y^6 => damp(damp)       ; 2 ;
; x^1/8 => y -> x/y^7 => damp(damp(damp)) ; 3 ; 8 = 2^3
;
; Implies that a new level of damping needs to be introduced after every power
; of two, and the transformation is always y -> x * y^1-n

; Solution
(define (logn n x)
  (/ (log x) (log n)))

(define (floor-logn n x)
  (floor (logn n x)))

(define (nth-root x n)
  (let ((n-damp (floor-logn 2 n)))
    (fixed-point ((repeated average-damp n-damp) (lambda (y) (/ x (expt y (- n 1)))))
                 1.0)))

(nth-root 256 8)
