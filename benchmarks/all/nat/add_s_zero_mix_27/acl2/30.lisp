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
   (ADD (S (ADD V5 (S (ADD V4 (S (S V6))))))
        (S (ADD (ADD (ADD V1 (S (S V3)))
                     (S (ADD (S (S V8)) (ADD (S (S V8)) V0))))
                (S (ADD (ADD (S V7) (S V5)) (S V2))))))
   (ADD
     (S (S (ADD (S (ADD (ADD (ADD (ADD V5
                                       (ADD (S (ADD (S V0) V7))
                                            (S (S (ADD (S (S V5)) (S V3))))))
                                  (S (S (S V1))))
                             V8)
                        V4))
                (S (S V6)))))
     (ADD V2 (S V8))))))
