; Exercise 1.37.

; a. An infinite continued fraction is an expression of the form

; f = N_1 / (D_1 + N_2 / (D_2 + N_3 / (D_3 + ...)))

; As an example, one can show that the infinite continued fraction expansion
; with the N_i and the D_i all equal to 1 produces 1/phi, where phi is the
; golden ratio (described in section 1.2.2). One way to approximate an infinite
; continued fraction is to truncate the expansion after a given number of terms.
; Such a truncation -- a so-called k-term finite continued fraction -- has the
; form

; f = N_1 / (D_1 + N_2 / ( ... + N_K / D_K )))

; Suppose that n and d are procedures of one argument (the term index i) that
; return the N_i and D_i of the terms of the continued fraction. Define a
; procedure cont-frac such that evaluating (cont-frac n d k) computes the value
; of the k-term finite continued fraction. Check your procedure by
; approximating 1/phi using

; (cont-frac (lambda (i) 1.0)
;            (lambda (i) 1.0)
;            k)

; for successive values of k. How large must you make k in order to get an
; approximation that is accurate to 4 decimal places?

(define (cont-frac n d k)
  (define (helper n d k count)
    (if (= k count)
        (/ (n k) (d k))
        (/ (n count) (+ (d count) (helper n d k (+ 1 count))))))
  (helper n d k 1))


(define phi (/ (+ 1 (sqrt 5)) 2))
(/ 1 phi)

; k = 11 is the lowest value that produces an approximation accurate to 4 d.p.
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)

; b. If your cont-frac procedure generates a recursive process, write one that
; generates an iterative process. If it generates an iterative process, write
; one that generates a recursive process.

(define (cont-frac-iter n d k)
  (define (iter n d k result)
    (if (= k 1)
        result
        (/ (n k)
           (+ (d k)
              (iter n d (- k 1) (/ (n k) (+ (d k) result)))))))
  (iter n d k 0))

(cont-frac-iter (lambda (i) 1.0)
                (lambda (i) 1.0)
                11)
