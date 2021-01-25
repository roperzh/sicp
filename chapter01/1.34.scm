; Suppose we define the procedure

(define (f g) (g 2))

; Then we have

(f square)
; Value: 4

(f (lambda (z) (* z (+ z 1))))
; Value: 6

; What happens if we (perversely) ask the interpreter to evaluate the
; combination (f f)? Explain.

(f f)

; It will error because will try to use `2` as a function, this can be clearly
; seen by using substitution:
;
; (f f)
; (f 2)
; (2 2)
