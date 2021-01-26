(load "2.38.scm")

; Complete the following definitions of reverse (Exercise 2.18) in terms of
; fold-right and fold-left from Exercise 2.38: 

(define (reverse-fr sequence)
  (fold-right
   (lambda (x y) (append y (list x))) '() sequence))

(define (reverse-fl sequence)
  (fold-left
   (lambda (x y) (cons y x)) '() sequence))

(reverse-fr (list 1 2 3))
(reverse-fl (list 1 2 3))
