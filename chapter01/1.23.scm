; The smallest-divisor procedure shown at the start of this section does lots
; of needless testing: After it checks to see if the number is divisible by 2
; there is no point in checking to see if it is divisible by any larger even
; numbers. This suggests that the values used for test-divisor should not be 2,
; 3, 4, 5, 6, …, but rather 2, 3, 5, 7, 9, …. To implement this change, define
; a procedure `next` that returns 3 if its input is equal to 2 and otherwise
; returns its input plus 2. Modify the smallest-divisor procedure to use (next
; test-divisor) instead of (+ test-divisor 1). With timed-prime-test
; incorporating this modified version of smallest-divisor, run the test for
; each of the 12 primes found in Exercise 1.22. Since this modification halves
; the number of test steps, you should expect it to run about twice as fast. Is
; this expectation confirmed? If not, what is the observed ratio of the speeds
; of the two algorithms, and how do you explain the fact that it is different
; from 2? 

(define (next n)
  (if (= n 2) 3 (+ n 2)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-divisor
               n
               (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

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


; 10^9
(timed-prime-test 1000000007) ; old *** 2.0000000000000004e-2 | new 9.999999999999998e-3
(timed-prime-test 1000000009) ; old *** 2.0000000000000004e-2 | new 1.0000000000000002e-2
(timed-prime-test 1000000021) ; old *** 2.0000000000000018e-2 | new 2.0000000000000004e-2

; 10^11
(timed-prime-test 100000000003) ; old *** .22                | new .15
(timed-prime-test 100000000019) ; old *** .21999999999999997 | new .13999999999999999
(timed-prime-test 100000000057) ; old *** .21999999999999997 | new .14

; 10^13
(timed-prime-test 10000000000037) ; old *** 2.2500000000000004 | new 1.4
(timed-prime-test 10000000000051) ; old *** 2.25               | new 1.43
(timed-prime-test 10000000000099) ; old *** 2.24               | new 1.42
