; Implement Monte Carlo integration as a procedure estimate-integral that takes
; as arguments a predicate P, upper and lower bounds x1, x2, y1, and y2 for the
; rectangle, and the number of trials to perform in order to produce the
; estimate.

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1)
                 (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1)
                 trials-passed))))
  (iter trials 0))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (estimate-integral p low high x1 x2 y1 y2 trials)
  (define (tester)
    (p (random-in-range low high)
       (random-in-range low high)))

  (define area
      (* (abs (- x2 x1))
         (abs (- y2 y1))))

  (* area (monte-carlo trials tester) 1.0))

(define (circle-tester x y)
    (and (<= (+ (square y) (square x)) 1)))

(estimate-integral circle-tester -1.0 1.0 -1 1 -1 1 50000)
