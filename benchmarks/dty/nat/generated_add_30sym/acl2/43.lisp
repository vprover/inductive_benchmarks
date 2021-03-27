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
   (ADD (S (ADD (ADD (S (S (ADD V3 (ADD (S V7) (S V4)))))
                     (ADD (ADD V4 (S (ADD (ADD (S V4) V2) V0)))
                          (S V3)))
                (S (ADD (ADD (S V5) (S V1)) (S (S V6))))))
        (S (S (S (S (S ZERO))))))
   (ADD
    V5
    (S
     (ADD
        (S (S (S V4)))
        (S (S (S (ADD (ADD V4 (ADD (S (ADD (S V3) ZERO)) V7))
                      (S (ADD (S (S (ADD V4
                                         (S (ADD (ADD (S (S V1)) (ADD V6 V3))
                                                 V2)))))
                              (S (S (S V0)))))))))))))))
