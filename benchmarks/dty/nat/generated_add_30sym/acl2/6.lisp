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
   (ADD
      (S (ADD (S (S (ADD (ADD V8 (S V6))
                         (S (ADD (ADD (S V1) V5)
                                 (ADD (S (ADD (ADD (S (S (S V8))) (S (S V9)))
                                              (S (S V3))))
                                      (ADD (ADD (S V4) V7) (S V2))))))))
              NIL))
      (S (S V0)))
   (ADD
    (ADD
     (S
      (ADD
       (S V1)
       (S
        (ADD (S V8)
             (S (S (ADD (S (S (S V3)))
                        (ADD (S (ADD (S V6)
                                     (S (ADD (ADD (S (S NIL)) V8) (S V0)))))
                             V5))))))))
     (S (S (ADD V2 (ADD V9 V4)))))
    (S V7)))))
