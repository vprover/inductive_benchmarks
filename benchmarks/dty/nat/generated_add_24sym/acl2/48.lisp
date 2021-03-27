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
   (S (S (S (S (ADD (ADD (S (S (S (S (S V4)))))
                         (S (ADD (ADD V5 (S V1)) V6)))
                    (ADD (ADD (S V5) (S (ADD (S V2) (S (S V3)))))
                         V0))))))
   (S
    (S
     (S (S (S (ADD V5
                   (ADD (ADD (S (ADD (ADD (S (ADD (S (S V2)) (S (S V0)))) V5)
                                     V4))
                             (S (S (S (ADD (S V1) V3)))))
                        (S V6)))))))))))
