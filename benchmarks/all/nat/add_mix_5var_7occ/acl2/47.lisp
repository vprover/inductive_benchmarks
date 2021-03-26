     (DEFUN S (X0) (LIST X0))
     (DEFUN ADD (X0 X1)
            (COND ((ENDP X0) X1)
                  ((CONSP X0) (S (ADD (CAR X0) X1)))))
     (DEFUN LEQ (X0 X1)
            (COND ((ENDP X0) T)
                  ((AND (CONSP X0) (ENDP X1)) NIL)
                  ((AND (CONSP X0) (CONSP X1))
                   (LEQ (CAR X0) (CAR X1)))))
     (DEFTHM THEOREM
             (= (ADD V2
                     (ADD (ADD (ADD (ADD V1 V2) V0) (ADD V3 V4))
                          V3))
                (ADD (ADD V2
                          (ADD V3 (ADD (ADD (ADD V2 V0) V4) V1)))
                     V3))))
