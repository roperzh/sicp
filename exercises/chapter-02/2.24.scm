; Suppose we evaluate the expression (list 1 (list 2 (list 3 4))). Give the
; result printed by the interpreter, the corresponding box-and-pointer
; structure, and the interpretation of this as a tree

(list 1 (list 2 (list 3 4)))

; Box representation:
;
; (1 (2 (3 4)))
;       +
;       v
; +----------+      +-----------+
; |  1  |    +----->+     |-----|
; +-----+----+      +--+--------+
;                      |
;                      v
;                +----------+   +---------+
;                |  2  |    +-->+    |----|
;                +-----+----+   +--+------+
;                                  |
;                                  v
;                            +----------+     +---------+
;                            |  3  |    +---> |  4 |----|
;                            +-----+----+     +---------+


; Tree representation:
;
;              (1 (2 (3 4)))
;                  /  \ 
;                 1   (2 (3 4))
;                        /   \
;                       2  (3 4)
;                           /  \
;                          3    4
