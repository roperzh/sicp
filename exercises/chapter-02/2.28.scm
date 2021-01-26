; Write a procedure fringe that takes as argument a tree (represented as a
; list) and returns a list whose elements are all the leaves of the tree
; arranged in left-to-right order.

(define (fringe lst)
  (define (iter leaves lst)
    (cond ((null? lst) leaves)
          ((not (pair? lst))
           (cons (car lst) leaves))
          (else 
            (cons leaves 
                  (iter 
                    (car lst)
                    (cdr lst))))))
  (iter '() lst))

(define x
  (list (list 1 2) (list 3 4)))

(fringe x)
; (1 2 3 4)

(fringe (list x x))
; (1 2 3 4 1 2 3 4)
