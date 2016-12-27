;;; Exercise 1.5.
;;; Ben Bitdiddle has invented a test to determine whether the interpreter he is
;;; faced with is using applicative-order evaluation or normal-order evaluation.
;;; He defines the following two procedures:

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

;;; Then he evaluates the expression

(test 0 (p))

;;; What behavior will Ben observe with an interpreter that uses
;;; applicative-order evaluation? What behavior will he observe with an
;;; interpreter that uses normal-order evaluation? Explain your answer. (Assume
;;; that the evaluation rule for the special form if is the same whether the
;;; interpreter is using normal or applicative order: The predicate expression
;;; is evaluated first, and the result determines whether to evaluate the
;;; consequent or the alternative expression.)

;;; applicative-order
;;; (test 0 (p)) <-- start here
;;; (test 0 (p)) <-- try to evaluate (p)
;;; (test 0 (p)) <-- try to evaluate (p)
;;; (test 0 (p)) <-- try to evaluate (p)
;;; ... ad infinitum since p is a non-terminating recursive function

;;; normal-order
;;; (test 0 (p)) <-- start here
;;; (if (= 0 0) 0 (p)) <-- expand operator
;;; 0 <-- first branch is taken
