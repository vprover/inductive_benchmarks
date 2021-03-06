     (DEFUN S (X0) (LIST X0))
     (DEFUN ADD (X0 X1)
            (COND ((ENDP X0) X1)
                  ((CONSP X0) (S (ADD (CAR X0) X1)))))
     (DEFUN LEQ (X0 X1)
            (COND ((ENDP X0) T)
                  ((AND (CONSP X0) (ENDP X1)) NIL)
                  ((AND (CONSP X0) (CONSP X1))
                   (LEQ (CAR X0) (CAR X1)))))
     (DEFTHM THEOREM
             (= (S (S (S (ADD (ADD (S (ADD V1 (S V2))) V0)
                              (ADD (S (S V0))
                                   (ADD (S (ADD (S V4) (S (S V0))))
                                        (ADD (S V3) (S NIL))))))))
                (ADD (ADD (S (S V0))
                          (ADD (S (ADD (ADD (S (S NIL)) V4)
                                       (S (S (S (S V1))))))
                               (ADD (ADD (S V3) (S (S V0))) V0)))
                     (S V2)))))
