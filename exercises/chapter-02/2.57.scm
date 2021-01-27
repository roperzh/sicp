(load "symbolic-differentiation-definitions.scm")
(load "2.56.scm")

;  Extend the differentiation program to handle sums and products of arbitrary
;  numbers of (two or more) terms. Then the last example above could be
;  expressed as .
;
; (deriv '(* x y (+ x 3)) 'x)

; Try to do this by changing only the representation for sums and products,
; without changing the deriv procedure at all. For example, the addend of a sum
; would be the first term, and the augend would be the sum of the rest of the
; terms. 

(define (augend s)
  (reduce make-sum 0 (list-tail s 2)))

(augend '(+ 2 3 4))

(define (multiplicand p)
  (reduce make-product 1 (list-tail p 2)))

(multiplicand '(* 3 4 2))

(deriv '(* x y (+ x 3)) 'x)

