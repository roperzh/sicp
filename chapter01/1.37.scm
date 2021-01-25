; Define a procedure cont-frac such that evaluating (cont-frac n d k) computes
; the value of the k -term finite continued fraction.

(define (cont-frac n d k)
  (define (iter count total)
    (let ((nextn (n count))
          (nextd (d count)))
      (if (= count 0)
        total
        (iter (- count 1) (/ nextn (+ nextd total))))))
  (iter k (/ (n k) (d k))))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)

; we need to make k = 10 to get an approximation of at least 4 decimal places
