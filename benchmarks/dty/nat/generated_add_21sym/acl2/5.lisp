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
             (= (ADD (ADD (ADD V6 (S V4)) (S V0))
                     (ADD (S (S V3))
                          (ADD (S (S (ADD (ADD V1 (S V2))
                                          (S (S (S (S V4)))))))
                               (S (S V5)))))
                (S (ADD (S (ADD (S (S V5))
                                (S (S (S (ADD (S (S V4)) V0))))))
                        (ADD (ADD V6 (ADD V3 (S V1)))
                             (S (ADD V2 (S (S V4))))))))))
