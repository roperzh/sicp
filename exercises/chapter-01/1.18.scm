; Using the results of Exercise 1.16 and Exercise 1.17, devise a procedure that
; generates an iterative process for multiplying two integers in terms of
; adding, doubling, and halving and uses a logarithmic number of steps.

(define (double x) (+ x x))

(define (halve x)  (/ x 2))

(define (mult-iter b n a)
  (cond ((= n 0)
         a)
        ((even? n)
         (mult-iter (double b) (halve n) a))
        (else
          (mult-iter b (- n 1) (+ b a)))))

(define (mult b n)
  (mult-iter b n 0))

(= (mult 1 1) 1)
(= (mult 0 4) 0)
(= (mult 4 4) 16)
(= (mult 5 7) 35)
(= (mult 9 2) 18)
