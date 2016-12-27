; Exercise 1.24.

; Modify the timed-prime-test procedure of exercise 1.22 to use fast-prime?
; (the Fermat method), and test each of the 12 primes you found in that
; exercise. Since the Fermat test has (log n) growth, how would you expect the
; time to test primes near 1,000,000 to compare with the time needed to test
; primes near 1000? Do your data bear this out? Can you explain any discrepancy
; you find?

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 1000)
      (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))


(timed-prime-test 1000000007)     ; ~0.07 ms
(timed-prime-test 1000000009)     ; ~0.07 ms
(timed-prime-test 1000000021)     ; ~0.08 ms
(timed-prime-test 10000000019)    ; ~0.08 ms
(timed-prime-test 10000000033)    ; ~0.08 ms
(timed-prime-test 10000000061)    ; ~0.09 ms
(timed-prime-test 100000000003)   ; ~0.09 ms
(timed-prime-test 100000000019)   ; ~0.09 ms
(timed-prime-test 100000000057)   ; ~0.09 ms
(timed-prime-test 1000000000039)  ; ~0.1 ms
(timed-prime-test 1000000000061)  ; ~0.1 ms
(timed-prime-test 1000000000063)  ; ~0.1 ms

; Expect log 10^9 -> log 10^12 => 33% increase
; Numbers reflect a ~ 30% increase, seems to be reasonably consistent
