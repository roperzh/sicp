; Give combinations of cars and cdrs that will pick 7 from each of the
; following lists:

(define list-1 (list 1 3 (list 5 7) 9))
(car (cdr (car (cdr (cdr list-1)))))

(define list-2 (list (list 7)))
(car (car list-2))

(define list-3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr list-3))))))))))))
