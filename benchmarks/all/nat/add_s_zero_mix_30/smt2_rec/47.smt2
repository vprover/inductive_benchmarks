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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat) (v10 nat) (v11 nat)) (= (s (add (s (add (add (add (s (s v1)) v9) (s v10)) (s (s v9)))) (add (s (s (add (add (s v6) (add (s (add v8 (add v4 (s v3)))) (s (add (s (s v7)) (add v0 (add (s v2) v6)))))) v5))) v11))) (s (s (s (add (add v10 (add (add (add (s (add v9 (add v1 (s v0)))) (add v6 v8)) v2) (s (s (add (s v6) (add (s (add v11 (s v3))) v7)))))) (s (s (s (add v5 (add (s (s v4)) (s v9))))))))))))))
(check-sat)
