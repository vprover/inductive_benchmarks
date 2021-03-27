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
   (ADD (S (S (ADD (ADD (S V7) (S V2))
                   (ADD (S (S (ADD (S V1) (S V4)))) V5))))
        (ADD (ADD (ADD V7 (S V0)) (S V7))
             (ADD (S (S (ADD (S V3) (S ZERO))))
                  (ADD V1 (S V6)))))
   (ADD
    (S (ADD (ADD V4 V7) ZERO))
    (S
     (ADD
      (S
       (S
        (S
         (ADD
          (S (S V6))
          (S
           (S (ADD (S (S (ADD (S (ADD (S V7)
                                      (ADD V1 (ADD (S (ADD V2 (S V7))) V3))))
                              V0)))
                   V1)))))))
      V5))))))
