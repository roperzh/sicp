; Design a procedure that evolves an iterative exponentiation process that uses
; successive squaring and uses a logarithmic number of steps.

(define (exp-iter b n a)
  (cond ((= n 0)
         a)
        ((even? n)
         (exp-iter (* b b) (/ n 2) a))
        (else
         (exp-iter b (- n 1) (* b a)))))

(define (exp b n) 
  (exp-iter b n 1))

(exp 2 2)
(exp 2 5)
(exp 5 5)
