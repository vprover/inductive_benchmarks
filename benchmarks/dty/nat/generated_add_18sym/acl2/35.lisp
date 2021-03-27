     (DEFUN S (X0) (LIST X0))
     (DEFUN ADD (X0 X1)
            (COND ((ENDP X0) X1)
                  ((CONSP X0) (S (ADD (CAR X0) X1)))))
     (DEFUN LEQ (X0 X1)
            (COND ((ENDP X0) T)
                  ((AND (CONSP X0) (ENDP X1)) NIL)
                  ((AND (CONSP X0) (CONSP X1))
                   (LEQ (CAR X0) (CAR X1)))))
     (DEFTHM THEOREM
             (= (ADD (S (ADD (ADD V1 (S V3))
                             (ADD ZERO (ADD V0 (ADD V7 (S ZERO))))))
                     (ADD V6
                          (S (S (ADD (ADD (ADD V4 (ADD V5 (S V2))) V0)
                                     V8)))))
                (S (S (S (ADD (ADD V2
                                   (ADD (ADD (ADD V8 (ADD V7 V0)) V5)
                                        (S (ADD V0 (ADD ZERO V3)))))
                              (ADD V1
                                   (ADD ZERO (S (ADD (S V4) V6)))))))))))
