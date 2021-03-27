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
             (= (ADD (S (ADD (S (ADD (S V3) V2)) V0))
                     (S (ADD (ADD V4
                                  (ADD (S V1)
                                       (ADD V3 (S (ADD (S V4) (S V6))))))
                             (S V5))))
                (ADD (ADD V5
                          (ADD (ADD (S V4)
                                    (ADD V1 (S (S (ADD (S (S (S V4))) V6)))))
                               (ADD V3 (S (S (ADD V2 V0))))))
                     (S V3)))))