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
             (= (ADD (S (ADD (S (ADD (ADD V3 (S V5))
                                     (ADD (S (S V0)) V2)))
                             (ADD (S (S (S V1))) (S V4))))
                     (S (S NIL)))
                (S (ADD (S (ADD (S NIL) (ADD V0 V3)))
                        (ADD V5
                             (ADD (ADD (S (S (S (S (S V2)))))
                                       (S (S (S V1))))
                                  V4)))))))
