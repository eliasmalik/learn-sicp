; Exercise 2.8.

; Using reasoning analogous to Alyssa's, describe how the difference of two
; intervals may be computed. Define a corresponding subtraction procedure,
; called sub-interval.

; The minimum difference between two intervals is the minimum of the differences
; of the bounds. Similarly, the maximum difference between two intervals is the
; maximum of the differences between the bounds.
; Cannot make any simplifications, since intervals could be unordered, and
; indeed could overlap.

(define (make-interval a b) (cons a b))
(define (upper-bound interval) (cdr interval))
(define (lower-bound interval) (car interval))

(define (sub-interval a b)
  (make-interval (- (lower-bound a) (upper-bound b))
                 (- (upper-bound a) (lower-bound b))))

(define ival1 (make-interval 0 3))
(define ival2 (make-interval (- 1) 2))
(sub-interval ival1 ival2)
(sub-interval ival2 ival1)
