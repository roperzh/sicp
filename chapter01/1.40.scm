; Define a procedure cubic that can be used together with the newtons-method
; procedure in expressions of the form
;
; (newtons-method (cubic a b c) 1)
;
; To approximate zeros of the cubic x^3 + ax^2 + bx + c

(define (cube x) (* x x x))

(define (cubic a b c)
  (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))

((cubic 1 2 3) 1)
((cubic 1 2 3) 3)
