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
   (S (S (S (ADD (S (S (S (ADD (ADD (S (ADD (ADD (ADD V4 (S V2)) (S V7))
                                            (ADD (S V2) ZERO)))
                                    (S (ADD (S V0) V8)))
                               (S (ADD (S V5) V3))))))
                 (ADD (S (ADD (S V1) (ADD (S V0) V3)))
                      V6)))))
   (S
    (ADD
     (ADD V2 (S V3))
     (ADD
      (ADD (S V3) (S (S (S V8))))
      (ADD (S V6)
           (S (S (ADD (ADD (ADD (ADD (S (ADD V7 (S V1))) ZERO)
                                (S (S (ADD (S (S (ADD (S V0) (S V2)))) V0))))
                           V4)
                      V5))))))))))
