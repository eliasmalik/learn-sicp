; Exercise 2.13.
; Show that under the assumption of small percentage tolerances there is a
; simple formula for the approximate percentage tolerance of the product of two
; intervals in terms of the tolerances of the factors. You may simplify the
; problem by assuming that all numbers are positive.

; Let
;  a = (c1, p1), 0 < p1 < eps, c1 > 0
;  b = (c2, p2), 0 < p2 < eps, c2 > 0
;
; Then
;  L(a) = c1 - (c1 * p1), L(a) > 0
;  U(a) = c1 + (c1 * p1), U(a) > 0
;  L(b) = c2 - (c2 * p2), L(b) > 0
;  U(b) = c2 + (c2 * p2), U(b) > 0
;
; From exercise 2.11, we know
;  a * b = ( L(a) * L(b), U(a) * U(b) )
;
; Then ignoring O(p1 * p2) terms,
;  a * b = ( c1*c2*(1 - p1 - p2), c1*c2*(1 + p1 + p2) )
;
; And using the result from exercise 2.12,
;  p = ( U(a * b) - L(a * b) ) / ( U(a * b) + L(a * b) )
;    = ( c1*c2*(1 + p1 + p2) - c1*c2*(1 - p1 - p2) ) / ( c1*c2*(1 + p1 + p2) + c1*c2*(1 + p1 + p2) )
;    = 1 / 2 / (1 + p1 + p2)
;
