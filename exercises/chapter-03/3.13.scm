(load "3.12.scm")
; Consider the following make-cycle procedure, which uses the last-pair
; procedure defined in exercise 3.12:

(define (make-cycle x)
    (set-cdr! (last-pair x) x)
    x)

(last-pair (list 'a 'b 'c))

; Draw a box-and-pointer diagram that shows the structure z created by z

(define z (make-cycle (list 'a 'b 'c)))

; z  | a | . | -> | b | . | ->|   | / |
;                               |
;      ^------------------------|

; What happens if we try to compute (last-pair z)?

; Answer: we enter in an infinite loop
