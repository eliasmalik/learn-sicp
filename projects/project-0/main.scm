;;; PROJECT 0
;;; Expressions & Basics

;;; prints Value: -37
-37

;;; prints Value: 12
(* 3 4)

;;; prints Value: #t
(> 10 9.7)

;;; prints Value: 8.4 (or 42/5)
(- (if (> 3 4)
       7
       10)
   (/ 16 10))

;;; prints Value: 135
(* (- 25 10)
   (+ 6 3))

;;; prints Value: 2: #[arity-dispatched-procedure 2]
+

;;; prints Value: double
(define double (lambda (x) (* 2 x)))

;;; prints Value: 3: #[compound-procedure 3 double]
double

;;; prints Value: c
(define c 4)

;;; prints Value: 4
c

;;; prints Value: 8
(double c)

;;; prints Value: 4
c

;;; prints Value: 36
(double (double (+ c 5)))

;;; prints Value: times-2
(define times-2 double)

;;; prints Value: 8
(times-2 c)

;;; prints Value: d
(define d c)

;;; prints Value: #t
(= c d)

;;; prints Value: 4
(cond ((>= c 2) d)
      ((= c (- d 5)) (+ c d))
      (else (abs (- c d))))
