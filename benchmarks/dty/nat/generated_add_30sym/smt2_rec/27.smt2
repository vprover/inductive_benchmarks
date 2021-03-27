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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat) (v10 nat) (v11 nat)) (= (add (s (s v3)) (add (add (add (s v0) (add (s v9) v4)) (add (add (s v11) (s v1)) (s (add v2 (s v9))))) (s (s (add (add (add v7 (s v8)) (s (add v2 (s (s (s v5)))))) (add (s v10) v6)))))) (s (add (s (s (add (add v11 (add v0 (s (s v3)))) (add (s (add v7 (add v5 (s (add (add v2 v10) (s (s v9))))))) v9)))) (s (add (s (add (s v1) (add v2 (s v8)))) (s (add v6 (s (s v4))))))))))))
(check-sat)
