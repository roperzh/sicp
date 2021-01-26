(load "2.07.scm")

; Using reasoning analogous to Alyssa’s, describe how the difference of two
; intervals may be computed. Define a corresponding subtraction procedure,
; called sub-interval.

(define (sub-interval x y)
  (make-interval (- (lower-bound x)
                    (lower-bound y))
                 (- (upper-bound x)
                    (upper-bound y))))

; tests: 
((lambda ()
    (let ((a (make-interval 1 2))
          (b (make-interval 2 3)))
        (sub-interval a b))))
