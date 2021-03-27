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
   (S (S (ADD (ADD (S (ADD (ADD (S V0) (ADD (S V1) V3))
                           (S (ADD (ADD V1 (S (S V4))) (S V2)))))
                   (S V5))
              (ADD ZERO (S (S V3))))))
   (S
    (ADD
       (S (ADD (S (ADD (S (ADD (S (ADD (S (ADD (S (S (ADD (ADD V1 ZERO) V4)))
                                               (S V2)))
                                       (S V3)))
                               (S V0)))
                       V3))
               (S V1)))
       V5)))))
