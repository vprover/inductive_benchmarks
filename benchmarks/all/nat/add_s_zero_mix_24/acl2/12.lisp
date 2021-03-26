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
   (= (ADD (ADD (ADD (ADD V5 (S V4))
                     (S (S (S (S ZERO)))))
                (S (ADD (ADD V2 (S V1))
                        (ADD V6 (S (S V0))))))
           (S (S (ADD (ADD V0 (ADD (S V7) ZERO))
                      (S V3)))))
      (ADD (S (S (ADD V4 (S (S (ADD (S (S V0)) (S V7)))))))
           (ADD V1
                (ADD (ADD V0 (S V3))
                     (S (S (ADD V6
                                (ADD (S ZERO)
                                     (S (ADD (S (ADD ZERO V5)) V2))))))))))))
