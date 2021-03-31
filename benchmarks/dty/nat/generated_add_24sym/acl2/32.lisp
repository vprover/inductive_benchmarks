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
      (= (S (ADD (ADD (S (S V0)) (S V3))
                 (S (S (ADD (S (S (S (S (S (S (ADD (S (S NIL))
                                                   (S (ADD (S V2) V1)))))))))
                            (ADD (S V4) NIL))))))
         (S (S (ADD (ADD V1
                         (S (S (S (S (ADD (ADD NIL (ADD V3 V4))
                                          (S (S (S (S (S V2)))))))))))
                    (ADD V0 (S (S (S (S (S (S NIL)))))))))))))
