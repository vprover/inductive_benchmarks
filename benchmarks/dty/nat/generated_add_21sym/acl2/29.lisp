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
     (= (ADD (ADD V2
                  (S (S (S (S (ADD (S (S ZERO))
                                   (ADD (S V5) (S V1))))))))
             (S (ADD (S (ADD V3 (S (S V0))))
                     (S (S V4)))))
        (ADD (S (S (S (S (S (ADD (S (S V4))
                                 (S (S (ADD (S ZERO)
                                            (ADD (S V1)
                                                 (ADD (S (ADD V5 (S (S V0))))
                                                      V3)))))))))))
             V2))))