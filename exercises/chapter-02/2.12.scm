(load "2.07.scm")
(load "2.1.4-extended-exercise-definitions.scm")

; Define a constructor make-center-percent that takes a center and a percentage
; tolerance and produces the desired interval. You must also define a selector
; percent that produces the percentage tolerance for a given interval. The
; center selector is the same as the one shown above.

(define (make-center-percent center percent-tolerance)
  (let ((w (* percent-tolerance center)))
      (make-interval (- center w) (+ center w))))

(define (percent interval)
  (let ((c (center interval)))
      (/ (- c (lower-bound interval)) c)))

(define percent-test 0.10)
(define i (make-center-percent 80 percent-test))
(= percent-test (percent i))
