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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat) (v10 nat)) (= (add (add (s v0) (s (add (s (add (s (add (s v10) (add (s (s v2)) v7))) (add (s (s (s v6))) v4))) (s (s (s (s (s v3)))))))) (add (s (s (add v5 (s v9)))) (add (s v8) v1))) (add (s (s (s (add (add v4 v0) (s (s v1)))))) (s (s (add (s (s (add (s (add v2 v6)) (add (s (s (s (s v3)))) (s v5))))) (add (s v7) (s (s (add (s v9) (add v10 v8)))))))))))))
(check-sat)
