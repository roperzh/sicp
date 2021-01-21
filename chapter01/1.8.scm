; Implement a cube-root procedure analogous to the square-root procedure

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess)) 0.000000000000000001))

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x) x)))

(= (cube-root-iter 1.0 216) 6)
(= (cube-root-iter 1.0 551368) 82)
