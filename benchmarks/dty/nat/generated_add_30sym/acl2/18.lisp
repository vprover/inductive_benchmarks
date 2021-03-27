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
   (ADD (S (S (S (ADD (ADD (S V7)
                           (S (ADD V0 (ADD (S V1) V5))))
                      V8))))
        (ADD (S (S (S (S (S V6)))))
             (S (ADD (ADD (S (ADD (S V3) V4)) (S ZERO))
                     (S (ADD (S (S V2)) (S V4)))))))
   (ADD
    (S
     (ADD
      (S (S (ADD V4 V1)))
      (S
       (S (S (S (ADD V2
                     (S (ADD (S (ADD (S (S (ADD (S (ADD (S V4) V6)) (S V8))))
                                     (ADD (S V7) (S (ADD V5 (S (S ZERO)))))))
                             V3)))))))))
    (S V0)))))
