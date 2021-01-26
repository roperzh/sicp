; Modify your reverse procedure of Exercise 2.18 to produce a deep-reverse
; procedure that takes a list as argument and returns as its value the list
; with its elements reversed and with all sublists deep-reversed as well.

(define (deep-reverse lst)
  (let ((rev (reverse lst)))
    (map (lambda (x) 
           (if (pair? x) 
             (deep-reverse x) 
             x)) 
         rev)))

(define x
  (list (list 1 2) (list 3 4)))

x
; ((1 2) (3 4))

(reverse x)
; ((3 4) (1 2))

(deep-reverse x)
; ((4 3) (2 1))
