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
   (S (ADD (ADD (ADD (S V7) (S V5))
                (ADD V4
                     (ADD (S V3)
                          (ADD (ADD (S V1) V2) (S V1)))))
           (S (S (S (ADD V0 (S (S (S V6)))))))))
   (S
    (S
     (ADD
      V0
      (ADD
       (ADD (ADD (ADD (ADD (S V3)
                           (S (S (ADD V1
                                      (S (S (S (S (ADD (S V7) (S V5))))))))))
                      V1)
                 (S V6))
            V2)
       V4)))))))
