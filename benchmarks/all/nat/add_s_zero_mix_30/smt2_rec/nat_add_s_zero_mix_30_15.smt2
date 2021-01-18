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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (s (add (add v1 (s (s (add (add v7 (add (s v1) (s v3))) (s (s (s (s (s (s (add (add (s (s v7)) v4) (s (s (add v2 (s (add (s (s v0)) v6)))))))))))))))) (s (s v5)))) (add (s v2) (s (s (s (add (add (s (s v7)) (s (s v6))) (s (add v1 (s (s (s (s (add (add (s v0) (add (s (s v5)) (s (add (add (s (s v3)) v7) v1)))) (s v4)))))))))))))))))
(check-sat)
