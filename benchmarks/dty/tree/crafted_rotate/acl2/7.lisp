     (DEFUN S (X0) (LIST X0))
     (DEFUN CONS_ (X0 X1) (LIST X0 X1))
     (DEFUN NODE (X0 X1 X2) (LIST X0 X1 X2))
     (DEFUN ADD (X0 X1)
            (COND ((ENDP X0) X1)
                  ((CONSP X0) (S (ADD (CAR X0) X1)))))
     (DEFUN APP (X0 X1)
            (COND ((ENDP X0) X1)
                  ((CONSP X0)
                   (CONS_ (CAR X0)
                          (APP (CAR (CDR X0)) X1)))))
     (DEFUN REV (X0)
            (COND ((ENDP X0) X0)
                  ((CONSP X0)
                   (APP (REV (CAR (CDR X0)))
                        (CONS_ (CAR X0) NIL)))))
     (DEFUN FLATTEN0 (X0)
            (COND ((ENDP X0) X0)
                  ((CONSP X0)
                   (APP (FLATTEN0 (CAR X0))
                        (CONS_ (CAR (CDR X0))
                               (FLATTEN0 (CAR (CDR (CDR X0)))))))))
     (DEFUN SIZE (X0)
            (COND ((ENDP X0) NIL)
                  ((CONSP X0)
                   (S (ADD (SIZE (CAR X0))
                           (SIZE (CAR (CDR (CDR X0)))))))))
     (DEFUN FLATTEN2 (X0 X1)
            (COND ((ENDP X0) X1)
                  ((CONSP X0)
                   (FLATTEN2 (CAR X0)
                             (CONS_ (CAR (CDR X0))
                                    (FLATTEN2 (CAR (CDR (CDR X0))) X1))))))
     (DEFUN ROTATELEFT (X0)
            (COND ((ENDP X0) X0)
                  ((CONSP X0) (COND
                     ((ENDP (CAR (CDR (CDR X0))) X0)
                     ((CONSP (CAR (CDR (CDR X0))))
                            (ROTATELEFT (NODE
                                   (NODE (CAR X0)
                                         (CAR (CDR X0))
                                         (CAR (CAR (CDR (CDR X0)))))
                                   (CAR (CDR (CAR (CDR (CDR X0)))))
                                   (CAR (CDR (CDR (CAR (CDR (CDR X0))))))))))))))
     (DEFUN ROTATERIGHT (X0)
            (COND ((ENDP X0) X0)
                  ((CONSP X0) (COND
                     ((ENDP (CAR X0)) X0)
                     ((CONSP (CAR X0))
                            (ROTATERIGHT (NODE
                                   (CAR (CAR X0))
                                   (CAR (CDR (CAR X0)))
                                   (NODE (CAR (CDR (CDR (CAR X0))))
                                         (CAR (CDR X0))
                                         (CAR (CDR (CDR X0)))))))))))
     (DEFUN MIRROR (X0 X1)
            (COND ((ENDP X0) (= X1 X0))
                  ((AND (CONSP X0) (ENDP X1)) NIL)
                  ((AND (CONSP X0) (CONSP X1))
                   (AND (= (CAR (CDR X0)) (CAR (CDR X1)))
                        (MIRROR (CAR X0) (CAR (CDR (CDR X1))))
                        (MIRROR (CAR (CDR (CDR X0)))
                                (CAR X1))))))
     (DEFTHM THEOREM
             (= (FLATTEN2 (ROTATERIGHT X) NIL)
                (FLATTEN2 X NIL))))
