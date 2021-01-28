; Define a generic predicate =zero? that tests if its argument is zero, and
; install it in the generic arithmetic package. This operation should work for
; ordinary numbers, rational numbers, and complex numbers.

(define (=zero? x)
  (apply-generic 'zero? x))

; In scheme-number-package
(put '=zero? 'schme-number (lambda (x) (zero? x)))

; In rational-package
(define (=zero? x)
  (eq? (numer a) 0))

(put '=zero? '(rational rational)
    (lambda (x) (=zero? x)))

; In complex-package
(define (=zero? x)
  (= (magnitude x) 0))

(put '=zero? '(complex complex)
    (lambda (x) (=zero? x)))

