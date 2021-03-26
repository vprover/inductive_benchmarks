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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat) (v10 nat)) (= (add (s (s (add (s (s v2)) (s (s (add (s (add v4 (s (s v3)))) (add (s v10) (add v5 (add (s v9) v7))))))))) (s (s (add (add v1 (s v6)) (add (s v0) (s v8)))))) (add v5 (add (s (s (s (add (add (add (add v9 v6) v8) v0) (s (s v7)))))) (add (s (add (add (s v1) (s (add (s (s (s v10))) (s (s (s v4)))))) v3)) (s (s v2)))))))))
(check-sat)
