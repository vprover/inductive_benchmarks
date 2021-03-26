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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (add (add (s (add (s (s (s v3))) (add v0 (s v9)))) v5) (add (s (s (add (s (s v2)) (s (s (s (s (s (add (add (s v4) (s v6)) (add v1 (s v0))))))))))) (s (add (s v8) v7)))) (add (add (s (add v2 (s (s v0)))) (s (s (add (s (s v6)) (s (add v4 (s v8))))))) (s (s (s (add (add v7 (s v0)) (s (add v5 (add (s (add (s v9) (s v1))) (s (s v3))))))))))))))
(check-sat)
