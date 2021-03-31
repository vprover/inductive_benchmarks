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
   (S (ADD (ADD (ADD (ADD V5 (S V1)) (S V3))
                (ADD (S (S V2)) (S V5)))
           (S (ADD (S V4)
                   (ADD (S (ADD (S V0)
                                (ADD (ADD (S V4) (S V7)) (S (S V6)))))
                        (S (S NIL)))))))
   (ADD
    (S (ADD V2 V4))
    (S
     (S
      (S
       (S
        (ADD
         (ADD V4 V6)
         (S
           (ADD (S (ADD (ADD (S (S (S (ADD V3 (S (ADD (S V1) (S (S V0))))))))
                             (S (S NIL)))
                        (ADD V5 V5)))
                V7)))))))))))
