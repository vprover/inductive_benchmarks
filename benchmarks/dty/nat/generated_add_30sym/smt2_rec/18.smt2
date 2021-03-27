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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (add (s (s (s (add (add (s v7) (s (add v0 (add (s v1) v5)))) v8)))) (add (s (s (s (s (s v6))))) (s (add (add (s (add (s v3) v4)) (s zero)) (s (add (s (s v2)) (s v4))))))) (add (s (add (s (s (add v4 v1))) (s (s (s (s (add v2 (s (add (s (add (s (s (add (s (add (s v4) v6)) (s v8)))) (add (s v7) (s (add v5 (s (s zero))))))) v3))))))))) (s v0))))))
(check-sat)
