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
   (S (S (S (ADD (S (ADD (S (ADD (ADD (S (S (S (S V0)))) (S V2))
                                 V2))
                         (S V2)))
                 (S (ADD (S (S (ADD (S (S V4))
                                    (S (S (S (S (S V3))))))))
                         (S (S V1))))))))
   (S
    (ADD
     (S (S V2))
     (S
      (S
       (S
        (S
         (S
          (S
           (S
            (S (ADD (S (S (S (S (ADD (S (S (S (ADD (ADD (S (S V4)) V3) V1))))
                                     (ADD V0 (S (S (S V2)))))))))
                    V2))))))))))))))
