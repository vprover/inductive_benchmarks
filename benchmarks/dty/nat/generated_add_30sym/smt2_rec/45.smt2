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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat) (v10 nat) (v11 nat)) (= (s (s (s (s (add (add (s v7) v10) (add (add (s v1) (s (s (add (s (s (add (s v6) (add (s (s v5)) v3)))) (add (s v8) (add (s (add v2 (s v11))) v0)))))) (add v6 (add (s v9) v4)))))))) (add (add (add (s (s (s (s v3)))) v1) v6) (s (add (s (s (add (add v5 (s (s (add (add (add (s v6) v0) (s (add (s v11) v4))) (s v8))))) (s (s (add v10 (s (add (s v9) v7)))))))) v2)))))))
(check-sat)
