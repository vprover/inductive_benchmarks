 (DEFUN S (X0) (LIST X0))
 (DEFUN ADD (X0 X1)
        (COND ((ENDP X0) X1)
              ((CONSP X0) (S (ADD (CAR X0) X1)))))
 (DEFUN LEQ (X0 X1)
        (COND ((ENDP X0) T)
              ((AND (CONSP X0) (ENDP X1)) NIL)
              ((AND (CONSP X0) (CONSP X1))
               (LEQ (CAR X0) (CAR X1)))))
 (DEFTHM
  THEOREM
  (=
   (ADD (S (S (S (S (ADD (S (S (ADD (S (S V3))
                                    (ADD (S (ADD ZERO (S V1)))
                                         (S (S V2))))))
                         (ADD (S (S (S V0))) (S V5)))))))
        (S V4))
   (S (S (S (ADD (S (ADD (ADD V2 V3)
                         (ADD V1
                              (ADD (S (S (ADD V4 (S V5))))
                                   (S (S (S (S (S (S (S (S (S V0)))))))))))))
                 (S ZERO))))))))
