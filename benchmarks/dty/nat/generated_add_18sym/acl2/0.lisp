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
             (= (ADD (S (S (S (S (ADD (ADD (S V5) (S V4)) V3)))))
                     (ADD V0
                          (S (ADD (S (ADD (S V6) V6))
                                  (ADD V2 (S V1))))))
                (S (S (ADD (S (ADD V2
                                   (ADD (S (S (S V4)))
                                        (ADD (ADD (ADD (S V6) V6) V0)
                                             (ADD (S (S V3)) (S V1))))))
                           V5))))))
