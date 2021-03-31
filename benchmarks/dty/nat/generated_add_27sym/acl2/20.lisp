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
    (S (S (ADD (S (ADD (S (ADD (S V4) (S V1)))
                       (S (ADD (ADD (S V3)
                                    (ADD V5 (S (S (ADD V0 (S (S (S V3))))))))
                               (S (S NIL))))))
               (ADD (S (S V4)) (S V2)))))
    (ADD (ADD (S (S V0))
              (S (S (S (S (ADD (S (S (S (S (S (ADD V2 (S V5)))))))
                               (S (S (ADD NIL
                                          (S (ADD (ADD (S V3) (S V1))
                                                  (ADD (S V3) V4))))))))))))
         V4))))
