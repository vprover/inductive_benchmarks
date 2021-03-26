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
             (= (ADD (ADD (S (S V5))
                          (ADD (ADD (ADD (S V0) (ADD (S V1) V1))
                                    (S (S V2)))
                               (S V4)))
                     (ADD (S V6) (S (S V3))))
                (ADD (S (S (S (ADD (ADD V4 (ADD V6 V1)) V1))))
                     (S (S (ADD (ADD (S (S V0)) V2)
                                (S (ADD (S (S V5)) V3)))))))))
