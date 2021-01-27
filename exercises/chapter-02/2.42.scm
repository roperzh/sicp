; We implement this solution as a procedure queens, which returns a sequence of
; all solutions to the problem of placing n queens on an n × n chessboard.
; Queens has an internal procedure queen-cols that returns the sequence of all
; ways to place queens in the first k columns of the board.

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions)
           (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position
                    new-row
                    k
                    rest-of-queens))
                 (enumerate-interval
                  1
                  board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

; In this procedure rest-of-queens is a way to place k − 1 queens in the first k
; − 1 columns, and new-row is a proposed row in which to place the queen for
; the k th column. Complete the program by implementing the representation for
; sets of board positions, including the procedure adjoin-position, which
; adjoins a new row-column position to a set of positions, and empty-board,
; which represents an empty set of positions. You must also write the procedure
; safe?, which determines for a set of positions, whether the queen in the k th
; column is safe with respect to the others..


