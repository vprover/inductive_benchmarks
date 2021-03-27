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
   (ADD (S (S (ADD (S V5)
                   (ADD (S (S (S (ADD (ADD V0 (S V4))
                                      (S (ADD V8 (ADD (S V3) V2)))))))
                        V1))))
        (S (S (S (S (S (ADD V7 (S (S (ADD V6 (S V3)))))))))))
   (ADD
    (S (S (ADD V1 (S (S V8)))))
    (ADD
        (S (S V2))
        (ADD (S V7)
             (S (S (ADD (S (ADD (ADD (ADD (S (S (ADD (S V0) V3))) (S (S V5)))
                                     V6)
                                (S V3)))
                        (S V4))))))))))
