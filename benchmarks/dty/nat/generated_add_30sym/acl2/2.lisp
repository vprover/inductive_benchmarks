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
   (ADD (ADD (ADD (ADD (ADD V7 (S (S (S (ADD V0 (S V2))))))
                       V8)
                  (ADD (ADD (ADD V3 (ADD (S V5) (S V0)))
                            (S (S V9)))
                       (S V4)))
             (ADD (ADD (S V3) V1) V6))
        (ADD (S (S (S (ADD ZERO (S V4)))))
             (S V9)))
   (ADD
    (ADD
     (ADD
      V3
      (S (ADD V4
              (S (ADD (ADD V9 V0)
                      (ADD (ADD (ADD V7 (ADD (S V5) (S V0)))
                                (S (S V1)))
                           (S (S (ADD (ADD V6 (S V3))
                                      (S (ADD V8 (S (ADD V9 ZERO)))))))))))))
     (S (S (S V2))))
    (S V4)))))
