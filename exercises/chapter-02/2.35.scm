(load "2.33.scm")
(load "2.28.scm")

; Redefine count-leaves from 2.2.2 as an accumulation:

(define (count-leaves t)
  (accumulate (lambda (item total) (+ 1 total)) 0 (map fringe t)))

(define x (cons (list 1 2) (list 3 4)))

(count-leaves x)
(= 4 (count-leaves x))

(= 8 (count-leaves (list x x)))
