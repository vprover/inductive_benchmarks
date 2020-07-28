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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (s (s (s (add (s (s (s (add (add (s (add (add (add v4 (s v2)) (s v7)) (add (s v2) zero))) (s (add (s v0) v8))) (s (add (s v5) v3)))))) (add (s (add (s v1) (add (s v0) v3))) v6))))) (s (add (add v2 (s v3)) (add (add (s v3) (s (s (s v8)))) (add (s v6) (s (s (add (add (add (add (s (add v7 (s v1))) zero) (s (s (add (s (s (add (s v0) (s v2)))) v0)))) v4) v5)))))))))))
(check-sat)
