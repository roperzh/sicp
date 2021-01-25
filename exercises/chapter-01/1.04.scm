;; Observe that our model of evaluation allows for combinations whose operators
;; are compound expressions. Use this observation to describe the behavior of
;; the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; because the interpreter first evaluates the operator and operands and then
;; applies the resulting procedure to the resulting arguments, the `if` special
;; form is evaluated and returns one of `+` or `-` which is afterwards used to
;; evaluate the final expression.
