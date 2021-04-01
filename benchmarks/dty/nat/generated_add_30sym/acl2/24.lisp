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
   (S (ADD (S (S (S (S (S (ADD (S (S (S (ADD (ADD (S (S V4)) (S V2)) V5))))
                               (ADD (S V2) (S V0))))))))
           (ADD NIL
                (S (ADD (S V1)
                        (S (ADD (S V3) (S (S (S V4))))))))))
   (S
    (S
     (ADD
        (S (S (S (S (S V2)))))
        (S (S (S (ADD (S (ADD (S (ADD (ADD (ADD (ADD V3 (S (S V2))) (S NIL))
                                           V4)
                                      V5))
                              (S (S (S (ADD V1 (S (S V4))))))))
                      (S V0)))))))))))
