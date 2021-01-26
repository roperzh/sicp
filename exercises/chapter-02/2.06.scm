;  In case representing pairs as procedures wasn’t mind-boggling enough,
;  consider that, in a language that can manipulate procedures, we can get by
;  without numbers (at least insofar as nonnegative integers are concerned) by
;  implementing 0 and the operation of adding 1 as

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; Define one and two directly (not in terms of zero and add-1).
; (Hint: Use substitution to evaluate (add-1 zero)). Give a direct definition
; of the addition procedure + (not in terms of repeated application of add-1).

; (add-1 zero)
; (add-1 (lambda (x) x))
; (lambda (f) (lambda(x) (f (((lambda (x) x) f) x))))
; (lambda (f) (lambda(x) (f x)))) 

(define one
 (lambda (f) (lambda(x) (f x)))) 

(define two
 (lambda (f) (lambda(x) (f (f x)))))

(define (plus m n)
  (lambda(x) (m (n x))))

(define st (one (lambda (x) (+ 1 x))))
(define nd (two (lambda (x) (+ 1 x))))
(define td (plus st nd))
(td 0)
