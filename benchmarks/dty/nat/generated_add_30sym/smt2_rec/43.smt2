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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (add (s (add (add (s (s (add v3 (add (s v7) (s v4))))) (add (add v4 (s (add (add (s v4) v2) v0))) (s v3))) (s (add (add (s v5) (s v1)) (s (s v6)))))) (s (s (s (s (s zero)))))) (add v5 (s (add (s (s (s v4))) (s (s (s (add (add v4 (add (s (add (s v3) zero)) v7)) (s (add (s (s (add v4 (s (add (add (s (s v1)) (add v6 v3)) v2))))) (s (s (s v0))))))))))))))))
(check-sat)
