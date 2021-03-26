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
   (S
    (ADD
     V3
     (S
      (S (S (S (ADD (ADD (S V4)
                         (ADD (S V2)
                              (S (ADD V1 (S (ADD (ADD V2 (S (S V2))) V0))))))
                    (ADD (S V2) (S (ADD V5 (S V6)))))))))))
   (S
    (S
      (S (ADD V2
              (ADD (S V4)
                   (S (ADD (S (ADD (S V5)
                                   (ADD (ADD (S V2) V1)
                                        (ADD V0
                                             (S (S (ADD (S (ADD V2 V6))
                                                        (S (S (S V3))))))))))
                           V2))))))))))
