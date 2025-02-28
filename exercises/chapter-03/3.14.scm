; The following procedure is quite useful, although obscure:

(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x))))
  (trace loop)
  (loop x '()))

; Loop uses the ``temporary'' variable temp to hold the old value of the cdr of
; x, since the set-cdr! on the next line destroys the cdr. Explain what mystery
; does in general. Suppose v is defined by (define v (list 'a 'b 'c 'd)). Draw
; the box-and-pointer diagram that represents the list to which v is bound.
; Suppose that we now evaluate (define w (mystery v)). Draw box-and-pointer
; diagrams that show the structures v and w after evaluating this expression.
; What would be printed as the values of v and w ?

(define v (list 'a 'b 'c 'd))
(define w (mystery v))

; `mistery` creates a new list with the items of the provided list reversed,
; but it does so by mutating the provided list. After running the program in
; the interpreter to corroborate the results, we get:

(display w)
; (d c b a)

(display v)
; (a)
