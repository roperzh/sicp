; Define a procedure square-tree analogous to the square-list procedure of
; Exercise 2.21.

(define (square-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (square tree))
        (else
          (cons (square-tree (car tree))
                (square-tree (cdr tree))))))

(define (square-tree-map tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree-map sub-tree)
             (square sub-tree)))
      tree))

; square-tree should behave as follows:

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))

(square-tree-map
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))

; (1 (4 (9 16) 25) (36 49))

