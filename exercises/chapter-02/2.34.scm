(load "2.33.scm")

; Fill in the following template to produce a procedure that evaluates a
; polynomial using Horner’s rule. Assume that the coefficients of the
; polynomial are arranged in a sequence, from a 0 through a n

(define 
  (horner-eval x coefficient-sequence)
  (accumulate 
   (lambda (this-coeff higher-terms)
     (+ (* higher-terms x) this-coeff))
   0
   coefficient-sequence))

; For example, to compute 1 + 3x + 5 x^3 + x^5 at x = 2 you would evaluate 
(horner-eval 2 (list 1 3 0 5 0 1))
