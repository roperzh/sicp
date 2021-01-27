; Implement the union-set operation for the unordered-list representation of
; sets.

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (union-set s1 s2)
  (fold-right adjoin-set s1 s2))

(union-set (list 1 2 3) (list 1 3 4))
