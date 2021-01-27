(load "binary-trees.scm")

; Each of the following two procedures converts a binary tree to a list.

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append
       (tree->list-1
        (left-branch tree))
       (cons (entry tree)
             (tree->list-1
              (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list
         (left-branch tree)
         (cons (entry tree)
               (copy-to-list
                (right-branch tree)
                result-list)))))
  (copy-to-list tree '()))

; 1. Do the two procedures produce the same result for every tree? If not, how
; do the results differ? What lists do the two procedures produce for the trees
; in Figure 2.16?

(define t (make-tree 4 (make-tree 2 '() 1) (make-tree 5 '() 9)))
(left-branch (left-branch t))
(right-branch t)
(tree->list-1 t)
(tree->list-2 t)

; 2. Do the two procedures have the same order of growth in the number of steps
; required to convert a balanced tree with n elements to a list? If not, which
; one grows more slowly?
