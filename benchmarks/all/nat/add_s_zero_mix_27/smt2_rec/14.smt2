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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (add (s v4) (add (add (s (s (s (s (add (s (s (add (s (s v5)) (s v7)))) (s v0)))))) (add (add v3 (s (add (s v6) v1))) (s (s v2)))) (s (add (s zero) zero)))) (add v0 (add (s (s (s v7))) (add (s v2) (add (s (s zero)) (s (add (s (add (s v1) (s (add (s (s v4)) (s (s (add (add (s v3) (s v5)) (s v6)))))))) zero))))))))))
(check-sat)
