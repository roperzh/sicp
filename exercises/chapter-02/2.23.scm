; The procedure for-each is similar to map. It takes as arguments a procedure
; and a list of elements. However, rather than forming a list of the results,
; for-each just applies the procedure to each of the elements in turn, from
; left to right. The values returned by applying the procedure to the elements
; are not used at all—for-each is used with procedures that perform an action,
; such as printing The value returned by the call to for-each (not illustrated
; above) can be something arbitrary, such as true. Give an implementation of
; for-each.

(define (custom-for-each f lst)
  (if (null? lst)
      true
      (and (f (car lst)) (custom-for-each f (cdr lst)))))
      

(custom-for-each
 (lambda (x) (newline) (display x))
 (list 57 321 88))
