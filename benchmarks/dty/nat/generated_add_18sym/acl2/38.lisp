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
   (ADD (S (ADD (S (ADD V6 (ADD (S V3) (S (S V1)))))
                (S (ADD (S V4) (ADD (S V5) V7)))))
        (S (ADD (S V0) V2)))
   (S
     (S (S (ADD (ADD V1 V5)
                (ADD (ADD V6
                          (ADD (S V3)
                               (S (ADD V2 (S (ADD (S V4) (S (S (S V7)))))))))
                     V0))))))))
