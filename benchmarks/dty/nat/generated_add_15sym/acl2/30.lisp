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
             (= (ADD (S (S V4))
                     (ADD V1
                          (ADD (ADD (ADD (S (S (ADD (S V5) V1))) (S V0))
                                    V2)
                               (ADD (S V2) V3))))
                (S (ADD V5
                        (ADD (ADD V2 (ADD V0 V2))
                             (ADD (ADD (S V1) V4)
                                  (ADD (S (S (S (S (S V1))))) V3))))))))
