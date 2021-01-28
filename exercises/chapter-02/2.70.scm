(load "2.68.scm")
(load "2.69.scm")

; The following eight-symbol alphabet with associated relative frequencies was
; designed to efficiently encode the lyrics of 1950s rock songs. (Note that the
; “symbols” of an “alphabet” need not be individual letters.)
; 
; A    2    NA  16
; BOOM 1    SHA  3
; GET  2    YIP  9
; JOB  2    WAH  1
;
; Use generate-huffman-tree (Exercise 2.69) to generate a corresponding Huffman
; tree, and use encode (Exercise 2.68) to encode the following message:  
; 
; Get a job
; Sha na na na na na na na na
;
; Get a job
; Sha na na na na na na na na
;
; Wah yip yip yip yip 
; yip yip yip yip yip
; Sha boom

(define pairs '((A 2) (BOOM 1) (GET 2) (JOB 2) (NA 16) (SHA 3) (YIP 9) (WAH 1)))
(define tree (generate-huffman-tree pairs))
(define line1 (encode '(get a job sha na na na na na na na na) tree))
(define line2 (encode '(wah yip yip yip yip yip yip yip yip yip sha boom) tree))
(define message (append line1 line1 line2))
(display message)
(decode message tree)

