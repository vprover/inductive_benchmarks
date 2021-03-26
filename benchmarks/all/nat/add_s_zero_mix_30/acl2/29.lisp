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
    (S
     (S (ADD (ADD (S (ADD (S ZERO)
                          (ADD (S V1)
                               (S (ADD (ADD (S V6) (S V4))
                                       (S (ADD (ADD V8 (S V7))
                                               (ADD (S (S V5)) (S V6)))))))))
                  (ADD V6 (ADD (S (S V2)) V4)))
             (ADD V3 (S V0))))))
   (ADD
    (S
     (ADD
      (ADD
          (S (ADD V6
                  (S (ADD V8
                          (ADD (S (S (ADD (S (S V4)) (ADD (S V6) (S ZERO)))))
                               V6)))))
          V4)
      (ADD (S (S (ADD V2 V7)))
           (S (S (S (S (ADD (S V3) (S V0)))))))))
    (ADD V1 V5)))))
