; Define a procedure reverse that takes a list as argument and returns a list
; of the same elements in reverse order:

(define (rvs lst)
  (define (iter idx new-lst)
    (if (= idx (length lst))
        new-lst
        (iter (+ idx 1) (cons (list-ref lst idx) new-lst))))
  (iter 0 (list)))

(rvs (list 1 4 9 16 25))
