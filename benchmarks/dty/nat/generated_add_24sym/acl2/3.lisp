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
    (= (S (S (ADD (ADD (S (ADD (S V6) V4))
                       (ADD (ADD (S V8) V3)
                            (S (ADD (S V0) (S V0)))))
                  (ADD V1
                       (ADD V2
                            (S (S (ADD V5
                                       (ADD (S V1) (ADD V7 (S NIL)))))))))))
       (ADD (ADD (ADD (ADD V5 (S (S NIL))) (S V2))
                 (ADD (ADD (S (ADD (S V8) V0)) (S V4))
                      (ADD (S (ADD (S (S V6)) V1))
                           (S (ADD (S (ADD V1 V7)) V3)))))
            (S V0)))))
