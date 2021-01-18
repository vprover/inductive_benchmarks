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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat) (v10 nat)) (= (s (add (add (add (add (add (s v8) (add v5 (s v1))) v4) (s v6)) (add (add (s v0) (s v2)) (add (s v7) v9))) (s (s (s (add (s (add (add v7 (s v10)) (s v3))) (s zero))))))) (add (s (add (add v2 (add (s (s (add v8 zero))) v10)) v7)) (add (s (s (add (add (add (s (s v7)) (s (add v6 (s (add v1 v3))))) (s (s (s (add v9 v5))))) (s (s v0))))) v4))))))
(check-sat)
