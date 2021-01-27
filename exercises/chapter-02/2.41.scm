(load "2.40.scm")

; Write a procedure to find all ordered triples of distinct positive integers i
; , j , and k less than or equal to a given integer n that sum to a given
; integer s.

(define (unique-triplets n)
  (flatmap (lambda (i)
            (flatmap (lambda (j)
                       (map (lambda (k)
                              (list i j k))
                            (enumerate-interval 1 (- j 1))))
                (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (sum-triplet n)
  (+ (list-ref n 0) (list-ref n 1) (list-ref n 2)))

(sum-triplet (list 1 2 3))

(define (find-triplets n s)
    (list-transform-positive 
      (unique-triplets n) 
      (lambda (x) (= (sum-triplet x) s))))

(find-triplets 4 6)
(find-triplets 6 9)
