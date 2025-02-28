; In section 3.2.3 we saw how the environment model described the behavior of
; procedures with local state. Now we have seen how internal definitions work.
; A typical message-passing procedure contains both of these aspects. Consider
; the bank account procedure of section 3.1.1:

(define (make-account balance)
    (define (withdraw amount)
          (if (>= balance amount
                    (begin (set! balance (- balance amount
                                          balance)
                            "Insufficient funds"))))
      (define (deposit amount)
            (set! balance (+ balance amount)
                balance)
        (define (dispatch m)
              (cond ((eq? m 'withdraw) withdraw
                              ((eq? m 'deposit) deposit
                                        (else (error "Unknown request -- MAKE-ACCOUNT"
                                                                            m)))))
          dispatch))))

; Show the environment structure generated by the sequence of interactions

(define acc (make-account 50))

((acc 'deposit) 40)
90

((acc 'withdraw) 60)
30

; Where is the local state for acc kept? Suppose we define another account

(define acc2 (make-account 100))

; Answer: the local state for each acc is kept in a new environment created
; each time the procedure `make-account` is called

; How are the local states for the two accounts kept distinct? Which parts of
; the environment structure are shared between acc and acc2?

; Answer: the local states are kept distinct because they live in completely
; different enviornments, the only thing that is shared is the definition of
; the procedure
;
