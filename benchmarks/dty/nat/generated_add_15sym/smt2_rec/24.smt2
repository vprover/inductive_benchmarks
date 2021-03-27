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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat)) (= (s (add (s (add v2 (add (s v1) v0))) (add (s (add (add (s zero) v3) (s v4))) (add (s v5) v6)))) (add (add (add (s (add (add v1 (s (s (add v2 v3)))) (s v0))) (s (s v6))) (add v4 zero)) (s v5))))))
(check-sat)
