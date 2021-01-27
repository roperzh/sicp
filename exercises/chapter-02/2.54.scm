; We can define equal? recursively in terms of the basic eq? equality of
; symbols by saying that a and b are equal? if they are both symbols and the
; symbols are eq?, or if they are both lists such that (car a) is equal? to
; (car b) and (cdr a) is equal? to (cdr b). Using this idea, implement equal?
; as a procedure.

(define (custom-equal? a b)
  (cond ((and (pair? a) (pair? b)
          (and 
            (custom-equal? (car a) (car b)) 
            (custom-equal? (cdr a) (cdr b)))))
        (else (eq? a b))))

(custom-equal? 1 1)
(custom-equal? 3 1)
(custom-equal? (list 1 2 3) (list 1 2 3))
(custom-equal? (list 1 2 3) (list 1 4 3))

