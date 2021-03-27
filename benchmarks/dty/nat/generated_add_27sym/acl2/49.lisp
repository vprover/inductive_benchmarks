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
      (= (S (S (S (ADD (ADD (ADD (ADD V0 (S (ADD V6 (S (S (S V2))))))
                                 (ADD (S V3) (S V1)))
                            (ADD (ADD (S V7) V8)
                                 (S (S (S (S (ADD V5 (S V4))))))))
                       (S (S V9))))))
         (S (ADD V1
                 (S (ADD (ADD (S (S (S V5))) (ADD (S (S V7)) V3))
                         (S (ADD (ADD V9
                                      (S (S (ADD (ADD (S V2) (S (ADD V4 V8)))
                                                 (S (S (S V6)))))))
                                 (S (S V0)))))))))))
