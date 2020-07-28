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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (add (s (add (s (s (add (add v8 (s v6)) (s (add (add (s v1) v5) (add (s (add (add (s (s (s v8))) (s (s v9))) (s (s v3)))) (add (add (s v4) v7) (s v2)))))))) zero)) (s (s v0))) (add (add (s (add (s v1) (s (add (s v8) (s (s (add (s (s (s v3))) (add (s (add (s v6) (s (add (add (s (s zero)) v8) (s v0))))) v5)))))))) (s (s (add v2 (add v9 v4))))) (s v7))))))
(check-sat)
