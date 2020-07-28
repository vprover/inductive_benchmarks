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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (add (s v1) (add (s (s (add (s v3) (s (add (add v8 (s (s v6))) (s (add v5 (add (s (s (s (s v4)))) (s v0))))))))) (s (s (add (s (s v7)) (s v2)))))) (s (add (add (s (s (s (add (s (s (add v5 (add (s (s v1)) v3)))) (s (s (s (s (add (add (add (s (s (s v6))) (s (s v0))) v8) v7))))))))) (s v2)) v4))))))
(check-sat)
