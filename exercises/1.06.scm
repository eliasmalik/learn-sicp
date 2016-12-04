; Exercise 1.6.

; Dependencies
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

; Alyssa P. Hacker doesn't see why if needs to be provided as a
; special form. ``Why can't I just define it as an ordinary procedure in terms
; of cond?'' she asks. Alyssa's friend Eva Lu Ator claims this can indeed be
; done, and she defines a new version of if:

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; Eva demonstrates the program for Alyssa:

; prints Value: 5
(new-if (= 2 3) 0 5)

; prints Value: 0
(new-if (= 1 1) 0 5)

; Delighted, Alyssa uses new-if to rewrite the square-root program:

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

; What happens when Alyssa attempts to use this to compute square roots?
; Explain.

; prints Value: 3.00009... No it doesn't!
; (sqrt-iter 1 9)

; The call never terminates. This is because of the order of evaluation when
; we define the new-if procedure. Since the scheme interpreter works in
; applicative order, it will evaluate the operands to the procedure first, and
; then attempt to use them in the body of the procedure. This means when we call
; (define (sqrt-iter a b) (new-if (predicate) (consequent) (sqrt-iter a' b) ))
; we will try to evaluate the alternative clause before we begin evaluating the
; body of the procedure, but the alternative clause is a recursive call to
; sqrt-iter!
; In contrast because "if" is a special form, it will evaluate its alternative
; clause ONLY if its predicate returns false. Therefore we only recurse if we
; need to.
;
; This is not an artefact of using "cond" instead of "if", it is instead an
; artefact of wrapping our conditional branching in a procedure.
