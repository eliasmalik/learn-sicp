; Exercise 1.22.

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (even? n)
  (= 0 (remainder n 2)))

; Most Lisp implementations include a primitive called runtime that returns an
; integer that specifies the amount of time the system has been running
; (measured, for example, in microseconds). The following timed-prime-test
; procedure, when called with an integer n, prints n and checks to see if n is
; prime. If n is prime, the procedure prints three asterisks followed by the
; amount of time used in performing the test.

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

; Using this procedure, write a procedure search-for-primes that checks the
; primality of consecutive odd integers in a specified range. Use your procedure
; to find the three smallest primes larger than 1000; larger than 10,000; larger
; than 100,000; larger than 1,000,000. Note the time needed to test each prime.
; Since the testing algorithm has order of growth of (n), you should expect that
; testing for primes around 10,000 should take about 10 times as long as testing
; for primes around 1000. Do your timing data bear this out? How well do the
; data for 100,000 and 1,000,000 support the n prediction? Is your result
; compatible with the notion that programs on your machine run in time
; proportional to the number of steps required for the computation?

(define (search-for-primes first last)
   (define (search-iter cur last)
     (if (<= cur last) (timed-prime-test cur))
     (if (<= cur last) (search-iter (+ cur 2) last)))
   (search-iter (if (even? first) (+ first 1) first)
                (if (even? last) (- last 1) last)))

; each prime runs in ~ 0.04 ms
(search-for-primes 1000000000 1000000021)

; each prime runs in ~ 0.14 ms
(search-for-primes 10000000000 10000000061)

; each prime runs in ~ 0.4 ms
(search-for-primes 100000000000 100000000057)

; each prime runs in ~ 1.25 ms
(search-for-primes 1000000000000 1000000000063)

; NOTE: the original numbers in the question run too fast to give meaningful
; timing results. So the lower bound has been increased to 10^9.

; sqrt(10) ~ 3.1622

; It's clear that the average run-time for each prime stays quite close to
; what's expected: a factor of sqrt(10) increase in runtime for a factor of 10
; increase in input.
