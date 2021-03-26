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
     (ADD
      (S (S V1))
      (S
       (S
        (ADD
          (S (S V2))
          (S (S (ADD (S (S (S V1)))
                     (S (S (ADD (S (S (ADD (ADD (ADD V4 (S V0)) (S V7)) V5)))
                                (ADD (S V6) (S V3))))))))))))))
   (S
    (ADD
     (ADD V7 V1)
     (S
      (S
       (S
        (ADD (S V1)
             (S (ADD V2
                     (ADD (ADD (S (S V6))
                               (S (S (S (ADD (S (S (S V5)))
                                             (S (S (S (S (ADD V3 V0))))))))))
                          (S (S (S V4)))))))))))))))
