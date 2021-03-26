 (DEFUN S (X0) (LIST X0))
 (DEFUN ADD (X0 X1)
        (COND ((ENDP X0) X1)
              ((CONSP X0) (S (ADD (CAR X0) X1)))))
 (DEFUN LEQ (X0 X1)
        (COND ((ENDP X0) T)
              ((AND (CONSP X0) (ENDP X1)) NIL)
              ((AND (CONSP X0) (CONSP X1))
               (LEQ (CAR X0) (CAR X1)))))
 (DEFTHM
    THEOREM
    (= (S (ADD (ADD (ADD (S ZERO) (S (S (S V4))))
                    (ADD (S (S ZERO)) V1))
               (ADD (S (S (ADD V0 (S V2))))
                    (ADD (S V3) (S (S V0))))))
       (ADD (ADD V2
                 (ADD (S (S (S (S (ADD V0
                                       (S (ADD (S V0) (S (S (S ZERO))))))))))
                      (ADD ZERO (S (S (S (ADD V3 V1)))))))
            (S V4)))))
