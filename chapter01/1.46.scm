; Write a procedure iterative-improve that takes two procedures as arguments: a
; method for telling whether a guess is good enough and a method for improving
; a guess. Iterative-improve should return as its value a procedure that takes
; a guess as argument and keeps improving the guess until it is good enough.
; Rewrite the sqrt procedure of 1.1.7 and the fixed-point procedure of 1.3.3 in
; terms of iterative-improve.

(define (iterative-improve good-enuf? improve)
  (define (improver guess)
    (if (good-enuf? guess)
      guess
      (improver (improve guess))))
  improver)

(define (average x y)
  (/ (+ x y) 2))

(define tolerance 0.00001)

(define (my-sqrt x)
  (define (good-enuf? guess)
    (< (abs (- (square guess) x)) tolerance))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enuf? improve) 1.0))

(my-sqrt 49)

