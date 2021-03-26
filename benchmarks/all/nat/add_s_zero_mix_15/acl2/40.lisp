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
             (= (ADD (ADD (S V5)
                          (ADD (ADD (S V2) V0) (S (S V1))))
                     (S (S (ADD (ADD V0 (S V3)) (S V4)))))
                (ADD (ADD (S (ADD (ADD V1 (S (S (S (ADD (S (S V5)) V4)))))
                                  (S V0)))
                          (S V3))
                     (ADD V0 V2)))))
