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
   (ADD (S (S (ADD (ADD V1
                        (S (S (S (ADD (S (ADD V7 (S V0)))
                                      (ADD (S (S V10)) V9))))))
                   (S (S (ADD (S V5) (S (S V2))))))))
        (S (ADD (ADD (S V3) (S V8))
                (S (ADD V6 (S V4))))))
   (ADD
    (S
     (S
      (ADD
        V3
        (ADD (S (ADD V10
                     (S (ADD (S (ADD V7 (ADD V5 (S (S (S (S (S (S V4)))))))))
                             V6))))
             (ADD (S V2) (S (S V8)))))))
    (ADD (S (S (ADD (S V1) (S (S V9)))))
         V0)))))
