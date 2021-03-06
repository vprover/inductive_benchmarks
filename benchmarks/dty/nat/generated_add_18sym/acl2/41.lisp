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
             (= (ADD (ADD (S V3)
                          (ADD (ADD V0 (S V1))
                               (S (ADD V0 (S V2)))))
                     (ADD (S V4)
                          (S (ADD (S (S V5)) (S (S V4))))))
                (ADD (S (S (S (ADD (ADD V4 (ADD V0 V1)) V5))))
                     (S (S (ADD (S (S (ADD V0 (ADD (S V4) (S (S V2))))))
                                V3)))))))
