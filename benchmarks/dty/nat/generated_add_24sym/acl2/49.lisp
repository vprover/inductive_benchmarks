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
   (ADD (S (S V7))
        (ADD (S (S (ADD (ADD (S V2) (S V0)) V2)))
             (ADD (S (S V6))
                  (S (ADD (ADD (ADD (S V5) (S V3)) V0)
                          (S (ADD (S V4) (S V1))))))))
   (ADD
     (ADD (S V0)
          (S (ADD (S (S (ADD (ADD V6 V3)
                             (S (ADD (S (S V2))
                                     (ADD (S V5) (S (S (S (S (S V7)))))))))))
                  V4)))
     (ADD (ADD V2 V0) (S V1))))))
