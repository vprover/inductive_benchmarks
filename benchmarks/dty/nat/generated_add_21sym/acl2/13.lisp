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
   (ADD (S (S (ADD (S V7)
                   (S (ADD (ADD (S V2) V6)
                           (S (S (ADD (S V5) NIL))))))))
        (S (ADD (ADD V1 (ADD (S V0) V3))
                (S (S V4)))))
   (S
    (ADD
       (S (S (ADD (S (ADD (S (ADD (S (S (ADD (S V6) (ADD (ADD V5 V2) NIL))))
                                  (S (S V4))))
                          (S V3)))
                  (ADD V7 (S V0)))))
       V1)))))
