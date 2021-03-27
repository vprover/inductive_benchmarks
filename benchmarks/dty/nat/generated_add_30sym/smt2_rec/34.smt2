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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (add (add (s (s v7)) (add (s v8) v6)) (add (add (s (add (add v1 (s v0)) (s (s v4)))) (s v1)) (add (s (s (s (s (s (add (add zero (s v9)) (s (s v2)))))))) (add (s v3) (s v5))))) (add (add (s (add (add (add (add (s (s v4)) (s zero)) v0) v7) (s (s v6)))) (s (add (s v1) (s (s (s (s (add (add (add (s (s v9)) (s v1)) (s v8)) (add (s v3) (s v5)))))))))) v2)))))
(check-sat)
