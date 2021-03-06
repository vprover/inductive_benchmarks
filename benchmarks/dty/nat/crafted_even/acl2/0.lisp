     (DEFUN S (X0) (LIST X0))
     (DEFUN ADD (X0 X1)
            (COND ((ENDP X0) X1)
                  ((CONSP X0) (S (ADD (CAR X0) X1)))))
     (DEFUN EVEN (X0)
            (COND ((ENDP X0) T)
                  ((CONSP X0) (COND
                        ((ENDP (CAR X0)) (NOT T))
                        ((CONSP (CAR X0))
                              (EVEN (CAR (CAR X0))))))))
     (DEFTHM THEOREM
             (IMPLIES (AND (EVEN X) (EVEN Y))
                 (EVEN (ADD X Y)))))
