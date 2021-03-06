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
   (S (ADD (S (S (ADD (S (S (S (ADD (ADD (S V1) (ADD V6 (S (S V6))))
                                    (S (S V7))))))
                      V4)))
           (ADD (S (S V0))
                (S (ADD (ADD (ADD (S V8) V9) V2)
                        (ADD V5 (S V3)))))))
   (ADD
    (S (S V0))
    (S
     (ADD
      V6
      (S
       (S
        (ADD
          (S (ADD (S (S (ADD V3 V7)))
                  (ADD (ADD (S (S (S (ADD V8 (ADD V9 (S (ADD (S V4) V1)))))))
                            (S V6))
                       (S V5))))
          (S V2))))))))))
