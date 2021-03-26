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
   (S (ADD (S (ADD (S (S (ADD (S (ADD (ADD (S V3) (S V4))
                                      (ADD (S V0) (S V9))))
                              (S V4))))
                   (ADD (S (ADD V6 (S V7)))
                        (S (S (S (ADD (S (S V2)) V1)))))))
           (S (ADD V8 (S V5)))))
   (ADD
    V7
    (ADD
     (ADD
      (S
       (S (S (ADD (ADD (ADD (S V1) V4) (S (S V2)))
                  (ADD (S (S (ADD (S V9)
                                  (S (ADD (ADD (S (S (S (S (S V8))))) (S V6))
                                          (S (S V4)))))))
                       V0)))))
      (S V3))
     V5)))))
