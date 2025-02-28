(load "huffman-trees.scm")

; The following procedure takes as its argument a list of symbol-frequency
; pairs (where no symbol appears in more than one pair) and generates a Huffman
; encoding tree according to the Huffman algorithm.

(define (generate-huffman-tree pairs)
  (successive-merge
   (make-leaf-set pairs)))

; Make-leaf-set is the procedure given above that transforms the list of
; pairs into an ordered set of leaves. Successive-merge is the procedure
; you must write, using make-code-tree to successively merge the
; smallest-weight elements of the set until there is only one element left,
; which is the desired Huffman tree. (This procedure is slightly tricky,
; but not really complicated. If you find yourself designing a complex
; procedure, then you are almost certainly doing something wrong. You can
; take significant advantage of the fact that we are using an ordered set
; representation.)

(define (successive-merge pairs)
  (newline)
  (display (length pairs))
  (display pairs)
  (cond ((= (length pairs) 1) (car pairs))
        (else (make-code-tree
                (car pairs)
                (successive-merge (cdr pairs))))))

(define t '((A 4) (B 2) (D 1) (C 1)))
(generate-huffman-tree t)

