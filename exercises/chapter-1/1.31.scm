; Exercise 1.31.

; a.  The sum procedure is only the simplest of a vast number of similar
; abstractions that can be captured as higher-order procedures. Write an
; analogous procedure called product that returns the product of the values of a
; function at points over a given range. Show how to define factorial in terms
; of product. Also use product to compute approximations to using the formula

; pi   2 * 4 * 4 * 6 * 6 * 8 * ...
; -- = ---------------------------
; 4    3 * 3 * 5 * 5 * 7 * 7 * ...

; b.  If your product procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.

; a)
(define (product f a next b)
  (if (> a b)
      1
      (* (f a)
         (product f (next a) next b))))

(define (inc a) (+ a 1))
(define (id a) a)

(define (factorial n)
  (product id 1 inc n))

; prints Value: 120
(factorial 5)

(define (quarter-pi n)
  (define (numerator a) (square (* 2.0 a)))
  (define (denominator a) (* (- (* 2 a) 1) (+ (* 2 a) 1)))
  (/ (product numerator 1 inc n)
     (product denominator 1 inc n)
     2))

(quarter-pi 1)
(quarter-pi 2)
(quarter-pi 3)
(quarter-pi 4)
(quarter-pi 5)
(quarter-pi 6)
(quarter-pi 7)
(quarter-pi 8)
(quarter-pi 9)
(quarter-pi 10)
(quarter-pi 50)

; b)
(define (product-iter f a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (f a)))))
  (iter a 1))

; prints Value: 24
(product-iter id 1 inc 4)
