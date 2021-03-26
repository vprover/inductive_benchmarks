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
    (ADD (S (ADD (S (ADD V2 (ADD (S V8) V6)))
                 (S (S (S (ADD (ADD V4 (S V2)) (S V7)))))))
         (S (ADD V1
                 (S (ADD (ADD (S V5)
                              (ADD V3
                                   (S (S (S (S (ADD (ADD V0 (S V0)) V0)))))))
                         (S V8))))))
    (S (ADD (ADD (S (ADD (ADD V0
                              (S (S (S (ADD (S V2) (S (S (S (S V4)))))))))
                         (ADD (ADD V5 V3) V6)))
                 V0)
            (S (S (S (S (ADD V0
                             (ADD (ADD (ADD V8 (ADD V2 (S V1)))
                                       (S (S V7)))
                                  V8)))))))))))
