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
      (= (S (S (ADD (ADD (S (ADD (ADD (ADD (S V6) V7) (S ZERO))
                                 (ADD (S V2)
                                      (S (ADD (S V5) (ADD V0 (S (S V3))))))))
                         (ADD V4 (S V0)))
                    V1)))
         (S (ADD V5
                 (ADD (ADD (ADD V1 (S (ADD (ADD V0 (S (S V2))) V3)))
                           (S (ADD (S (ADD V4 (S (ADD (S V6) ZERO))))
                                   (S V0))))
                      (S (S V7))))))))
