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
   (ADD (ADD (S (S (S V7)))
             (ADD (S (ADD (ADD (S V4) (S (S V8)))
                          (ADD (ADD (S V5) V9)
                               (ADD (S (ADD (S V2) V2)) (S (S V0))))))
                  (S (ADD V6 (S V1)))))
        (S (ADD (ADD (S V11) V3) (S V10))))
   (ADD
    V1
    (S (ADD (S (ADD (ADD (ADD (S (ADD V4
                                      (ADD (ADD (S (S V3)) V10) (S (S V2)))))
                              V0)
                         (ADD (ADD V6
                                   (ADD (S (S V8))
                                        (S (S (S (ADD V9 (S V2)))))))
                              (S (S V7))))
                    V5))
            (S (S V11))))))))
