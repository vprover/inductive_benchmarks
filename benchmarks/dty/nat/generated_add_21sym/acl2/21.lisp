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
   (S (S (S (S (S (S (ADD (S (S (S V3)))
                          (ADD (ADD (S V0) (S (S (S (ADD (S V4) V1)))))
                               (S (S V2))))))))))
   (S
    (ADD
       (ADD (ADD (S V2)
                 (S (S (S (S (S (S (S (S (S (S (S (ADD V3 (S V1))))))))))))))
            V4)
       (S (S V0)))))))
