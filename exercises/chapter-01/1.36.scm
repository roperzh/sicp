; Modify fixed-point so that it prints the sequence of approximations it
; generates, using the newline and display primitives.

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (newline)
    (display guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; Then find a solution to x^x = 1000 by finding a fixed point of
; x ↦ log(1000) / log(x).

(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)

; Compare the number of steps this takes with and without average damping

(define (average x y) (/ (+ x y) 2))
(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2.0)

; average damping takes way less steps
