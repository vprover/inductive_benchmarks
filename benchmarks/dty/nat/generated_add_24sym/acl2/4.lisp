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
   (ADD (S (S (S (ADD (S (S V1))
                      (S (S (S (S (ADD (ADD V2 (S (S (ADD (S V3) V4))))
                                       (ADD V0 (S V5)))))))))))
        (S (S (S (S V6)))))
   (ADD
    (S
      (ADD (ADD (S (S (ADD (S V5)
                           (S (S (S (S (S (S (S (S (S (ADD V0 V1)))))))))))))
                (S V4))
           (ADD V2 (S (S (S V3))))))
    V6))))
