; A function f is defined by the rule that `f(n) = n` if n < 3 and
; `f(n) = f(n − 1) + 2f n − 2) + 3f(n − 3)` if n ≥ 3 .

; Write a procedure that computes f by means of a recursive process.
(define (f-recur n)
  (if (< n 3)
    n
    (+ (f-recur (- n 1)) (* 2 (f-recur (- n 2))) (* 3 (f-recur (- n 3))))))

(f-recur 2)
(f-recur 3)
(f-recur 4)
(f-recur 13)

; Write a procedure that computes f by means of an iterative process.
(define (f-iter a b c count)
  (if (= count 0)
    c
    (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))

(define (f n)
  (f-iter 2 1 0 n))

(f 2)
(f 3)
(f 4)
(f 13)
