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
   (ADD (ADD (ADD (ADD (S V2) V1) (S (S V5)))
             V0)
        (ADD (ADD (ADD (ADD V4 (S V7)) (S V8))
                  (ADD (S V5) (S (ADD V6 (S (S V3))))))
             (ADD (S V0) (ADD V0 (S NIL)))))
   (ADD
       (ADD (ADD (ADD V0
                      (ADD (S (S (ADD (S (ADD (ADD NIL V0) V1))
                                      (ADD V5 (S (S (S (S (ADD V7 V2)))))))))
                           (S (S (ADD V6 V3)))))
                 V8)
            V4)
       (ADD (S (S V0)) V5)))))
