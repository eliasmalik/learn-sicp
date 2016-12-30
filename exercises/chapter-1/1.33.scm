; Exercise 1.33.
; You can obtain an even more general version of accumulate (exercise 1.32) by
; introducing the notion of a filter on the terms to be combined. That is,
; combine only those terms derived from values in the range that satisfy a
; specified condition. The resulting filtered-accumulate abstraction takes the
; same arguments as accumulate, together with an additional predicate of one
; argument that specifies the filter. Write filtered-accumulate as a procedure.
; Show how to express the following using filtered-accumulate:

(define (filtered-accumulate combiner null-value term a next b predicate)
  (if (> a b)
      null-value
      (combiner (if (predicate a)
                    (term a)
                    null-value)
                (filtered-accumulate combiner null-value term (next a) next b predicate))))

; a. the sum of the squares of the prime numbers in the interval a to b (
; assuming that you have a prime? predicate already written)

(define (prime? n)
  (define (next n) (if (= n 2) 3 (+ n 2)))
  (define (divides? a b) (= (remainder b a) 0))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (next test-divisor)))))
  (define (smallest-divisor n) (find-divisor n 2))
  (if (= n 1)
      #f
      (= n (smallest-divisor n))))

(define (square-sum-prime a b)
  (define (inc n) (+ n 1))
  (filtered-accumulate + 0 square a inc b prime?))

; prints Value: 87
(square-sum-prime 1 7)


; b. the product of all the positive integers less than n that are relatively
; prime to n (i.e., all positive integers i < n such that GCD(i,n) = 1).

(define (prod-rel-prime n)
  (define (inc n) (+ n 1))
  (define (id x) x)
  (define (gcd a b) (if (= b 0) a (gcd b (remainder a b))))
  (define (co-prime? a) (= 1 (gcd a n)))
  (filtered-accumulate * 1 id 1 inc n co-prime?))

; prints Value: 105
(prod-rel-prime 8)
