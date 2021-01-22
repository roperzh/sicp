; Demonstrate that the Carmichael numbers listed in Footnote 47 really do fool
; the Fermat test. That is, write a procedure that takes an integer n and tests
; whether a n is congruent to a modulo n for every a < n , and try your
; procedure on the given Carmichael numbers.

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (charmichael-tester n)
  (newline)
  (define (try-it a)
    (= (expmod a n n) a))
  (define (loop a)
    (cond ((= a 0) (display "fools the Fermat test"))
          ((try-it a) (loop (- a 1)))
          (else (display "does not fool the Fermat test"))))
  (loop (- n 1)))

(charmichael-tester 561)
(charmichael-tester 1105)
(charmichael-tester 4)
(charmichael-tester 61)
