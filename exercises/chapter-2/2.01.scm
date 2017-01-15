; Exercise 2.1.

; Define a better version of make-rat that handles both positive and negative
; arguments. Make-rat should normalize the sign so that if the rational number
; is positive, both the numerator and denominator are positive, and if the
; rational number is negative, only the numerator is negative.

(define (gcd a b)
  (if (= b 0)
      (abs a)
      (gcd b (remainder a b))))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (cond ((or (and (< n 0) (< d 0))
               (and (> n 0) (< d 0))) (cons (/ (- n) g) (/ (- d) g)))
          (else (cons (/ n g) (/ d g))))))

(make-rat 4 (- 10))
