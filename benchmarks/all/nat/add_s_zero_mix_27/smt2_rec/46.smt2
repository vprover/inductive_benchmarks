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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat) (v10 nat) (v11 nat)) (= (add (s (add (add (s v7) v10) (s (add (s v1) (s (s v4)))))) (add (s v9) (add (s v6) (s (add (s (s (s (add (add v2 (add (s v5) v8)) v3)))) (add (add v1 (s v0)) v11)))))) (s (s (add v8 (add (s (s (add (s (s (s (add v5 v6)))) (add (s (s v9)) (add (add (s (add (s (add v1 v1)) v0)) (add v2 v4)) (add (s (s v11)) (s v10))))))) (add v3 v7)))))))))
(check-sat)
