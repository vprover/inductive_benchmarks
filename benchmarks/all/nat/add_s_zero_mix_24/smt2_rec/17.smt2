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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (add (s (s (s (add (s (add (add (add (s v6) (add (s v3) v4)) (add v5 (s v1))) (s (add (s v5) v8)))) (s (s (s (add (s v7) v0)))))))) (s v2)) (s (s (add (add (s (s (add (s (s (s (add v2 (s (add (s v4) (add v3 (s v5)))))))) (s (add v6 (add v0 (add v1 (s (s v5))))))))) (s v8)) v7)))))))
(check-sat)
