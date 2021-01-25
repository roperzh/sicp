; Write a program that uses your cont-frac procedure from Exercise 1.37 to
; approximate e , based on Euler’s expansion.

(define (cont-frac n d k)
  (define (iter count total)
    (let ((nextn (n count))
          (nextd (d count)))
      (if (= count 0)
        total
        (iter (- count 1) (/ nextn (+ nextd total))))))
  (iter k (/ (n k) (d k))))

(define (e)
  (define (n k) 1)
  ; Credits to Joseph Biberstine for the formula posted on OEIS
  ; https://oeis.org/A005131
  (define (d k)
    (let ((x (+ k 2)))
      (if (= (modulo x 3) 1)
        (* 2 (/ (- x 1) 3))
        1)))
  (+ 2 (cont-frac n d 100.0)))

(e)
