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
             (= (ADD (ADD (S (S V3))
                          (S (S (ADD (ADD V1 (S V2)) V5))))
                     (ADD (S V0) V4))
                (S (S (ADD V3
                           (ADD (ADD (ADD V1 (S (S (S V0))))
                                     (ADD (S V4) V2))
                                V5)))))))