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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (add (s (add (s v6) v5)) (s (add (s (s v4)) (s (s (add (add (s v2) (s (s (s (add (s v1) (s (s (s (s zero))))))))) (add (add v7 (s v0)) (s v3)))))))) (s (s (s (add (s v2) (add (add (add (s (s (s (add (add (s v3) (s (s (s v5)))) (s (s (add (add (s v4) v1) (s (s v6))))))))) v7) (s zero)) (s v0))))))))))
(check-sat)
