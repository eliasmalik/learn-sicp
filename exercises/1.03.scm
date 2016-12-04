;;; Exercise 1.3.
;;; Define a procedure that takes three numbers as arguments and returns the sum
;;; of the squares of the two larger numbers.
(define (sq a) (* a a))
(define (sq-sum a b) (+ (sq a) (sq b)))
(define (sq-sum-largest a b c)
  (cond ((and (> a c) (> b c)) (sq-sum a b))
        ((and (> a b) (> c b)) (sq-sum a c))
        ((and (> b a) (> c a)) (sq-sum b c))))

;;; prints Value: 41
(sq-sum-largest 2 4 5)
