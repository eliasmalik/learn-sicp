; Exercise 1.19.
; There is a clever algorithm for computing the Fibonacci numbers in a
; logarithmic number of steps.

; Recall the transformation of the state variables a and b in the fib-iter
; process of section 1.2.2:
;     a <- a + b
; and
;     b <- a
; Call this transformation T, and observe that applying T over and over again n
; times, starting with 1 and 0, produces the pair Fib(n + 1) and Fib(n). In
; other words, the Fibonacci numbers are produced by applying T^n, the nth power
; of the transformation T, starting with the pair (1,0).

; Now consider T to be the special case of p = 0 and q = 1 in a family of
; transformations T(p,q), where T(p,q) transforms the pair (a,b) according to
;     a <- bq + aq + ap
; and
;     b <- bp + aq.
; Show that if we apply such a transformation Tpq twice, the effect is the same
; as using a single transformation Tp'q' of the same form, and compute p' and q'
; in terms of p and q.


; Solution:
; ---------
; Fix integers p and q. Given some inital integers a, b, applying the definition
; of T(p,q) gives:
;
;    a' = bq + aq + ap
;    b' = bp + aq
;
; Applying the definition to a' and b', we get:
;
;    a'' = b'q + a'q + a'p = (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p
;    b'' = b'p + a'q       = (bp + aq)p + (bq + aq + ap)q
;
; Which simplifies to:
;
;    a'' = bpq + aq^2 + bq^2 + aq^2 + apq + bpq + apq + ap^2
;        = b(pq + q^2 + pq) + a(q^2 + q^2 + pq + pq + p^2)
;        = b(q^2 + 2pq) + a(q^2 + 2pq) + a(p^2 + q^2)
;
;    b'' = bp^2 + apq + bq^2 + aq^2 + apq
;        = b(p^2 + q^2) + a(q^2 + 2pq)
;
; Now set
;    q' = q^2 + 2pq
;    p' = p^2 + q^2
;
; Then T(p',q') = T^2(p,q)


; This gives us an explicit way to square these transformations, and thus we can
; compute Tn using successive squaring, as in the fast-expt procedure. Put this
; all together to complete the following procedure, which runs in a logarithmic
; number of steps:

(define (p-prime p q) (+ (square p) (square q)))
(define (q-prime p q) (+ (square q) (* 2 p q)))

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (p-prime p q); compute p'
                   (q-prime p q); compute q'
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

; Try it out

; prints Value: 0
(fib 0)

; prints Value: 1
(fib 1)

; prints Value: 8
(fib 6)

; prints Value: 6765
(fib 20)
