; Complete the following definition of a procedure that generates the set of
; subsets of a set and give a clear explanation of why it works:

(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest))))) 

(subsets (list 1 2 3)) 

