; Modify the make-account procedure of Exercise 3.3 by adding another local
; state variable so that, if an account is accessed more than seven consecutive
; times with an incorrect password, it invokes the procedure call-the-cops.

(define (call-the-cops) (error "The cops have been alerted! run for your life"))

(define (make-account balance password)
  (let ((safety-checker 0))
    (define (wrong-password-handler)
      (set! safety-checker (+ safety-checker 1))
      (if (>= safety-checker 7)
        (call-the-cops)
        (error "Wrong password")))
        
    (define (valid-password? check)
      (not (eq? password check)))
    (define (withdraw amount)
      (if (>= balance amount)
          (begin (set! balance 
                       (- balance amount))
                 balance)
          "Insufficient funds"))
    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)
    (define (dispatch password-check m)
      (cond ((valid-password? password-check) (wrong-password-handler))
            ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            (else (error "Unknown request: 
                   MAKE-ACCOUNT" m))))
    dispatch))

(define acc (make-account 100 'pass))
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
