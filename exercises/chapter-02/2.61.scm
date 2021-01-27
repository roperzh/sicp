; Give an implementation of adjoin-set using the ordered representation. By
; analogy with element-of-set? show how to take advantage of the ordering to
; produce a procedure that requires on the average about half as many steps as
; with the unordered representation.

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

; Since adjoin-set uses `element-of-set?`, it grows proportionally to it,
; giving an average number of steps at about n/2 (still O(n) growth)
