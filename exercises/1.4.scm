;;; Exercise 1.4.
;;; Observe that our model of evaluation allows for combinations whose operators
;;; are compound expressions. Use this observation to describe the behavior of
;;; the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;;; prints Value: 3
(a-plus-abs-b 1 2)

;;; prints Value: 4
(a-plus-abs-b 1 (- 3))
