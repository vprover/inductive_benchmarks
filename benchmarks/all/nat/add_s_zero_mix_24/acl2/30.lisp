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
   (ADD (ADD (S (S (S (ADD (ADD (ADD (S V3) (ADD (S V0) V5)) V4)
                           (S V6)))))
             (S V2))
        (S (S (ADD (S (S (S (ADD (ADD V6 (S ZERO)) V1))))
                   (S V2)))))
   (S
     (S (S (ADD V4
                (S (ADD (S (ADD (S V2) (S (ADD (S (S V6)) ZERO))))
                        (ADD V5
                             (ADD (S (S (ADD V3 V0)))
                                  (ADD V6 (S (ADD (S (S V2)) V1))))))))))))))
