;; Ben Bitdiddle has invented a test to determine whether the interpreter he is
;; faced with is using applicative-order evaluation or normal-order evaluation.
;; He defines the following two procedures: 

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

;; Then he evaluates the expression

(test 0 (p))

;; What behavior will Ben observe with an interpreter that uses
;; applicative-order evaluation?  Answer: the interpreter will never be able to
;; finish the evaluation of the expression, it will try to evaluate the
;; expression `(p)` before calling the procedure `test`, causing an infinite
;; loop

;; What behavior will he observe with an interpreter that uses normal-order
;; evaluation?  The interpreter will return `0` because it never gets to
;; evaluate the `(p)` expression: parameters are left to be evaluated at last,
;; and the first branch of the `if` expression evaluates first returning zero
