(load "2.12.scm")

; [...] He has written the following two programs, each of which computes the
; parallel-resistors formula differently:

(define (par1 r1 r2)
  (div-interval
   (mul-interval r1 r2)
   (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
     one
     (add-interval
      (div-interval one r1)
      (div-interval one r2)))))

; Lem complains that Alyssa’s program gives different answers for the two ways
; of computing. This is a serious complaint.
; Demonstrate that Lem is right.

(define A (make-center-percent 8 0.1))
(define B (make-center-percent 12 0.02))

(par1 A B)
(par2 A B)

; Investigate the behavior of the system on a
; variety of arithmetic expressions. Make some intervals A and B , and use them
; in computing the expressions A / A and A / B . You will get the most insight
; by using intervals whose width is a small percentage of the center value.
; Examine the results of the computation in center-percent form


(define a-div-b (div-interval A B))
(define a-div-a (div-interval A A))

(percent a-div-b)
(percent a-div-a)

