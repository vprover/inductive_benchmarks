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
             (= (ADD (ADD (ADD (S V1) (ADD V6 (S V7)))
                          (S (ADD (S (S (ADD (ADD (S (S V2)) (S V3))
                                             (ADD (S V4) V4))))
                                  (S (ADD (S (S V0)) V7)))))
                     (ADD (S V0) V5))
                (ADD (S V7)
                     (S (ADD (ADD (ADD V0 (S V2))
                                  (ADD (S (ADD V1 (S V0)))
                                       (ADD (ADD (ADD (S (S (S V3))) (S V5))
                                                 (S (ADD V4 (S (S (S V4))))))
                                            V7)))
                             V6))))))
