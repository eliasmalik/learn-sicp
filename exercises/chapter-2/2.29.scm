; Exercise 2.29.

; A binary mobile consists of two branches, a left branch and a right branch.
; Each branch is a rod of a certain length, from which hangs either a weight or
; another binary mobile. We can represent a binary mobile using compound data by
; constructing it from two branches (for example, using list):

(define (make-mobile left right)
  (list left right))

; A branch is constructed from a length (which must be a number) together with a
; structure, which may be either a number (representing a simple weight) or
; another mobile:

(define (make-branch len structure)
  (list len structure))

; a.  Write the corresponding selectors left-branch and right-branch, which
; return the branches of a mobile, and branch-length and branch-structure, which
; return the components of a branch.

(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (car (cdr mobile)))
(define (branch-length branch) (car branch))
(define (branch-structure branch) (car (cdr branch)))

; b.  Using your selectors, define a procedure total-weight that returns the
; total weight of a mobile.

(define (branch-has-mobile? branch) (pair? (branch-structure branch)))
(define (sum-branch branch)
  (cond ((not (pair? branch)) branch)
        ((branch-has-mobile? branch) (total-weight (branch-structure branch)))
        (else (branch-structure branch))))
(define (total-weight mobile)
  (+ (sum-branch (left-branch mobile))
     (sum-branch (right-branch mobile))))


; c.  A mobile is said to be balanced if the torque applied by its top-left
; branch is equal to that applied by its top-right branch (that is, if the
; length of the left rod multiplied by the weight hanging from that rod is equal
; to the corresponding product for the right side) and if each of the submobiles
; hanging off its branches is balanced. Design a predicate that tests whether a
; binary mobile is balanced.

(define (is-balanced mobile)
  (let ((lb (left-branch mobile))
        (rb (right-branch mobile)))
    (= (* (branch-length lb) (sum-branch lb))
       (* (branch-length rb) (sum-branch rb)))))

; d.  Suppose we change the representation of mobiles so that the constructors
; are

(define (make-mobile left right)
  (cons left right))
(define (make-branch length structure)
  (cons length structure))

; How much do you need to change your programs to convert to the new
; representation?

; A: Only need to change the selectors
