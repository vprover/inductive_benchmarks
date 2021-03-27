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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (add (add v2 (s v5)) (s (add (s v5) (s (s (add (s (s (add (s (add (s (add v3 (s v7))) v6)) (s (s (s (s (add (s v6) (add (s v4) (s v1)))))))))) v0)))))) (s (add (add (add v5 (s (s v5))) (s (add (s v4) (add (s (s (s (s (add (add v0 v6) (s v1)))))) (s (s (s (add (s (s (add (s v2) v7))) v3)))))))) (s v6)))))))
(check-sat)
