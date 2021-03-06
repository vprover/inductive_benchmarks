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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (add (add (s (s (add (s (s (add v6 (s (s v0))))) (add (s v4) (s (add (s v5) v2)))))) (s (add (s (s v7)) v1))) (s v3)) (s (add (add (add (s (s (s v0))) (add (s (s (s (s (s (s (s v3))))))) v6)) v7) (add (add (s (s (add v4 v1))) v5) v2)))))))
(check-sat)
