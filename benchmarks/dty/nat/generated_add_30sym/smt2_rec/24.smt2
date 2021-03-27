(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(define-fun-rec add
    ((x nat) (y nat)) nat
    (match x
        ((zero y)
        ((s x0) (s (add x0 y)))
    )))
(define-fun-rec leq
    ((x nat) (y nat)) Bool
    (match x
        ((zero true)
        ((s x0)
            (match y
                ((zero false)
                ((s y0) (leq x0 y0))
            )))
    )))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat)) (= (s (add (s (s (s (s (s (add (s (s (s (add (add (s (s v4)) (s v2)) v5)))) (add (s v2) (s v0)))))))) (add zero (s (add (s v1) (s (add (s v3) (s (s (s v4)))))))))) (s (s (add (s (s (s (s (s v2))))) (s (s (s (add (s (add (s (add (add (add (add v3 (s (s v2))) (s zero)) v4) v5)) (s (s (s (add v1 (s (s v4)))))))) (s v0))))))))))))
(check-sat)
