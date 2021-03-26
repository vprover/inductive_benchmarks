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
   (ADD (S (ADD (ADD (S V1) V2)
                (ADD (S V9)
                     (ADD V9 (ADD V7 (ADD V4 (S V0)))))))
        (ADD (ADD (S (S (ADD (S V8) V5))) V3)
             V6))
   (ADD
     (ADD (ADD V1
               (ADD (ADD V8
                         (ADD (S V6)
                              (S (ADD (S V3)
                                      (S (S (ADD (ADD V9 (S (S (ADD V4 V7))))
                                                 V9)))))))
                    V5))
          V0)
     V2))))
