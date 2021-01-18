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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (add (s (s (add (s (s (add (s (add (add v1 (s v4)) v3)) (s v8)))) v5))) (s (add (s (add v9 (s (add v8 (add (s (s v2)) (add v0 (s (s v9)))))))) (s (add (s (s v7)) (s v6)))))) (s (add (add (s v0) (s (s (s v1)))) (s (add (add (add v4 (add (s (add (add v9 v5) v8)) (s v9))) v3) (s (add (s (s (s (s v8)))) (s (add (s (add (s (s v6)) v7)) (s v2)))))))))))))
(check-sat)
