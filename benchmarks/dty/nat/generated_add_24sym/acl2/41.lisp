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
   (ADD (ADD V1
             (ADD (S (ADD (S V4) (S V3)))
                  (ADD (S NIL) (S (S (S (S V0)))))))
        (S (S (S (ADD (ADD (S V5) (S V1))
                      (S (S (S V2))))))))
   (ADD
       (S V0)
       (ADD (S V1)
            (S (S (S (S (ADD (S V4)
                             (ADD (S V3)
                                  (S (ADD NIL
                                          (S (ADD (S (S (S (ADD (S V5) V2))))
                                                  (S (S V1)))))))))))))))))
