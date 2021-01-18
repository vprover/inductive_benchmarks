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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (s (s (s (add (s (s (add (s v6) (add (add (add (s v8) v4) v7) (s (add (s v3) (s (add v5 (s v2))))))))) (s (add (add v0 (s v5)) (s v1))))))) (add (s (add (s (add (s v4) (s (add (add v7 v8) (add (add v1 (s (s (add (s (s (s v5))) (s (s v2)))))) (s (s (add (s v6) v0)))))))) v5)) v3)))))
(check-sat)
