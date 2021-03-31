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
   (ADD (S V4)
        (ADD (ADD (S (S (S (S (ADD (S (S (ADD (S (S V5)) (S V7))))
                                   (S V0))))))
                  (ADD (ADD V3 (S (ADD (S V6) V1)))
                       (S (S V2))))
             (S (ADD (S NIL) NIL))))
   (ADD
    V0
    (ADD
     (S (S (S V7)))
     (ADD
      (S V2)
      (ADD
         (S (S NIL))
         (S (ADD (S (ADD (S V1)
                         (S (ADD (S (S V4))
                                 (S (S (ADD (ADD (S V3) (S V5)) (S V6))))))))
                 NIL)))))))))
