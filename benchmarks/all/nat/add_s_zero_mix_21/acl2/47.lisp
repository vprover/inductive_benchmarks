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
   (S (S (ADD (S (ADD (S (S (ADD (S V2) V3))) (S V5)))
              (S (S (ADD (S (S V6))
                         (ADD (ADD (S V4) (S (S V0))) V1)))))))
   (S
    (S
     (ADD (ADD V6 V1)
          (S (S (S (ADD (S V5)
                        (S (S (ADD V4
                                   (S (ADD (S (S (S V3)))
                                           (S (S (ADD V0 V2))))))))))))))))))
