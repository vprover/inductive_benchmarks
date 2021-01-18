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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (add (add (s (add (add (s v6) (s (s (s v5)))) (add (add (s zero) (s v0)) (add v3 (s (s (s v4))))))) (s (add (add (s (s v7)) (s v2)) (add v7 (s v0))))) (s (add (s v8) (s v1)))) (add (add (s (s v7)) (s (s (s (add (s (add v8 (s (add (add v5 (add v0 (add v7 v2))) v1)))) (s (s (s (add v3 (add (s (add (s (s (s v4))) (s v0))) (s (s v6)))))))))))) (s zero))))))
(check-sat)
