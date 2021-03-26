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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (s (add (add (add (s v5) v0) (s (s v7))) (add (add (s (s (add v4 (s v6)))) (add (s (s v1)) (s (add (add (add (add (s v2) v9) (s v8)) zero) (s (s v3)))))) (s (add (s zero) (s v0)))))) (add (s (add (s (add zero (s (s v0)))) v6)) (s (s (add (add (add (s (add v0 (s (add (s (s (add v5 zero))) (s v8))))) v3) (s (add (s (add (s v1) (add (s v4) v9))) v2))) (s (s v7))))))))))
(check-sat)
