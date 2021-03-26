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
   (ADD (S (S (ADD (S V7)
                   (ADD (S (S V4)) (S (S (S V7)))))))
        (ADD (ADD V1
                  (S (S (ADD (S (ADD (ADD (S (ADD (S ZERO) V0)) (S V5))
                                     (S (S V3))))
                             (ADD V6 (S V8))))))
             (S (S V2))))
   (ADD
    (S (S (S V1)))
    (ADD
       (ADD (S (S (S (S (S (S V5)))))) (S V3))
       (ADD (S (S (ADD (S (S (S V0)))
                       (S (S (S (ADD ZERO
                                     (ADD (S V7) (ADD (ADD V2 V7) V4)))))))))
            (ADD V6 V8)))))))
