; 1. Write an analogous procedure called product that returns the product of the
; values of a function at points over a given range. Show how to define
; factorial in terms of product. Also use product to compute approximations to π

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial n)
  (define (next x) (+ x 1))
  (define (term x) 
    (if (= x 0) 1 x))
  (product term 0 next n))

(factorial 3)
(factorial 0)
(factorial 8)

(define (pi accuracy)
  (define (next x) (+ x 1))
  (define (term x)
    (/ (* 4 (* x x)) (- (* 4 (* x x)) 1)))
  (* 2.0 (product term 1 next accuracy)))

(pi 15000)

; If your product procedure generates a recursive process, write one that
; generates an iterative process. If it generates an iterative process, write
; one that generates a recursive process.

(define (product-recursive term a next b)
  (if (> a b)
    1
    (* (term a)
       (product-recursive term (next a) next b))))

; To test, I will use the factorial procedure:

(define (factorial-recursive n)
  (define (next x) (+ x 1))
  (define (term x) 
    (if (= x 0) 1 x))
  (product-recursive term 0 next n))

(factorial-recursive 3)
(factorial-recursive 0)
(factorial-recursive 8)
