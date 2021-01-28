; Define a generic equality predicate equ? that tests the equality of two
; numbers, and install it in the generic arithmetic package. This operation
; should work for ordinary numbers, rational numbers, and complex numbers.

(define (equ? a b)
  (apply-generic 'equ? a b))

; In scheme-number-package
(put 'equ? 'schme-number eq?)

; In rational-package
(define (equ? a b)
  (and (eq? (numer a) (numer b))
       (eq? (denom a) (denom b))))

(put 'equ? '(rational rational)
    (lambda (x y) (equ? a b)))

; In complex-package
(define (equ? a b)
  (and (eq? (real-part a) (real-part b))
       (eq? (imag-part a) (imag-part b))))

(put 'equ? '(complex complex)
    (lambda (x y) (equ? a b)))

