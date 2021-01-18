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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (s (s (s (add (add (add (add v0 (s (add v6 (s (s (s v2)))))) (add (s v3) (s v1))) (add (add (s v7) v8) (s (s (s (s (add v5 (s v4)))))))) (s (s v9)))))) (s (add v1 (s (add (add (s (s (s v5))) (add (s (s v7)) v3)) (s (add (add v9 (s (s (add (add (s v2) (s (add v4 v8))) (s (s (s v6))))))) (s (s v0))))))))))))
(check-sat)
