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
   (S (ADD (S (S (ADD V1 (S V3))))
           (ADD (ADD (S V4) (S V5))
                (S (ADD (ADD (S V0) (S (S NIL)))
                        (S V2))))))
   (ADD
      NIL
      (ADD (S (S (ADD (ADD V1
                           (S (S (ADD (S V2)
                                      (S (ADD (S (S (S (S (S V5))))) V3))))))
                      V4)))
           V0)))))
