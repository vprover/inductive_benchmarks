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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (add (add (add (add (add (add (s v2) v7) zero) (s v9)) (s v8)) (s v5)) (add (s (s (s v3))) (add (add (s v9) (s (s (add v6 (s (s v1)))))) (s (add (s (s v4)) v0))))) (s (add (s (add (add v9 (s (add (add v6 (s v9)) (s (add v0 (add (s (add (add (s v5) (s (s (s (s v8))))) v3)) (add (s (add (s (s v1)) zero)) (s v2)))))))) v7)) v4))))))
(check-sat)
