; The width of an interval is half of the difference between its upper and lower
; bounds. The width is a measure of the uncertainty of the number specified by
; the interval. For some arithmetic operations the width of the result of
; combining two intervals is a function only of the widths of the argument
; intervals, whereas for others the width of the combination is not a function
; of the widths of the argument intervals. Show that the width of the sum (or
; difference) of two intervals is a function only of the widths of the
; intervals being added (or subtracted). Give examples to show that this is not
; true for multiplication or division.

; we want to prove that width(a + b) = width(a) + width(b); where a, b are
; intervals.
; 
; let a = (a1, a2) and b = (b1, b2)
;
; width(a) = (a2 - a1) / 2
;
; width(b) = (b2 - b1) / 2
;
; width(a) + width(b) = (a2 - a1) / 2 + (b2 - b1) / 2
;                     = (a2 - a1 + b2 - b1) / 2
;                     = ((a2 + b2) + (a1 - b1)) / 2
;
; a + b = (a1 + b1, a2 + b2)
;
; width(a + b) = ((a2 + b2) - (a1 + b1)) / 2
;
; thus, width(a) + width(b) = width(a + b)
