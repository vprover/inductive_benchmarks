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
   (S (ADD (S (S (ADD (ADD (ADD (S V0) V11)
                           (ADD (S (S (S V3))) (S V2)))
                      (ADD (S V8)
                           (ADD (ADD (ADD V1 (ADD (S V5) V7)) (S V4))
                                (S (S V6)))))))
           (S (S (S (ADD (S V10) (S V9)))))))
   (S
    (S (ADD (ADD (ADD (S (S (S V3)))
                      (S (ADD (ADD V8
                                   (ADD (ADD (ADD V6 V9) (S (S (S (S V10)))))
                                        V1))
                              V7)))
                 (S V5))
            (ADD (S (S (ADD (S (S (S (S V11)))) (S V0))))
                 (ADD V4 V2))))))))
