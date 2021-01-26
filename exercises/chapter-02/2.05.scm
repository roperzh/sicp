; Show that we can represent pairs of nonnegative integers using only numbers
; and arithmetic operations if we represent the pair a and b as the integer
; that is the product 2^a*3^b. Give the corresponding definitions of the
; procedures cons, car, and cdr.

(define (custom-cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (custom-car x)
  (if (= (remainder x 2) 0) (+ 1 (custom-car (/ x 2)))
      0))

(define (custom-cdr x)
  (if (= (remainder x 3) 0) (+ 1 (custom-cdr (/ x 3)))
      0))

(define p (custom-cons 9 8))
(custom-car p)
(custom-cdr p)
