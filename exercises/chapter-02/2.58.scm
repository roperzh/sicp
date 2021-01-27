(load "symbolic-differentiation-definitions.scm")
(load "2.56.scm")

;  Suppose we want to modify the differentiation program so that it works with
;  ordinary mathematical notation, in which + and * are infix rather than
;  prefix operators. Since the differentiation program is defined in terms of
;  abstract data, we can modify it to work with different representations of
;  expressions solely by changing the predicates, selectors, and constructors
;  that define the representation of the algebraic expressions on which the
;  differentiator is to operate.
;
; 1. Show how to do this in order to differentiate algebraic expressions
; presented in infix form, such as (x + (3 * (x + (y + 2)))). To simplify the
; task, assume that + and * always take two arguments and that expressions are
; fully parenthesized.

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) 
         (+ a1 a2))
        (else (list a1 '+ a2))))

(define (sum? x)
  (and (pair? x) (eq? (cadr x) '+)))

(define (addend s) (car s))

(define (augend s)
  (reduce make-sum 0 (list-tail s 2)))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0)
             (=number? m2 0))
         0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2))
         (* m1 m2))
        (else (list m1 '* m2))))

(define (product? x)
  (and (pair? x) (eq? (cadr x) '*)))

(define (multiplier p) (car p))

(define (multiplicand p)
  (reduce make-product 1 (list-tail p 2)))

(define var 'x)
(define exp '(x + (3 * (x + (y + 2)))))
(deriv exp var)

; 2. The problem becomes substantially harder if we allow standard algebraic
; notation, such as (x + 3 * (x + y + 2)), which drops unnecessary parentheses
; and assumes that multiplication is done before addition. Can you design
; appropriate predicates, selectors, and constructors for this notation such
; that our derivative program still works?

; Answer: it is possible, but IMO not worth doing here. Funny enough, a well
; known algorithm to evaluate expressions in algebraic notation is regarded as
; "Shunting-yard" and the process involves 'rewritting' the expression in infix
; form.
;
; https://en.wikipedia.org/wiki/Shunting-yard_algorithm
