; Write a procedure that computes elements of Pascal’s triangle by means of a
; recursive process.

(define (pascal row column)
  (if (or (= column row) (= column 1))
      1
      (+
        (pascal (- row 1) column)
        (pascal (- row 1) (- column 1)))))

(= (pascal 1 1) 1)
(= (pascal 2 1) 1)
(= (pascal 2 2) 1)
(= (pascal 3 2) 2)
(= (pascal 3 3) 1)
(= (pascal 3 1) 1)
(= (pascal 4 2) 3)
(= (pascal 5 3) 6)
