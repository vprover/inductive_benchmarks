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
   (ADD
       (S (ADD (S V6) V5))
       (S (ADD (S (S V4))
               (S (S (ADD (ADD (S V2)
                               (S (S (S (ADD (S V1) (S (S (S (S ZERO)))))))))
                          (ADD (ADD V7 (S V0)) (S V3))))))))
   (S
    (S
     (S
      (ADD
       (S V2)
       (ADD
         (ADD (ADD (S (S (S (ADD (ADD (S V3) (S (S (S V5))))
                                 (S (S (ADD (ADD (S V4) V1) (S (S V6)))))))))
                   V7)
              (S ZERO))
         (S V0)))))))))
