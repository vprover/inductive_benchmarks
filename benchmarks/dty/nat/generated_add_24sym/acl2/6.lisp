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
      (= (S (S (S (ADD (ADD (ADD (S (S V7)) (S V4))
                            (ADD (ADD (S (ADD (S V1) (S V0)))
                                      (ADD (S V6) (S V1)))
                                 (S V5)))
                       (ADD (S V2) (S (S V3)))))))
         (S (ADD (ADD V7
                      (S (S (ADD (ADD (S (ADD V1 (S (S (S (S (S (S V1))))))))
                                      (S V3))
                                 V6))))
                 (S (ADD (ADD (ADD (S V4) (S V0)) V5)
                         (S V2))))))))
