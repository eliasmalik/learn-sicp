; Exercise 2.35.

; Redefine count-leaves from section 2.2.2 as an accumulation:

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t) ; t = ((1 2) (3 4))
  (define (count x)
    (cond ((null? x) 0)
          ((not (pair? x)) 1)
          (else (count-leaves x))))
  (accumulate + 0 (map count t)))

(count-leaves (list (list 1 2) (list 3 4)))
(count-leaves (list 1 2))
(count-leaves (list (list (list 0 1) 2) (list 3 4)))
