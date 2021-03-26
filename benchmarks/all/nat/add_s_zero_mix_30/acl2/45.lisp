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
    (S
     (S (S (ADD (ADD (S V7) V10)
                (ADD (ADD (S V1)
                          (S (S (ADD (S (S (ADD (S V6) (ADD (S (S V5)) V3))))
                                     (ADD (S V8)
                                          (ADD (S (ADD V2 (S V11))) V0))))))
                     (ADD V6 (ADD (S V9) V4))))))))
   (ADD (ADD (ADD (S (S (S (S V3)))) V1) V6)
        (S (ADD (S (S (ADD (ADD V5
                                (S (S (ADD (ADD (ADD (S V6) V0)
                                                (S (ADD (S V11) V4)))
                                           (S V8)))))
                           (S (S (ADD V10 (S (ADD (S V9) V7))))))))
                V2))))))
