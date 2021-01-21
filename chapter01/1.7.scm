; The good-enough? test used in computing square roots will not be very
; effective for finding the square roots of very small numbers. Also, in real
; computers, arithmetic operations are almost always performed with limited
; precision. This makes our test inadequate for very large numbers.
;
; Explain these statements, with examples showing how the test fails for small
; and large numbers. An alternative strategy for implementing good-enough? is
; to watch how guess changes from one iteration to the next and to stop when
; the change is a very small fraction of the guess. Design a square-root
; procedure that uses this kind of end test. Does this work better for small
; and large numbers?

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

; To account for bigger and smaller values, we can adjust good-enough? to keep
; iterating up until the computer is not able to distinguish between guesses

(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess)) 0.00000000000001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

; For very small numbers, our hardcoded value of `0.001` to measure the
; difference between the guess and the result will be too big, causing the
; results to be imprecise. 
(sqrt-iter 1.0 0.00000000000000000009)

; For very big numbers, the computer can only represent up to a maximum value
; of numbers (this value is primarly capped by the word size of the CPU
; architecture). This implies that up until certain point, the test in the
; `good-enough?` function will not be meaningful anymore.
(sqrt-iter 1.0 10000000000000)

