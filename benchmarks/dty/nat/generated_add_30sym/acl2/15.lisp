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
   (S
    (ADD
     (ADD
      V1
      (S
       (S
        (ADD
         (ADD V7 (ADD (S V1) (S V3)))
         (S
          (S
           (S
            (S (S (S (ADD (ADD (S (S V7)) V4)
                          (S (S (ADD V2 (S (ADD (S (S V0)) V6))))))))))))))))
     (S (S V5))))
   (ADD
    (S V2)
    (S
     (S
      (S
       (ADD
        (ADD (S (S V7)) (S (S V6)))
        (S (ADD V1
                (S (S (S (S (ADD (ADD (S V0)
                                      (ADD (S (S V5))
                                           (S (ADD (ADD (S (S V3)) V7) V1))))
                                 (S V4))))))))))))))))
