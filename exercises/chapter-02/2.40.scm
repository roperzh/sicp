(load "2.33.scm")

; Define a procedure unique-pairs that, given an integer n , generates the
; sequence of pairs ( i , j ) with 1 ≤ j < i ≤ n .
(define nil '())

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low
            (enumerate-interval
             (+ low 1)
             high))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (unique-pairs n)
  (flatmap (lambda (i)
            (map (lambda (j)
                   (list i j))
                (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(unique-pairs 3)

; Use unique-pairs to simplify the definition of prime-sum-pairs given above.

;(define (prime-sum-pairs n)
;  (map make-pair-sum
;       (filter
;        prime-sum?
;        (unique-pairs n))))
;
