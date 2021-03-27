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
   (ADD (ADD (ADD (S V4) (ADD (S V5) V8))
             (S (ADD (S V10)
                     (S (ADD (ADD (S V1) V11) V9)))))
        (ADD (S (ADD (S V7) (ADD V0 (ADD V2 (S V3)))))
             (ADD (S V10) (S (ADD V6 (S (S V12)))))))
   (S
    (S
     (ADD
      (S V9)
      (ADD
       (ADD
        (ADD
            (S (S (S V3)))
            (ADD V4
                 (ADD (ADD (S V10)
                           (ADD (ADD (ADD (ADD (S (S V5)) V0)
                                          (ADD (S (ADD V11 (S V12))) (S V7)))
                                     V1)
                                V8))
                      V10)))
        V6)
       (S V2))))))))
