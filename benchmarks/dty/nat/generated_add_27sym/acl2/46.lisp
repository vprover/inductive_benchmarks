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
    (= (ADD (S (ADD (ADD (S V7) V10)
                    (S (ADD (S V1) (S (S V4))))))
            (ADD (S V9)
                 (ADD (S V6)
                      (S (ADD (S (S (S (ADD (ADD V2 (ADD (S V5) V8)) V3))))
                              (ADD (ADD V1 (S V0)) V11))))))
       (S (S (ADD V8
                  (ADD (S (S (ADD (S (S (S (ADD V5 V6))))
                                  (ADD (S (S V9))
                                       (ADD (ADD (S (ADD (S (ADD V1 V1)) V0))
                                                 (ADD V2 V4))
                                            (ADD (S (S V11)) (S V10)))))))
                       (ADD V3 V7))))))))