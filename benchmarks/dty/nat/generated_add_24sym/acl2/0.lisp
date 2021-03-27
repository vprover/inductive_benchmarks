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
   (ADD (ADD (ADD (S ZERO)
                  (ADD (S (ADD (S V6) V7))
                       (ADD V3 (S V4))))
             (S (S (S V2))))
        (S (ADD (S (ADD (S V1) V8))
                (S (ADD (S V5) (ADD (S V4) V0))))))
   (S
    (S
     (ADD
      (ADD
       (S
        (S
         (S
          (ADD
           (ADD (ADD (S V4) V4)
                (ADD (ADD V8 V5)
                     (S (S (S (ADD V3
                                   (S (S (S (ADD V2 (ADD V6 (S V0))))))))))))
           ZERO))))
       V7)
      V1))))))
