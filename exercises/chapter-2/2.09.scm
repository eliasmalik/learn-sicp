; Exercise 2.9.

; The width of an interval is half of the difference between its upper and lower
; bounds. The width is a measure of the uncertainty of the number specified by
; the interval. For some arithmetic operations the width of the result of
; combining two intervals is a function only of the widths of the argument
; intervals, whereas for others the width of the combination is not a function
; of the widths of the argument intervals. Show that the width of the sum (or
; difference) of two intervals is a function only of the widths of the intervals
; being added (or subtracted). Give examples to show that this is not true for
; multiplication or division.

; Let width(a) = upper(a) - lower(a)

; For summation
; We have sum(a, b) = (lower(a) + lower(b), upper(a) + upper(b))
; Then width(sum(a, b)) = upper(a) + upper(b) - lower(a) - lower(b)
;                       = upper(a) - lower(a) + upper(b) - lower(b)
;                       = width(a) + width(b)

; For subtraction
; We have subtract(a, b)     = (lower(a) - upper(b), upper(a) - lower(b))
; Then width(subtract(a, b)) = upper(a) - lower(b) - lower(a) + upper(b)
;                            = upper(a) - lower(a) + upper(b) - lower(b)
;                            = width(a) + width(b)

; For multiplication
; Let p = (p1, p2, p3, p4) = (lower(a) * lower(b),
;                             lower(a) * upper(b),
;                             upper(a) * lower(b),
;                             upper(a) * upper(b))
;
; We have mult(a, b)     = (min(p), max(p))
; Then width(mult(a, b)) = max(p) - min(p)
; Now max(p) and min(p) could each be one of 4 values, giving us 16 possible
; combinations for the value of width(mult(a, b)). To demonstrate that
; width(mult(a, b)) isn't solely a function of width(a) and width(b), we just
; need one counter-example. So pick one possible solution:
;                        = lower(a) * lower(b) - lower(a) * upper(b)
;                        = lower(a) * (lower(b) - upper(b))
;                        = lower(a) * (-width(b))
; This is not purely a function of width(a) or width(b).
