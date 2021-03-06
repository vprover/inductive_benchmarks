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
   (S (S (ADD (S (ADD (S (ADD (S V8)
                              (ADD (ADD V3 (ADD (S (S V7)) (S V1)))
                                   V3)))
                      (S (ADD (ADD (S V6)
                                   (ADD (ADD (S V2) (S V0)) V5))
                              (S (S V4))))))
              (ADD V1 (S V1)))))
   (S
    (ADD
     (ADD
        V1
        (ADD (ADD (S (ADD (S (ADD V4 (S (S V1))))
                          (ADD (ADD V7 (ADD (ADD (S V5) V0) (S V6)))
                               (S (S (S (ADD (S (S (S (S V1)))) (S V3))))))))
                  V3)
             V8))
     V2)))))
