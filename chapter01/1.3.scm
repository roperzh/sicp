;; Define a procedure that takes three numbers as arguments and returns the sum
;; of the squares of the two larger numbers. 

(define (sum-of-squares x y) (+ (square x) (square y)))

(define (f x y z)
  (cond ((and (> x z) (> y z)) (sum-of-squares x y))
        ((and (> x y) (> z y)) (sum-of-squares x z))
        ((and (> y x) (> z x)) (sum-of-squares y z))))

(= (f 1 2 3) (sum-of-squares 2 3))
(= (f 7 2 3) (sum-of-squares 7 3))
(= (f 7 9 3) (sum-of-squares 7 9))
