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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (add (s (s (add (add (s v7) (s v2)) (add (s (s (add (s v1) (s v4)))) v5)))) (add (add (add v7 (s v0)) (s v7)) (add (s (s (add (s v3) (s zero)))) (add v1 (s v6))))) (add (s (add (add v4 v7) zero)) (s (add (s (s (s (add (s (s v6)) (s (s (add (s (s (add (s (add (s v7) (add v1 (add (s (add v2 (s v7))) v3)))) v0))) v1))))))) v5)))))))
(check-sat)
