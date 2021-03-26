     (DEFUN S (X0) (LIST X0))
     (DEFUN ADD (X0 X1)
            (COND ((ENDP X0) X1)
                  ((CONSP X0) (S (ADD (CAR X0) X1)))))
     (DEFUN EVEN (X0)
            (COND ((ENDP X0) T)
                  ((CONSP X0) (EVEN X))))
     (DEFUN MUL (X0 X1)
            (COND ((ENDP X0) X0)
                  ((CONSP X0)
                   (ADD (MUL (CAR X0) X1) X1))))
     (DEFTHM THEOREM (EVEN (S ZERO)))
     (DEFTHM THEOREM
             (=> (OR (EVEN X) (EVEN Y))
                 (EVEN (MUL X Y)))))
