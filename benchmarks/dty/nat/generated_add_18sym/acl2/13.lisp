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
      (= (S (S (S (S (ADD (S (ADD V0
                                  (S (ADD (S (ADD (ADD (S V2) V1) ZERO))
                                          (S V0)))))
                          (S (S (S V3))))))))
         (S (S (ADD (S (S V1))
                    (ADD V3
                         (S (S (S (ADD (ADD ZERO (S V0))
                                       (ADD (S (S (S (S V0)))) V2))))))))))))
