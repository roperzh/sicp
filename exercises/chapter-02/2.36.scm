(load "2.33.scm")

; The procedure accumulate-n is similar to accumulate except that it takes as
; its third argument a sequence of sequences, which are all assumed to have the
; same number of elements. It applies the designated accumulation procedure to
; combine all the first elements of the sequences, all the second elements of
; the sequences, and so on, and returns a sequence of the results.
; Fill in the missing expressions in the following definition of accumulate-n:

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map (lambda (x) (car x)) seqs))
            (accumulate-n op init (map (lambda (x) (cdr x)) seqs)))))

(define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
(accumulate-n + 0 s)
