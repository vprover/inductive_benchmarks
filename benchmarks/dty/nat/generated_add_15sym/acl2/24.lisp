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
             (= (S (ADD (S (ADD V2 (ADD (S V1) V0)))
                        (ADD (S (ADD (ADD (S NIL) V3) (S V4)))
                             (ADD (S V5) V6))))
                (ADD (ADD (ADD (S (ADD (ADD V1 (S (S (ADD V2 V3))))
                                       (S V0)))
                               (S (S V6)))
                          (ADD V4 NIL))
                     (S V5)))))
