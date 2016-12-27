; Exercise 1.27.

; Demonstrate that the Carmichael numbers listed in footnote 47 really do fool
; the Fermat test. That is, write a procedure that takes an integer n and tests
; whether a^n is congruent to a modulo n for every a<n, and try your procedure
; on the given Carmichael numbers.

; Carmichael numbers: 561, 1105, 1729, 2465, 2821, and 6601

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat n)
  (define (test a n)
    (= (expmod a n n) (remainder a n)))
  (define (fermat-iter n a)
    (cond ((= a 0) true)
          ((test a n) (fermat-iter n (- a 1)))
          (else false)))
  (fermat-iter n (- n 1)))

; all print Value: #t
(fermat 561)
(fermat 1105)
(fermat 1729)
(fermat 2465)
(fermat 2821)
(fermat 6601)
