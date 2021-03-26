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
         (= (S (ADD (S (ADD (ADD V4 (ADD V5 (S V3)))
                            (ADD V7 (ADD (ADD V2 (S V1)) V0))))
                    (ADD (ADD (S (S V1)) (ADD (S ZERO) V6))
                         V4)))
            (S (ADD (ADD (ADD V4 V1) ZERO)
                    (ADD (ADD (S (S (ADD (S (ADD (S (S (ADD V6 (S V3)))) V0))
                                         V7)))
                              (ADD V1 V5))
                         (ADD V2 V4)))))))