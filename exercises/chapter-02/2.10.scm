(load "2.07.scm")
(load "2.1.4-extended-exercise-definitions.scm")

; Ben Bitdiddle, an expert systems programmer, looks over Alyssa’s shoulder and
; comments that it is not clear what it means to divide by an interval that
; spans zero. Modify Alyssa’s code to check for this condition and to signal an
; error if it occurs.

(define (div-interval-safe x y)
  (if (or (= 0 (lower-bound y))
          (= 0 (upper-bound y))) 
      (error "division by zero")
      (div-interval x y)))

; tests:
((lambda ()
    (let ((a (make-interval 1 2))
          (b (make-interval 0 0)))
       (div-interval-safe a b)
       (div-interval-safe b a)
       (div-interval-safe a a))))

