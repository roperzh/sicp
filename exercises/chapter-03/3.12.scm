; Consider the interaction

(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))
; z
; (a b c d)

(cdr x)
; <response>

(define w (append! x y))
; w
; (a b c d)

(cdr x)
; <response>

; What are the missing <response>s?

; Answer:
;   - The first call will be  (b) as expected because `apend` does not mutate x
;   - The second call will be (b c d) because `append!` mutates `x` by
;     appending recursively all the elements from `y` to `x`

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))
