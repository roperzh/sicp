; Fill in the missing expressions to complete the following definitions of some
; basic list-manipulation operations as accumulations:

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op
                      initial
                      (cdr sequence)))))

(define (custom-map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) 
              '() sequence))

(define (custom-append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (custom-length sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))


(custom-map square (list 1 2 3))
(custom-length (list 1 2 3))
(custom-append (list 1) (list 2 3))

