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
             (= (ADD (ADD (S (ADD (S (ADD (S V3) V3))
                                  (ADD (ADD V0 (S V1)) V2)))
                          (S (S (S (ADD (S V4) V3)))))
                     (S (S ZERO)))
                (ADD (ADD (S (S (ADD ZERO
                                     (ADD (ADD V0 (S (S V3)))
                                          (S (ADD V4 (S V1)))))))
                          (S (S (S (ADD V3 V3)))))
                     (S V2)))))