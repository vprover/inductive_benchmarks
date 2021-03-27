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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (add (add (add (add (add v7 (s (s (s (add v0 (s v2)))))) v8) (add (add (add v3 (add (s v5) (s v0))) (s (s v9))) (s v4))) (add (add (s v3) v1) v6)) (add (s (s (s (add zero (s v4))))) (s v9))) (add (add (add v3 (s (add v4 (s (add (add v9 v0) (add (add (add v7 (add (s v5) (s v0))) (s (s v1))) (s (s (add (add v6 (s v3)) (s (add v8 (s (add v9 zero))))))))))))) (s (s (s v2)))) (s v4))))))
(check-sat)
