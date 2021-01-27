; Give a Θ ( n ) implementation of union-set for sets represented as ordered
; lists.

(define (union-set s1 s2)
  (fold-right adjoin-set s1 s2))

; Note: I'm using the same definition given in 2.59 because now the underlying
; `adjoint-set` operation has O(n) growth
