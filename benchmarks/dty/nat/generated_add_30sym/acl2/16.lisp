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
   (S (ADD (ADD (ADD (S V7) V8)
                (ADD (S V6) (S V3)))
           (ADD (S (S (S (ADD V4 (S (S (S V2)))))))
                (ADD (ADD (S (S (S V5))) (S V1))
                     (S (ADD (ADD (ADD (S V0) V2) (S V5))
                             (S ZERO)))))))
   (ADD
    (ADD
     ZERO
     (S
      (S
       (ADD
          (ADD V5
               (S (S (S (S (S (S (ADD V0
                                      (S (S (ADD (S V4) (S (S V2)))))))))))))
          (ADD V8 (S V5))))))
    (ADD (ADD (S V2)
              (ADD (S (ADD V6 (S V1))) (S V3)))
         V7)))))
