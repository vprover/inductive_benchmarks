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
             (= (ADD (S (S V0))
                     (S (S (S (ADD (S V4)
                                   (ADD (ADD (ADD (S ZERO) V2) V3)
                                        (S (S (ADD (S V1) (S ZERO))))))))))
                (ADD (S (S (S (ADD (ADD (S (S (S V0))) (S (S V4)))
                                   V2))))
                     (ADD (ADD (ADD ZERO V3) ZERO)
                          (S (S (S V1))))))))
