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
   (ADD (S V1)
        (S (ADD (S (S (S (ADD (S (ADD V3 (S V0))) (S V5)))))
                (S (ADD (ADD (ADD V4 (S V9))
                             (ADD (S (ADD (ADD (S V7) V2) V1))
                                  (S V6)))
                        (ADD (S V8) (S V6)))))))
   (S
    (ADD
     (ADD V6 V0)
     (S
      (S
       (ADD
        (ADD
         (ADD (S (ADD (S (S (S (ADD (S (ADD (S V9)
                                            (S (ADD (S V1) (S (S (S V8)))))))
                                    (ADD V6 V5)))))
                      V1))
              (S V7))
         V3)
        (ADD V4 V2)))))))))
