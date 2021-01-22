; Using the substitution method (for normal order), illustrate the process
; generated in evaluating (gcd 206 40) and indicate the remainder operations
; that are actually performed.

(define (remainder a b)
  (modulo a b))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; Normal order:
;
; 1: (gcd 206 40)
; 2: (gcd 40 (remainder 206 40))
; 3: (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
; 4: (gcd
;       (remainder 40 (remainder 206 40))
;       (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
; 5: (gcd
;       (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;       (remainder 
;           (remainder 40 (remainder 206 40))
;           (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
; 6: (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
; 7: (remainder (remainder 206 40) (remainder 40 6))
; 8: (remainder (remainder 206 40) 4)
; 9: (remainder 6 4)
; 10: 2

; How many remainder operations are actually performed in the normal-order
; evaluation of (gcd 206 40)? In the applicative-order evaluation?

; Answer:
;   - in applicative-order, the number of operations is the same as the number
;   of steps, therefore `Θ (log n)`
;   - in normal order, the `b` parameter has to be evaluated on every step,
;   therefore ~ `Θ n(log n)`
