; Using `time-prime-test`, write a procedure search-for-primes that checks the
; primality of consecutive odd integers in a specified range. Use your
; procedure to find the three smallest primes larger than 1000; larger than
; 10,000; larger than 100,000; larger than 1,000,000. Note the time needed to
; test each prime.

(define (divides? a b)
  (= (remainder b a) 0))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-divisor
               n
               (+ test-divisor 1)))))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
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

(search-for-primes 1000 1020) ; 10^3
; 1009 *** 0.
; 1013 *** 0.
; 1019 *** 0.

(search-for-primes 10000 10040) ; 10^4
; 10007 *** 0.
; 10009 *** 0.
; 10037 *** 0.

(search-for-primes 100000 100050) ; 10^5
; 100003 *** 0.
; 100019 *** 0.
; 100043 *** 0.

(search-for-primes 1000000 1000050) ; 10^6
; 1000003 *** 0.
; 1000033 *** 0.
; 1000037 *** 0.

(search-for-primes 10000000 10000150) ; 10^7
; 10000019 *** 1.0000000000000002e-2
; 10000079 *** 0.
; 10000103 *** 0.

(search-for-primes 1000000000 1000000150) ; 10^9
; 1000000007 *** 2.0000000000000004e-2
; 1000000009 *** 2.0000000000000004e-2
; 1000000021 *** 2.0000000000000018e-2

(search-for-primes 100000000000 100000000150) ; 10^11
; 100000000003 *** .22
; 100000000019 *** .21999999999999997
; 100000000057 *** .21999999999999997

(search-for-primes 10000000000000 10000000000150) ; 10^13
; 10000000000037 *** 2.2500000000000004
; 10000000000051 *** 2.25
; 10000000000099 *** 2.24

