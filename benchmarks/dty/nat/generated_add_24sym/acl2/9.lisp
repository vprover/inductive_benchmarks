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
             (= (ADD (ADD (ADD (S (S ZERO)) ZERO)
                          (S (S (S V3))))
                     (ADD (S (S (ADD (ADD (ADD (ADD V2 (S V7)) (S V5))
                                          (ADD (S (S V6)) (S V1)))
                                     (S V4))))
                          (S V0)))
                (ADD (ADD (ADD V3 (S V4))
                          (S (S (ADD (ADD (ADD (S (S V2)) (S V1))
                                          (ADD (S (S (S (ADD V0 (S ZERO)))))
                                               ZERO))
                                     (ADD (S V7) V6)))))
                     (S (S (S V5)))))))