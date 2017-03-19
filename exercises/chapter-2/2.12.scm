; Exercise 2.12.

; Define a constructor make-center-percent that takes a center and a percentage
; tolerance and produces the desired interval. You must also define a selector
; percent that produces the percentage tolerance for a given interval. The
; center selector is the same as the one shown above.

(define (make-interval a b) (cons a b))

(define (make-center-percent c p)
  (make-interval (- c (* c p)) (+ c (* c p))))

; a     = c - c * p
; b     = c + c * p
; a + b = 2 * c
; b - a = 2 * c * p
; p     = (b - a) / (a + b)

(define (percent i)
  (let ((a (car i))
        (b (cdr i)))
    (cond ((= 0 a) (error "Cannot recover percentage from zero-centred interval"))
          (else (/ (- b a) (+ a b))))))

(define cp1 (make-center-percent 0 0.05))
(define cp2 (make-center-percent 0.68 0.1))

(percent cp1)
(percent cp2)
