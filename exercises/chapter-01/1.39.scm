; Define a procedure (tan-cf x k) that computes an approximation to the tangent
; function based on Lambert’s formula. k specifies the number of terms to
; compute, as in Exercise 1.37.

(define (cont-frac n d k)
  (define (iter count total)
    (newline)
    (display "count:")
    (display count)
    (display " | n:")
    (display (n count))
    (display " | d:")
    (display (d count))
    (display " | total:")
    (display total)
    (let ((nextn (n count))
          (nextd (d count)))
      (if (= count 0)
        total
        (iter (- count 1) (/ nextn (+ nextd total))))))
  (iter k (/ (n k) (d k))))

(define (tan-cf x k)
  (cont-frac
    (lambda (y) (if (= y 1) x (- (* x x))))
    (lambda (y) (- (* 2 y) 1))
    k))

(tan-cf 1.047197551 12)

