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
   (ADD (ADD (S (S V9)) (S V5))
        (S (S (ADD (ADD (ADD (S (ADD (S V3) (S V4))) (S (S V8)))
                        (S (S (ADD (S V7)
                                   (ADD (ADD ZERO (S V7)) (S V0))))))
                   (ADD V6 (ADD (S V1) (S (S V2))))))))
   (S
    (ADD
     V3
     (S
       (S (ADD (S V6)
               (ADD (S (ADD V7 (ADD V2 (S (S (S (S V4)))))))
                    (S (S (S (ADD (S V9)
                                  (S (ADD (ADD V0 V5)
                                          (ADD (S V8)
                                               (ADD (S (ADD (S V1) V7))
                                                    (S ZERO))))))))))))))))))
