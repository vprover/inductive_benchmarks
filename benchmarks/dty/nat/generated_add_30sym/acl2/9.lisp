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
   (ADD (S (ADD (ADD (ADD (ADD (S (ADD V5 (S V9))) V7) V2)
                     (ADD (ADD (S ZERO) V10) (S V4)))
                (ADD (S (S V6)) (S V0))))
        (S (ADD (S (S (S (ADD (S V11) V1))))
                (S (ADD (S V11) (ADD V8 (S V3)))))))
   (ADD
    (S
     (ADD
      (S
       (S
        (ADD
         V3
         (ADD
          V10
          (ADD
           (ADD
              (ADD (S (S V1))
                   (S (ADD (S (ADD V6
                                   (S (S (ADD (S (S (S V2))) (ADD V8 V4))))))
                           V11)))
              V0)
           (S (ADD (S ZERO) (S (S (ADD V7 V9))))))))))
      V5))
    V11))))
