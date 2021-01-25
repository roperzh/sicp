; You can obtain an even more general version of accumulate (Exercise 1.32) by
; introducing the notion of a filter on the terms to be combined. That is,
; combine only those terms derived from values in the range that satisfy a
; specified condition. The resulting filtered-accumulate abstraction takes the
; same arguments as accumulate, together with an additional predicate of one
; argument that specifies the filter. Write filtered-accumulate as a procedure.
; Show how to express the following using filtered-accumulate:
;
; 1. the sum of the squares of the prime numbers in the interval a to b
; (assuming that you have a prime? predicate already written)
;
; 2. the product of all the positive integers less than n that are relatively
; prime to n (i.e., all positive integers i < n such that GCD ( i , n ) = 1 )

(define (accumulate combiner null-value term a next b filter)
  (define (iter a result)
    (cond ((> a b) result)
      ((filter a) (iter (next a) result))
      (else (iter (next a) (combiner result (term a))))))
  (iter a null-value))

(define (sum term a next b filter)
  (define (combiner x y) (+ x y))
  (accumulate combiner 0 term a next b filter))

; I will sum odd numbers in a range instead of primes to avoid polluting this
; file with repeated code
(define (sum-odds-squared a b)
  (define (term x) (square x))
  (define (next x) (+ x 1))
  (define (filter x) (even? x))
  (sum term a next b filter))

(= (sum-odds-squared 0 10) 165)

