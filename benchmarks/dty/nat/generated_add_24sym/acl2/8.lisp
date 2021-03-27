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
   (S
    (ADD
        (S (ADD (S V2)
                (ADD (ADD (S (S (S V0))) (S V1))
                     (S (S (S (S (S (ADD V4 (ADD V6 (ADD V6 (S V3))))))))))))
        (S (S (S V5)))))
   (ADD (S (S (ADD V4
                   (ADD (ADD (S (S (S (ADD (S (S (S V6))) V3))))
                             (S (S (ADD (S (S (S (ADD V5 V2))))
                                        (S (S V0))))))
                        V6))))
        (S V1)))))
