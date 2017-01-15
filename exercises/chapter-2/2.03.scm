; Exercise 2.3.

; Implement a representation for rectangles in a plane. (Hint: You may want to
; make use of exercise 2.2.) In terms of your constructors and selectors, create
; procedures that compute the perimeter and the area of a given rectangle. Now
; implement a different representation for rectangles. Can you design your
; system with suitable abstraction barriers, so that the same perimeter and area
; procedures will work using either representation?

(define (make-rect origin width height)
  (cons origin (cons width height)))
(define (rect-origin rect)
  (car rect))
(define (rect-width rect)
  (car (cdr rect)))
(define (rect-height rect)
  (cdr (cdr rect)))


(define (perimeter rect)
  (+ (* 2 (rect-height rect))
     (* 2 (rect-width rect))))
(define (area rect)
  (* (rect-width rect) (rect-height rect)))

(define r1 (make-rect 0.0 1.0 2.0))

(perimeter r1)
(area r1)

; Procedures `perimeter` and `area` only use selectors, so as long as the
; alternative implementation of `rect` also provides the same selectors, these
; procedures will still work.
