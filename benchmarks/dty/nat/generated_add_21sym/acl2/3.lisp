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
   (ADD (ADD (ADD V6 (S (S V0)))
             (S (ADD (S (S (ADD (S V2) V4))) V5)))
        (ADD (ADD (S (S V3)) (S V3))
             (S (S (ADD (S V1) V1)))))
   (ADD (S (S (S V5)))
        (S (ADD (S (S (S (ADD V0
                              (ADD (S (ADD (S V4)
                                           (S (ADD V6 (S (ADD V1 (S V2)))))))
                                   (ADD V3 V1))))))
                V3))))))
