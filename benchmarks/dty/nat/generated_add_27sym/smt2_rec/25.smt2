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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (s (add (add v5 (add (add (s v0) v3) (s (add (add (s (s v6)) (s (s (s (add v7 (s v1)))))) (s (s (s v2))))))) (s (s (s (add (s v2) (s (s v4)))))))) (s (s (s (s (s (add (s (s (s (s v7)))) (add (add v1 v6) (s (s (s (add (s (add (add (s (add (s (s (s v3))) v2)) (s v0)) v4)) (add v5 v2))))))))))))))))
(check-sat)
