; Write a procedure that takes as inputs a procedure that computes f and a
; positive integer n and returns the procedure that computes the n th repeated
; application of f . Your procedure should be able to be used as follows:
;
; ((repeated square 2) 5)
; Value: 625

(define (repeated f n)
  (define (iter count total)
    (if (= count 0)
      total
      (iter (- count 1) (f total))))
  (lambda (x) (iter n x)))

((repeated square 2) 5)
