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
   (ADD (S (S (S (ADD (S (ADD (S V2) (S V4))) V3))))
        (S (ADD (ADD V1 (ADD (S V4) (S V1)))
                (S (S V0)))))
   (S (S (ADD (S (S (S (S (S (S (S (ADD (ADD V2 (ADD (S (S (ADD V1 V1))) V3))
                                        V4))))))))
              (ADD V4 V0)))))))
