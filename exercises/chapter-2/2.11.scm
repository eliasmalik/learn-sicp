; Exercise 2.11.

; In passing, Ben also cryptically comments: "By testing the signs of the
; endpoints of the intervals, it is possible to break mul-interval into nine
; cases, only one of which requires more than two multiplications." Rewrite
; this procedure using Ben's suggestion.

; Let L(i) and U(i) be the lower and upper bounds, respectively of the interval
; i.
; Product of intervals a and b:
; L(a) < 0, U(a) < 0, L(b) < 0, U(b) < 0 :: ( U(a) * U(b), L(a) * L(b) )
; L(a) < 0, U(a) < 0, L(b) < 0, U(b) > 0 :: ( L(a) * U(b), L(a) * L(b) )
; L(a) < 0, U(a) < 0, L(b) > 0, U(b) < 0 :: Impossible
; L(a) < 0, U(a) < 0, L(b) > 0, U(b) > 0 :: ( L(a) * U(b), U(a) * L(b) )
; L(a) < 0, U(a) > 0, L(b) < 0, U(b) < 0 :: ( U(a) * L(b), L(a) * L(b) )
; L(a) < 0, U(a) > 0, L(b) < 0, U(b) > 0 :: ( U(a) * L(b) | L(a) * U(b), L(a) * L(b) | U(a) * U(b) )
; L(a) < 0, U(a) > 0, L(b) > 0, U(b) < 0 :: Impossible
; L(a) < 0, U(a) > 0, L(b) > 0, U(b) > 0 :: ( L(a) * U(b), U(a) * U(b) )
; L(a) > 0, U(a) < 0, L(b) < 0, U(b) < 0 :: Impossible
; L(a) > 0, U(a) < 0, L(b) < 0, U(b) > 0 :: Impossible
; L(a) > 0, U(a) < 0, L(b) > 0, U(b) < 0 :: Impossible
; L(a) > 0, U(a) < 0, L(b) > 0, U(b) > 0 :: Impossible
; L(a) > 0, U(a) > 0, L(b) < 0, U(b) < 0 :: ( U(a) * L(b), L(a) * U(b) )
; L(a) > 0, U(a) > 0, L(b) < 0, U(b) > 0 :: ( U(a) * L(b), U(a) * U(b) )
; L(a) > 0, U(a) > 0, L(b) > 0, U(b) < 0 :: Impossible
; L(a) > 0, U(a) > 0, L(b) > 0, U(b) > 0 :: ( L(a) * L(b), U(a) * U(b) )


(define (make-interval a b) (cons a b))
(define (upper-bound interval) (cdr interval))
(define (lower-bound interval) (car interval))

(define (mul-interval x y)
  (let ((neg? (lambda (n) (>= 0 n)))
        (pos? (lambda (n) (< 0 n)))
        (lb lower-bound)
        (ub upper-bound))
  (cond ((and (neg? (lb x))
              (neg? (ub x))
              (neg? (lb y))
              (neg? (ub y))) (make-interval (* (ub x) (ub y))
                                            (* (lb x) (lb y))))
        ((and (neg? (lb x))
              (neg? (ub x))
              (neg? (lb y))
              (pos? (ub y))) (make-interval (* (lb x) (ub y))
                                            (* (lb x) (lb y))))
        ((and (neg? (lb x))
              (neg? (ub x))
              (pos? (lb y))
              (pos? (ub y))) (make-interval (* (lb x) (ub y))
                                            (* (ub x) (lb y))))
        ((and (neg? (lb x))
              (pos? (ub x))
              (neg? (lb y))
              (neg? (ub y))) (make-interval (* (ub x) (lb y))
                                            (* (lb x) (lb y))))
        ((and (neg? (lb x))
              (pos? (ub x))
              (neg? (lb y))
              (pos? (ub y))) (make-interval (min (* (ub x) (lb y)) (* (lb x) (ub y)))
                                            (max (* (lb x) (lb y)) (* (ub x) (ub y)))))
        ((and (neg? (lb x))
              (pos? (ub x))
              (pos? (lb y))
              (pos? (ub y))) (make-interval (* (lb x) (ub y))
                                            (* (ub x) (ub y))))
        ((and (pos? (lb x))
              (pos? (ub x))
              (neg? (lb y))
              (neg? (ub y))) (make-interval (* (ub x) (lb y))
                                            (* (lb x) (ub y))))
        ((and (pos? (lb x))
              (pos? (ub x))
              (neg? (lb y))
              (pos? (ub y))) (make-interval (* (ub x) (lb y))
                                            (* (ub x) (ub y))))
        ((and (pos? (lb x))
              (pos? (ub x))
              (pos? (lb y))
              (pos? (ub y))) (make-interval (* (lb x) (lb y))
                                            (* (ub x) (ub y))))
        (else (error "Intervals have invalid signs")))))

(define i1 (make-interval (- 1) 2))
(define i2 (make-interval (- 2) (- 1)))

(mul-interval i1 i2)
