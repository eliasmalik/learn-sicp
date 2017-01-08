; Exercise 1.39.
; A continued fraction representation of the tangent function was published in
; 1770 by the German mathematician J.H. Lambert:

; tan(r) = r / (1 - r^2 / (3 - r^2 / 5 - ...))

; where x is in radians. Define a procedure (tan-cf x k) that computes an
; approximation to the tangent function based on Lambert's formula. K specifies
; the number of terms to compute, as in exercise 1.37.

(define (cont-frac n d k)
  (define (helper n d k count)
    (if (= k count)
        (/ (n k) (d k))
        (/ (n count) (+ (d count) (helper n d k (+ 1 count))))))
  (helper n d k 1))

(define (tan-cf x k)
  (define (n i) (if (= i 1) x (- (square x))))
  (define (d i) (- (* 2.0 i) 1))
  (cont-frac n d k))

(tan-cf 1 100)
