; Exercise 1.20.

; Euclid's Algorithm
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; The process that a procedure generates is of course dependent on the rules
; used by the interpreter. As an example, consider the iterative gcd procedure
; given above. Suppose we were to interpret this procedure using normal-order
; evaluation, as discussed in section 1.1.5. (The normal-order-evaluation rule
; for if is described in exercise 1.5.) Using the substitution method (for
; normal order), illustrate the process generated in evaluating (gcd 206 40) and
; indicate the remainder operations that are actually performed. How many
; remainder operations are actually performed in the normal-order evaluation of
; (gcd 206 40)? In the applicative-order evaluation?

; For brevity
(define % remainder)

; Normal order evaluation
(gcd 206 40)

(if (= 40 0) 206 (gcd 40 (% 206 40)))

(gcd 40 (% 206 40))

(if (= (% 206 40) 0) 40 (gcd (% 206 40) (% 40 (% 206 40))))

;; (% 206 40) performed
(if (= 6 0) 40 (gcd (% 206 40) (% 40 (% 206 40))))

(gcd (% 206 40) (% 40 (% 206 40)))

(if (= (% 40 (% 206 40)) 0) (% 206 40) (gcd (% 40 (% 206 40)) (% (% 206 40) (% 40 (% 206 40)))))

;; (% 206 40) = 6, (% 40 6) = 4 performed
(if (= 4 0) (% 206 40) (gcd (% 40 (% 206 40)) (% (% 206 40) (% 40 (% 206 40)))))

(gcd (% 40 (% 206 40)) (% (% 206 40) (% 40 (% 206 40))))

(if (= 0 (% (% 206 40) (% 40 (% 206 40)))) (% 40 (% 206 40)) (gcd (% (% 206 40) (% 40 (% 206 40))) (% (% 40 (% 206 40)) (% (% 206 40) (% 40 (% 206 40))))))

;; 2 x (% 206 40) = 6, (% 40 6) = 4, (% 6 4) = 2 performed
(if (= 0 2) (% 40 (% 206 40)) (gcd (% (% 206 40) (% 40 (% 206 40))) (% (% 40 (% 206 40)) (% (% 206 40) (% 40 (% 206 40))))))

(gcd (% (% 206 40) (% 40 (% 206 40))) (% (% 40 (% 206 40)) (% (% 206 40) (% 40 (% 206 40)))))

(if (= 0 (% (% 40 (% 206 40)) (% (% 206 40) (% 40 (% 206 40))))) (% (% 206 40) (% 40 (% 206 40))) (gcd (% (% 40 (% 206 40)) (% (% 206 40) (% 40 (% 206 40)))) (% (% (% 206 40) (% 40 (% 206 40))) (% (% 40 (% 206 40)) (% (% 206 40) (% 40 (% 206 40)))))))

;; 3 x (% 206 40) = 6, 2 x (% 40 6) = 4, (% 6 4) = 2, (% 4 2) = 0 performed
(if (= 0 0) (% (% 206 40) (% 40 (% 206 40))) (gcd (% (% 40 (% 206 40)) (% (% 206 40) (% 40 (% 206 40)))) (% (% (% 206 40) (% 40 (% 206 40))) (% (% 40 (% 206 40)) (% (% 206 40) (% 40 (% 206 40)))))))

(% (% 206 40) (% 40 (% 206 40)))

;; 2 x (% 206 40) = 6, (% 40 6) = 4, (% 6 4) = 2 performed
2

;; 18 remainder operations performed under normal-order-evaluation


; Applicative order evaluation
(gcd 206 40)

(if (= 40 0) 206 (gcd 40 (% 206 40)))

(gcd 40 (% 206 40))

; (% 206 40) performed
(gcd 40 6)

(if (= 6 0) 40 (gcd 6 (% 40 6)))

(gcd 6 (% 40 6))

; (% 40 6) performed
(gcd 6 4)

(if (= 0 4) 6 (gcd 4 (% 6 4)))

(gcd 4 (% 6 4))

; (% 6 4) performed
(gcd 4 2)

(if (= 0 2) 4 (gcd 2 (% 4 2)))

(gcd 2 (% 4 2))

; (% 4 2) performed
(gcd 2 0)

2

;; 4 remainder operations performed
