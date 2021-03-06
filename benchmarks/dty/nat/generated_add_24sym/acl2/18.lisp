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
   (ADD (S (ADD (S (ADD V5 (ADD (S V1) (S (S V7)))))
                (ADD V4 (S (S (ADD V6 (S (S V3))))))))
        (S (ADD (S (ADD (S (S V8)) (S V0)))
                (S V2))))
   (S
    (ADD
     V8
     (S
      (S
       (S
        (S
         (ADD
             V5
             (S (ADD V3
                     (ADD V6
                          (ADD (ADD (S (S (ADD (S V2)
                                               (S (S (ADD (S (S V4)) V0))))))
                                    V7)
                               (S (S V1))))))))))))))))
