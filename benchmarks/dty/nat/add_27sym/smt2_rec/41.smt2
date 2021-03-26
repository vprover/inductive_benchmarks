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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (add (add (add (s v3) v9) (add (add (add (add (add v5 (s v0)) (s (s v7))) (s (add (s v4) (s v7)))) (s v2)) (s (add (s v2) (s (s (s v1))))))) (s (add v8 (s v6)))) (add (add (s (s (add (add (s (s (s v2))) (s (s (add v7 v8)))) v9))) (add (s v7) (s (s (add v3 (s v0)))))) (add (s (add (add (s (s (add v1 v2))) v4) v6)) (s v5)))))))
(check-sat)
