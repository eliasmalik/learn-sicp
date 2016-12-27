; Exercise 1.12.

; The following pattern of numbers is called Pascal's triangle.

; 1
; 1 1
; 1 2 1
; 1 3 3 1
; 1 4 6 4 1
; ...

; The numbers at the edge of the triangle are all 1, and each number inside the
; triangle is the sum of the two numbers above it. Write a procedure that
; computes elements of Pascal's triangle by means of a recursive process.

(define (pascal x y)
  (cond ((= 0 y) 1)
        ((= x y) 1)
        (else (+ (pascal (- x 1) (- y 1))
                 (pascal (- x 1) y)))))

; Try it out
; prints Value: 1
(pascal 0 0)

; prints Value: 1
(pascal 1 1)

; prints Value: 2
(pascal 2 1)

; prints Value: 6
(pascal 4 2)
