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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat) (v10 nat)) (= (add (s (s (add (s (s (s v0))) v7))) (s (add (s (s (add (s (s v1)) v4))) (add (add (add v10 (s zero)) (s (add v6 (s (add (s (add (s v8) v5)) v9))))) (add (s v2) (add (s v5) v3)))))) (add (add v4 v10) (add (s v5) (s (add (s (add (s v8) (s (add (add (add (add (s (s (s v7))) v6) (s (s v2))) v0) v9)))) (s (add zero (add (s v1) (s (s (add v3 (s (s (s v5)))))))))))))))))
(check-sat)
