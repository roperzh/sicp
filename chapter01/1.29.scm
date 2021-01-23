; Define a procedure that takes as arguments f , a , b , and n and returns the
; value of the integral, computed using Simpson’s Rule. Use your procedure to
; integrate `cube` between 0 and 1 (with n = 100 and n = 1000)

(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpson-integral f a b n)
  (define h (/ (- b a) n))
  (define (inc n) (+ 1 n))
  (define (y k) (f (+ a (* k h))))
  (define (term x)
    (*
      (cond ((or (= x 1) (= x n)) 1)
            ((even? x) 2)
            (else 4))
      (y x))) 
  (* (/ h 3.0) (sum term 0 inc n)))

(simpson-integral cube 0 1 100)
(simpson-integral cube 0 1 1000)

