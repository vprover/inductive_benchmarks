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
     (= (S (ADD (ADD V6 (S V5))
                (ADD (S (S (ADD (ADD (ADD (S V3) (ADD (S V2) V2))
                                     (ADD (S V5) (S V6)))
                                V1)))
                     (ADD (ADD (S V0) V4) (S V2)))))
        (ADD (ADD V0
                  (ADD (ADD (S (S (S (ADD (S (S (S (ADD V6 (S (S (S V5)))))))
                                          V1))))
                            (ADD V6 (ADD V2 V2)))
                       (ADD (ADD V2 V3) V5)))
             (S V4)))))
