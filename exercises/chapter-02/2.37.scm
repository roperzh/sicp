(load "2.36.scm")

; Fill in the missing expressions in the following procedures for computing the
; other matrix operations.

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (mi) (dot-product mi v)) m))

(define (transpose mat)
  (accumulate-n cons '() mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (matrix-*-vector cols row)) m)))

(define m (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9) (list 4 2 3 1)))
(define v (list 1 2 3 4))
(dot-product v v)
(matrix-*-vector m v)
(transpose m)
(matrix-*-matrix m m)
