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
   (S (ADD (ADD (ADD V5 (S V1)) (S V0))
           (ADD (ADD (S V1) V6)
                (ADD (S (ADD (S (S V3)) V2))
                     (S (ADD (ADD V6 (S (S V4))) (S V1)))))))
   (ADD
    (ADD
     V1
     (S (ADD (ADD V5
                  (S (S (ADD (S V2)
                             (S (S (ADD (ADD V6 (ADD (S (S V1)) (ADD V6 V1)))
                                        V3)))))))
             (S (S V4)))))
    (S V0)))))
