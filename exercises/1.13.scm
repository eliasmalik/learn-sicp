; Exercise 1.13.

; Prove that Fib(n) is the closest integer to
;    (phi^n)/sqrt(5)
; where
;    phi = (1 + sqrt(5))/2

; Hint: Let
;    psi = (1 - sqrt(5))/2
; Use induction and the definition of the Fibonacci numbers to prove that
;    Fib(n) = (phi^n - psi^n)/5

; Aside:
; ------
; Proof by induction proceeds as follows:
; Given a statement, F, depending on an integer n, one can prove the statement
; holds for all n in the following way:
; (1) Prove that F(0) holds
; (2) Assuming F(n) holds, prove that F(n+1) holds
;
; Given that Fibonacci depends on n and n - 1, we shall slightly modify this to:
; (1) Prove that F(0) holds and F(1) holds
; (2) Assuming that F(n) and F(n-1) hold, prove that F(n+1) holds


; Definition (1)
; --------------
; Fib(n) = Fib(n-1) + Fib(n-2); n > 0, Fib(0) = 0, Fib(1) = 1;

; Definition (2)
; --------------
; Let
;   psi = (1 - sqrt(5))/2,
;   phi = (1 + sqrt(5))/2

; Three statements immediately follow from this definition.

; Corollary (1)
; -------------
;   psi * phi = -1
;
; Proof:
;   psi * phi = 0.25 * (1 + sqrt(5)) * (1 - sqrt(5)) = 0.25 * (1 - 5) = -1

; Corollary (2)
; -------------
;   phi + 1 = phi^2
;   psi + 1 = psi^2
;
; Proof:
; Observe that:
;   psi^2 = 0.25 * (1 - sqrt(5))^2 = 0.5 * (3 - 2*sqrt(5)),
;   phi^2 = 0.25 * (1 + sqrt(5))^2 = 0.5 * (3 + 2*sqrt(5)),
;   1 + psi = 1 + 0.5 * (1 - sqrt(5)) = 0.5 * (3 - 2*sqrt(5)) = psi^2,
;   1 + phi = 1 + 0.5 * (1 + sqrt(5)) = 0.5 * (3 + 2*sqrt(5)) = phi^2,

; Corollary (3)
; -------------
;   |  psi^n  |
;   | ------- | < 1, for all n = 0, 1, 2, 3, ...
;   | sqrt(5) |
;
; Proof:
; Observe that:
;     1 < sqrt(5) < 3
; Therefore:
;     psi = -1 < 0.5 * (1 - sqrt(5)) < 0
; <=> -1 < psi^n < 1, for all n = 0, 1, 2, 3, ...
; And since 0 < sqrt(5) < 1,
;     abs(psi^n / sqrt(5)) < 1

; Lemma (1)
; ---------
;           phi^n - psi^n
; Fib(n) = ---------------
;              sqrt(5)
;
; Proof:
; ------
; Proceeding by induction,
;
; Set n = 0:
;    phi^0 - psi^0      1 - 1
;   --------------- = --------- = 0 = Fib(0)
;       sqrt(5)        sqrt(5)
;
; Set n = 1:
;    phi^1 - psi^1     1 + sqrt(5) - 1 + sqrt(5)
;   --------------- = -------------------------- = 1 = F(1)
;       sqrt(5)               2 * sqrt(5)
;
; Now assume that the Lemma holds for n and n-1. Then by definition (1),
;
;      F(n+1) = F(n) + F(n-1)
;
; Substituting in for F(n) and F(n-1):
;
;               phi^n - psi^n   phi^(n-1) - psi^(n-1)
; <=>  F(n+1) = ------------- + ---------------------
;                  sqrt(5)             sqrt(5)
;
;               (phi + 1) phi^(n-1) - (psi + 1) psi^(n-1)
; <=>  F(n+1) = -----------------------------------------
;                                sqrt(5)
;
; Then from Corollary (1):
;
;                           (phi + 1) phi^(n-1) - (psi + 1) psi^(n-1)
; <=>  F(n+1) = (phi psi)^2 -----------------------------------------
;                                            sqrt(5)
;
;               (phi + 1) psi^2 phi^(n+1) - (psi + 1) phi^2 psi^(n+1)
; <=>  F(n+1) = -----------------------------------------------------
;                                      sqrt(5)
;
; And from Corollary (2):
;
;               phi^2 psi^2 phi^(n+1) - psi^2 phi^2 psi^(n+1)
; <=>  F(n+1) = ---------------------------------------------
;                                  sqrt(5)
;
; Then, again from Corollary (1):
;
;               phi^(n+1) - psi^(n+1)
; <=>  F(n+1) = ---------------------
;                      sqrt(5)
;
; We have proved the statement in Lemma (2).

; Corollary (4)
; ---------
; Fib(n) is the closest integer to
;    (phi^n)/sqrt(5)
;
; Proof:
; ------
; This follows immediately from Lemma (1) together with Corollary (3)
; And we're done!
