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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (s (s (s (add (s (s (s (add (add (add (s v9) v8) (add (s v3) (add (s v4) (s (s (add v5 (s v7))))))) (add (add (s v6) v2) v0))))) (s (s (add (s v1) v8))))))) (add (s (s (add (add (add (s (s (s v4))) (s (s v8))) v7) v0))) (add (s (s (add (add v5 v3) (add v2 (add v6 (s (s v1))))))) (s (add v8 (s (s (s (s v9))))))))))))
(check-sat)
