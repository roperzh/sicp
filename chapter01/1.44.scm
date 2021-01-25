; The idea of smoothing a function is an important concept in signal processing.
; If f is a function and d x is some small number, then the smoothed version of
; f is the function whose value at a point x is the average of f ( x − d x ) ,
; f ( x ) , and f ( x + d x ) . Write a procedure smooth that takes as input a
; procedure that computes f and returns a procedure that computes the smoothed
; f .

(define (repeated f n)
  (define (iter count total)
    (if (= count 0)
      total
      (iter (- count 1) (f total))))
  (lambda (x) (iter n x)))

(define (smooth f)
    (define dx 0.0001)
    (define (avg a b c) (/ (+ a b c) 3))
    (lambda (x) (avg (f (- x dx)) (f x) (f (+ x dx)))))

(define (n-fold f n)
  (repeated (smooth f) n))

((smooth sqrt) 4)
((n-fold sqrt 10) 4)
