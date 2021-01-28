(load "huffman-trees.scm")
(load "2.67.scm")

; The encode procedure takes as arguments a message and a tree and produces the
; list of bits that gives the encoded message.

(define (encode message tree)
  (if (null? message)
      '()
      (append
       (encode-symbol (car message)
                      tree)
       (encode (cdr message) tree))))

; Encode-symbol is a procedure, which you must write, that returns the list of
; bits that encodes a given symbol according to a given tree. You should design
; encode-symbol so that it signals an error if the symbol is not in the tree at
; all. Test your procedure by encoding the result you obtained in Exercise 2.67
; with the sample tree and seeing whether it is the same as the original sample
; message.

(define (move-right? tree symbol)
  (let ((right (symbols (right-branch tree))))
      (memq symbol right)))

(define (encode-symbol symbol tree)
  (define (encoder subtree code)
    (cond ((leaf? subtree)
           code)
          ((move-right? subtree symbol)
           (encoder (right-branch subtree) (append code '(1))))
          (else
            (encoder (left-branch subtree) (append code '(0))))))
  (encoder tree '()))

; (trace encode-symbol)
(encode '(a d a b b c a) sample-tree)
; Output:          (0 1 1 0 0 1 0 1 0 1 1 1 0)
; Expected output: (0 1 1 0 0 1 0 1 0 1 1 1 0)

(decode (encode '(a d a b b c a) sample-tree) sample-tree)
