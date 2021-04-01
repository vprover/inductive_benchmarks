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
   (S (ADD (ADD (S V0) (S V1))
           (S (ADD (ADD (S V2) (ADD (S V5) V4))
                   (ADD (S V4)
                        (ADD (S (S V7))
                             (S (S (ADD (S V3) (ADD (S V5) (S V6)))))))))))
   (S
    (S
     (ADD
      (ADD
          (S V0)
          (S (S (ADD (S V6)
                     (ADD (S V7)
                          (ADD (S (ADD (ADD V1 (S V2))
                                       (ADD V3 (ADD (S (S (S (S V4)))) V5))))
                               V5))))))
      (S V4)))))))
