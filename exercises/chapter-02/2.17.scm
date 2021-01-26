; Define a procedure last-pair that returns the list that contains only the
; last element of a given (nonempty) list:

(define (last-pair lst)
  (list (list-ref lst (- (length lst) 1))))

(last-pair (list 23 72 149 34))
