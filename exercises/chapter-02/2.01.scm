; Define a better version of make-rat that handles both positive and negative
; arguments. Make-rat should normalize the sign so that if the rational number
; is positive, both the numerator and denominator are positive, and if the
; rational number is negative, only the numerator is negative.

(define (make-rat n d)
  (let ((abs-n (abs n))
        (abs-d (abs d)))
      (cond ((and (< n 0) (< d 0)) (cons abs-n abs-d))
        ((or (< n 0) (< d 0)) (cons (* -1 abs-n) abs-d))
        (else (cons n d)))))

(define positive (make-rat 1 2))
(define negative (make-rat 1 -2))
(define double-negative (make-rat -1 -2))

(display positive)
(display negative)
(display double-negative)
