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
   (S (ADD (S (S (S V3)))
           (ADD (ADD (ADD (S V4) (ADD (S V2) V4))
                     (S (S (S (S (S (S V5)))))))
                (S (S (ADD (S V0)
                           (ADD (S V1) (S (S (S V3))))))))))
   (S
    (ADD
      (S (ADD (S V5)
              (S (ADD (S V0)
                      (S (S (S (S (S (S (ADD (S (ADD (ADD V4 (S (S V3))) V2))
                                             V3)))))))))))
      (S (ADD (S (S (S (S V4)))) V1)))))))
