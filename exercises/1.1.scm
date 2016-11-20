;;; Exercise 1.1

;;; prints Value: 10
10

;;; prints Value: 12
(+ 5 3 4)

;;; prints Value: 8
(- 9 1)

;;; prints Value: 3
(/ 6 2)

;;; prints Value: 6
(+ (* 2 4) (- 4 6))

;;; prints Value: a
(define a 3)

;;; prints Value: b
(define b (+ a 1))

;;; prints Value: 19
(+ a b (* a b))

;;; prints Value: #f
(= a b)

;;; prints Value: 4
(if (and (> b a) (< b (* a b)))
    b
    a)

;;; prints Value: 16
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))

;;; prints Value: 6
(+ 2 (if (> b a) b a))

;;; prints Value: 16
(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
