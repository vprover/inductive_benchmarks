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
  (=
    (S (ADD (ADD (ADD (ADD (S V7) (S V4))
                      (ADD (S (ADD V0 (S (S V9)))) (S V1)))
                 (S (ADD (ADD (S (S (ADD (S V6) (S V5)))) V2)
                         (S V0))))
            (ADD (S V7) (ADD (S V3) V8))))
    (S (ADD V5
            (S (ADD (S (S (ADD (ADD V6 (ADD V2 (S V1)))
                               (ADD (S (ADD (S (S V7))
                                            (ADD V0 (S (S (S (S (S V9))))))))
                                    V0))))
                    (S (ADD (ADD (ADD V8 V3) V4)
                            (S V7))))))))))
