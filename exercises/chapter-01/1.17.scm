; One can perform integer multiplication by means of repeated addition. The
; following multiplication procedure (in which it is assumed that our language
; can only add, not multiply) is analogous to the expt procedure:

(define (mult-linear a b)
  (if (= b 0)
      0
      (+ a (mult-linear a (- b 1)))))

; This algorithm takes a number of steps that is linear in b. Now suppose we
; include, together with addition, operations double, which doubles an integer,
; and halve, which divides an (even) integer by 2. Using these, design a
; multiplication procedure analogous to fast-expt that uses a logarithmic
; number of steps.

(define (double x) (+ x x))
(define (halve x)  (/ x 2))

(define (fast-mult b n)
  (cond ((= n 1)
         b)
        ((even? n)
         (double (fast-mult b (halve n))))
        (else
          (+ b (fast-mult b (- n 1))))))

(= (fast-mult 1 1) 1)
(= (fast-mult 0 4) 0)
(= (fast-mult 4 4) 16)
(= (fast-mult 5 7) 35)
(= (fast-mult 9 2) 18)
