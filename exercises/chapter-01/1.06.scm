;; Alyssa P. Hacker doesn’t see why if needs to be provided as a special form.
;; “Why can’t I just define it as an ordinary procedure in terms of cond?” she
;; asks. Alyssa’s friend Eva Lu Ator claims this can indeed be done, and she
;; defines a new version of if: 

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

;; Eva demonstrates the program for Alyssa:

(new-if (= 2 3) 0 5)
;; 5

(new-if (= 1 1) 0 5)
;; 0

;; Delighted, Alyssa uses new-if to rewrite the square-root program:

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

;; What happens when Alyssa attempts to use this to compute square roots?
;; Explain.

;; Answer: when `if ` is not a special form the arguments are evaluated before
;; the condition is tested. This is not a problem for the examples provided by
;; Eva, but can be a problem when you expect only one of the branches of the
;; `if` clause to be actually executed as is the case of `sqrt-iter`. In this
;; particular case we get an infinite loop.

