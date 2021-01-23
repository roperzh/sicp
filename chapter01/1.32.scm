; Show that sum and product (Exercise 1.31) are both special cases of a still
; more general notion called accumulate that combines a collection of terms,
; using some general accumulation function 
;
; (accumulate 
;   combiner null-value term a next b)
;
; Accumulate takes as arguments the same term and range specifications as sum
; and product, together with a combiner procedure (of two arguments) that
; specifies how the current term is to be combined with the accumulation of the
; preceding terms and a null-value that specifies what base value to use when
; the terms run out. Write accumulate and show how sum and product can both be
; defined as simple calls to accumulate.

(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner result (term a)))))
  (iter a null-value)))

(define (sum term a next b)
  (define (combiner x y) (+ x y))
  (accumulate combiner 0 term a next b))

(define (prod term a next b)
  (define (combiner x y) (* x y))
  (accumulate combiner 1 term a next b))

; To test sum, I will use the sum-cubes procedure:
(define (sum-cubes a b)
  (define (inc n) (+ n 1))
  (sum cube a inc b))

(= (sum-cubes 1 10) 3025)

; To test prod, I will use the factorial procedure;
(define (factorial n)
  (define (next x) (+ x 1))
  (define (term x)
    (if (= x 0) 1 x))
  (prod term 0 next n))

(= (factorial 3) 6)
(= (factorial 0) 1)
(= (factorial 8) 40320)

