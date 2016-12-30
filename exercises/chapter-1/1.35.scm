; Exercise 1.35.

; Show that the golden ratio (section 1.2.2) is a fixed point of the
; transformation x -> 1 + 1/x, and use this fact to compute by means of the
; fixed-point procedure.

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

; Approximation of phi
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 0.75)

; Real phi
(/ (+ 1 (sqrt 5)) 2)
