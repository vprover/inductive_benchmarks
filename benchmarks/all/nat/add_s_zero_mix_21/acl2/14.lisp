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
             (= (ADD (ADD (S (S (ADD (S (S (ADD V6 (S (S V0)))))
                                     (ADD (S V4) (S (ADD (S V5) V2))))))
                          (S (ADD (S (S V7)) V1)))
                     (S V3))
                (S (ADD (ADD (ADD (S (S (S V0)))
                                  (ADD (S (S (S (S (S (S (S V3))))))) V6))
                             V7)
                        (ADD (ADD (S (S (ADD V4 V1))) V5)
                             V2))))))
