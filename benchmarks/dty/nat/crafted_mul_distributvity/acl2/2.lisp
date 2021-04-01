     (DEFUN S (X0) (LIST X0))
     (DEFUN ADD (X0 X1)
            (COND ((ENDP X0) X1)
                  ((CONSP X0) (S (ADD (CAR X0) X1)))))
     (DEFUN MUL (X0 X1)
            (COND ((ENDP X0) X0)
                  ((CONSP X0)
                   (ADD (MUL (CAR X0) X1) X1))))
     (DEFTHM THEOREM
             (= (MUL (ADD X Y) Z)
                (ADD (MUL Z X) (MUL Y Z)))))
