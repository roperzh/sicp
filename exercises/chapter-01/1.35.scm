; Show that the golden ratio φ (1.2.2) is a fixed point of the transformation
; x ↦ 1 + 1 / x , and use this fact to compute φ by means of the fixed-point
; procedure.

; If φ = 1 + sqrt(5) / 2, we can calculate f(φ) and see if it's a fixed point:
;
; f(φ) = 1 + 1 / φ
; f(φ) = 1 + 1 / ((1 + sqrt(5)) / 2)
; f(φ) = 1 + 2 / 1 + sqrt(5)
; f(φ) = (1 + sqrt(5) + 2) / (1 + sqrt(5))
; f(φ) = (3 + sqrt(5)) / 1 + sqrt(5)
; f(φ) = 1 + sqrt(5) / 2
; f(φ) = φ

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
