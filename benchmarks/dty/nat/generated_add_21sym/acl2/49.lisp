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
    (= (S (S (ADD (S (S (ADD V0 (S (S V2)))))
                  (S (S (S (ADD V1
                                (S (ADD (S (S NIL))
                                        (ADD (ADD V2 (S V3)) (S V0)))))))))))
       (ADD V1
            (S (ADD V0
                    (S (ADD (S (S (ADD (ADD (ADD (S (S (S (S (S V2))))) V0)
                                            (S V2))
                                       (S NIL))))
                            (S (S (S V3)))))))))))
