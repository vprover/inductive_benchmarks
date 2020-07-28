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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat) (v10 nat) (v11 nat)) (= (add (s (add (add (add (add (s (add v5 (s v9))) v7) v2) (add (add (s zero) v10) (s v4))) (add (s (s v6)) (s v0)))) (s (add (s (s (s (add (s v11) v1)))) (s (add (s v11) (add v8 (s v3))))))) (add (s (add (s (s (add v3 (add v10 (add (add (add (s (s v1)) (s (add (s (add v6 (s (s (add (s (s (s v2))) (add v8 v4)))))) v11))) v0) (s (add (s zero) (s (s (add v7 v9)))))))))) v5)) v11)))))
(check-sat)
