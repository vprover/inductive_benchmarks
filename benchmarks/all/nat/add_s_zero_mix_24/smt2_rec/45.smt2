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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat) (v10 nat) (v11 nat) (v12 nat)) (= (add (s (s (add (add (s (add v9 (add (s v10) v4))) (s (add (add (s v2) v11) (add v7 (s v3))))) (s (s (add v1 (add (add v8 (s v12)) v0))))))) (add (s v5) v6)) (s (add (add (s (s (add (add (add (s (add (add v4 (add v3 (s v10))) v0)) (s v11)) v9) (add (s v6) (add (add v2 v5) v7))))) (s (s (add (s v12) v1)))) (s v8)))))))
(check-sat)
