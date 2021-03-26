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
          (= (S (S (ADD (S (S V3))
                        (ADD (S (S (ADD V2 (S (S V4)))))
                             (S (ADD (S (ADD (S (ADD (S V3) (S V1))) (S V3)))
                                     (S (ADD V0 (S V5)))))))))
             (ADD (S (ADD (ADD (ADD V3 V0) V2)
                          (ADD (S (S V4)) (S (S V3)))))
                  (ADD (S (S (S (S (S (S (ADD V1 (S V5))))))))
                       (S (S (S (S V3)))))))))
