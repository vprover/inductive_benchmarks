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
   (S (S (ADD (S (ADD V7
                      (ADD (S V4) (ADD (ADD (S V3) V5) V0))))
              (S (S (ADD (S (S V6))
                         (ADD (S (S (ADD (S V3) V8)))
                              (ADD (ADD (S NIL) V2)
                                   (S (ADD (S V1) V3))))))))))
   (ADD
    V4
    (ADD
     (S V8)
     (ADD
         (S (S (ADD (S (S V3))
                    (ADD (ADD (ADD (S (ADD NIL (S (S (S (ADD (S V3) V1))))))
                                   V3)
                              (S V2))
                         (ADD V5 (ADD V7 (S (S V0))))))))
         (S (S V6))))))))
