; Modify the timed-prime-test procedure of Exercise 1.22 to use fast-prime?
; (the Fermat method), and test each of the 12 primes you found in that
; exercise. Since the Fermat test has Θ ( log ⁡ n ) growth, how would you
; expect the time to test primes near 1,000,000 to compare with the time needed
; to test primes near 1000? Do your data bear this out? Can you explain any
; discrepancy you find?

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

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n)
         (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
      (report-prime (- (runtime) 
                       start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes range)
  ((timed-prime-test range)
  (cond ((= range 000) (search-for-primes (- range 1))))))

(define (search-for-primes minimum maximum)
  (timed-prime-test minimum)
  (if (> (- maximum minimum) 0) (search-for-primes (+ minimum 1) maximum)))

; 10^9
(timed-prime-test 1000000007) ; old *** 2.0000000000000004e-2 | new 0.
(timed-prime-test 1000000009) ; old *** 2.0000000000000004e-2 | new 0.
(timed-prime-test 1000000021) ; old *** 2.0000000000000018e-2 | new 0.

; 10^11
(timed-prime-test 100000000003) ; old *** .22                | new 0.
(timed-prime-test 100000000019) ; old *** .21999999999999997 | new 0.
(timed-prime-test 100000000057) ; old *** .21999999999999997 | new 0.

; 10^13
(timed-prime-test 10000000000037) ; old *** 2.2500000000000004 | new 0.
(timed-prime-test 10000000000051) ; old *** 2.25               | new 0.
(timed-prime-test 10000000000099) ; old *** 2.24               | new 0.

