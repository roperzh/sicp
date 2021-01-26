; Use dotted-tail notation to write a procedure same-parity that takes one or
; more integers and returns a list of all the arguments that have the same
; even-odd parity as the first argument

(define (parity-tester-creator n)
  (if (even? n) even? odd?))

(define (same-parity p . w)
  (define has-same-parity?
    (parity-tester-creator p))

  (define (iter lst new-list)
      (cond ((null? lst) new-list)
            ((has-same-parity? (car lst)) (iter (cdr lst) (cons (car lst) new-list)))
            (else (iter (cdr lst) new-list))))

  (iter w (list p)))

; For example:

(same-parity 1 2 3 4 5 6 7)
; (1 3 5 7)

(same-parity 2 3 4 5 6 7)
; (2 4 6)
