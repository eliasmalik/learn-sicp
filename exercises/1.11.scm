; Exercise 1.11

; A function f is defined by the rule that
; f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3.

; Write a procedure that computes f by means of a recursive process.

(define (f-recur n)
  (cond ((< n 3) n)
        (else (+ (f-recur (- n 1))
                 (* 2 (f-recur (- n 2)))
                 (* 3 (f-recur (- n 3)))))))

; Try it out:
; prints Value: 2
(f-recur 2)

; prints Value: 4
(f-recur 3)

; prints Value: 11
(f-recur 4)

; Write a procedure that computes f by means of an iterative process.

(define (f-iter n)
  (define (fi a b c n)
    (cond ((< n 3) a)
          (else (fi (+ a (* 2 b) (* 3 c))
                    a
                    b
                    (- n 1)))))
  (fi 2 1 0 n))


; Try it out
; prints Value: 2
(f-iter 2)

; prints Value: 4
(f-iter 3)

; prints Value: 11
(f-iter 4)
