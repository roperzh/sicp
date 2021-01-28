; 2.3.2 described a program that performs symbolic differentiation. We can regard
; this program as performing a dispatch on the type of the expression to be
; differentiated. In this situation the “type tag” of the datum is the
; algebraic operator symbol (such as +) and the operation being performed is
; deriv. We can transform this program into data-directed style by rewriting
; the basic derivative procedure as

(define (deriv exp var)
   (cond ((number? exp) 0)
         ((variable? exp)
          (if (same-variable? exp var)
              1
              0))
         (else ((get 'deriv (operator exp))
                (operands exp)
                var))))

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

; 1. Explain what was done above. Why can’t we assimilate the predicates number?
; and variable? into the data-directed dispatch?

; Data-directed programming was used to abstract the logic to differentiate
; specific operations (+, *, etc) into generic operations that can be defined
; independently. We can't assimilate number? and variable? because they aren't
; operations.

; 2. Write the procedures for derivatives of sums and products, and the
; auxiliary code required to install them in the table used by the program
; above. 

(define (install-basic-operations-package)
  (define (deriv-sum exp)
    (make-sum (deriv (addend exp) var
                  (deriv (augend exp) var))))
  (define (deriv-product exp)
    (make-sum
           (make-product 
            (multiplier exp)
            (deriv (multiplicand exp) var))
           (make-product 
            (deriv (multiplier exp) var)
            (multiplicand exp))))

  (put 'deriv '(+) deriv-sum)
  (put 'deriv '(*) deriv-product))

; 3. Choose any additional differentiation rule that you like, such as the one
; for exponents (Exercise 2.56), and install it in this data-directed system.

(define (install-extra-operations-package)
  (define (deriv-expt exp)
    (make-product
           (make-product
             (exponent exp)
             (make-exponentiation (base exp) (- (exponent exp) 1)))
           (deriv (base exp) var)))
  (put 'deriv '(**) deriv-expt))

; 4. In this simple algebraic manipulator the type of an expression is the
; algebraic operator that binds it together. Suppose, however, we indexed the
; procedures in the opposite way, so that the dispatch line in deriv looked
; like
;
; ((get (operator exp) 'deriv) 
;  (operands exp) var)
;
; What corresponding changes to the derivative system are required?

; We only need to change the order of the arguments in the `get` call of
; `deriv`
